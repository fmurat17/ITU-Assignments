import socket
import hashlib
import string
import sys
from random import choice
import threading
import time
import random
import pickle
import numpy as np


HOST = '127.0.0.1' 
PORT = 65432       

privateString = "IXTqClXGGdNlHaIeWzEGCtFVDjQHukch"
randomString = ""
authenticationString = ""
numberToGuess = random.randint(0,36)
proceedTimer = False
isGameStarted = False
remainingTime = 30
gameResult = 0

def randomStringGeneratorOfLen32():
	return ''.join(choice(string.ascii_letters) for i in range(32))

#################### Server Messages ####################
def sendQuestionMessage(clientSocket):
	packet_type = 0
	payload = "What is your guess? Number, even, odd?"
	payload_size = sys.getsizeof(payload)

	packet = []
	packet.append(np.uint8(packet_type))
	packet.append(np.uint8(payload_size))
	packet.append(payload)

	packetToSend = pickle.dumps(packet)
	clientSocket.sendall(packetToSend)

def sendRemainingTime(clientSocket):
	global remainingTime
	packet_type = 1
	payload = remainingTime
	payload_size = sys.getsizeof(payload)

	packet = []
	packet.append(np.uint8(packet_type))
	packet.append(np.uint8(payload_size))
	packet.append(np.uint16(payload))

	packetToSend = pickle.dumps(packet)
	clientSocket.sendall(packetToSend)

def sendEndOfGame(clientSocket):
	global gameResult
	packet_type = 2
	payload = gameResult
	payload_size = sys.getsizeof(payload)

	packet = []
	packet.append(np.uint8(packet_type))
	packet.append(np.uint8(payload_size))
	packet.append(np.int16(payload))

	packetToSend = pickle.dumps(packet)
	clientSocket.sendall(packetToSend)

#########################################################

# Function to send remaining time in every 3 seconds asynchronously
def serverRemainingTimeSender(clientSocket):
	global proceedTimer
	global remainingTime
	global gameResult

	time.sleep(0.1)
	while remainingTime >= 0 and proceedTimer:
		#print("sending time")
		if remainingTime % 3 == 0:
			sendRemainingTime(clientSocket)
		if remainingTime == 0:
			gameResult = -2
			sendEndOfGame(clientSocket)
			return
		remainingTime -= 1
		time.sleep(1)

def gameHandler(clientSocket):
	global proceedTimer
	global isGameStarted
	global gameResult

	while True:
		receivedMessage = pickle.loads(clientSocket.recv(1024))
		#print(f"DEBUG: {receivedMessage}")
		if receivedMessage:
			if receivedMessage[0] == 0: # start game
				proceedTimer = True
				threading.Thread(target = serverRemainingTimeSender, args =  (clientSocket,)).start()
				isGameStarted = True
				print("Game is started")
				print(f"Number to guess: {numberToGuess}")
				sendQuestionMessage(clientSocket)
			elif receivedMessage[0] == 1: # terminate game
				proceedTimer = False
				isGameStarted = False
				sendEndOfGame(clientSocket)
				clientSocket.close()
				sys.exit()
			elif receivedMessage[0] == 2: # get remaining time
				sendRemainingTime(clientSocket)
			elif receivedMessage[0] == 3: # guessing the number
				proceedTimer = False
				try:
					numberFromUser = int(receivedMessage[2])
					if numberFromUser == numberToGuess:
						gameResult = 35
				except:
					if receivedMessage[2] == "odd" and numberToGuess % 2 == 1:
						gameResult = 1
					elif receivedMessage[2] == "even" and numberToGuess % 2 == 0:
						gameResult = 1
				finally:
					if gameResult == 0:
						gameResult = -1
					#print(gameResult)
					sendEndOfGame(clientSocket)
					clientSocket.close()
					sys.exit()

def serverHandler(clientSocket):
	while True:
		data = clientSocket.recv(1024).decode("utf-8")
		#print(f"Received data => {data}")
		if data == "Start_Connection":
			print("Connection is established!")
			clientSocket.sendall(randomString.encode("utf-8"))
		elif data == authenticationString:
			print(f"Authentication string is {authenticationString}")
			print(f"Authentication string that comes from client is {data}")
			print("Matching! Authentication succesful!")
			clientSocket.sendall("succesful".encode("utf-8"))
		elif data == "Y":
			print("User wants to proceed")
			gameHandler(clientSocket)
			break
		else: #N
			print("User does not want to proceed")
			clientSocket.close()
			break

if __name__ == "__main__":
	randomString = randomStringGeneratorOfLen32()
	print(f"Random String => {randomString}")
	authenticationString = hashlib.sha1((randomString + privateString).encode("utf-8")).hexdigest()

	serverTCPSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	serverTCPSocket.bind((HOST, PORT))
	serverTCPSocket.listen()

	clientSocket, clientAddress = serverTCPSocket.accept()

	serverHandler(clientSocket)
