import socket
import hashlib
import sys
import threading
import numpy as np
import pickle
import os

HOST = '127.0.0.1' 
PORT = 65432       

privateString = "IXTqClXGGdNlHaIeWzEGCtFVDjQHukch"
randomString = ""
flag = True
isGameStarted = False
isGameTerminated = False

#################### Client Messages ####################
def sendStartGame(serverSocket):
	packet_type = 0

	packet = []
	packet.append(np.uint8(packet_type))

	packetToSend = pickle.dumps(packet)
	serverSocket.sendall(packetToSend)

def sendTerminateGame(serverSocket):
	packet_type = 1

	packet = []
	packet.append(np.uint8(packet_type))

	packetToSend = pickle.dumps(packet)
	serverSocket.sendall(packetToSend)

def sendGetRemainingTime(serverSocket):
	packet_type = 2

	packet = []
	packet.append(np.uint8(packet_type))

	packetToSend = pickle.dumps(packet)
	serverSocket.sendall(packetToSend)

def sendGuess(serverSocket, guessedNumber):
	packet_type = 3
	payload = guessedNumber
	payload_size = sys.getsizeof(payload)

	packet = []
	packet.append(np.uint8(packet_type))
	packet.append(np.uint8(payload_size))
	packet.append(payload)

	packetToSend = pickle.dumps(packet)
	serverSocket.sendall(packetToSend)

#########################################################


def inputHandler(serverSocket):
	global isGameStarted
	global isGameTerminated

	print("Type 'S' to start the game\nType 'T' to terminate the game\nType 'R' to know the remaining time")

	while not isGameTerminated:
		userInput = input()

		if userInput == "S":
			if isGameStarted:
				print("Game is alrady started! Please guess the number or guess if it is even or odd!")
				continue
			else:
				isGameStarted = True
				sendStartGame(serverSocket)
		elif userInput == "T":
			sendTerminateGame(serverSocket)
			break
		elif userInput == "R":
			sendGetRemainingTime(serverSocket)
		else:
			try:
				guessedNumber = int(userInput)
				if guessedNumber < 0 or guessedNumber > 36:
					print("Please enter a number in the range of [0, 36] !")
					continue
				else:
					sendGuess(serverSocket, userInput)
					return
			except:
				if userInput == "odd":
					sendGuess(serverSocket, userInput)
					return
				elif userInput == "even":
					sendGuess(serverSocket, userInput)
					return
				else:
					print("Please enter a valid input! S, R, T, odd, even or number between 0 and 36 !")
					continue

def gameHandler(serverSocket):
	global isGameStarted
	global isGameTerminated

	threading.Thread(target = inputHandler, args = (serverSocket,)).start()

	while True:
		receivedMessage = pickle.loads(serverSocket.recv(1024))
		#print(f"DEBUG: {receivedMessage}")
		if receivedMessage:
			if receivedMessage[0] == 0: # Question
				print(receivedMessage[2])
			elif receivedMessage[0] == 1: # Remanining Time
				if isGameStarted:
					print(f"Remaining Time: {receivedMessage[2]}")
				else:
					print("Game has not been started yet! You will have 30 seconds to guess!")
			elif receivedMessage[0] == 2: # End of Game
				isGameStarted = False
				isGameTerminated = True
				if receivedMessage[2] == 0:
					print("Game is terminated by user")
				elif receivedMessage[2] == -2:
					print("Time is up!")
					sendTerminateGame(serverSocket)
				else:
					print(f"Game is end! The result is {receivedMessage[2]}")
				serverSocket.close()
				os._exit(1)
	
if __name__ == "__main__":
	serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	serverSocket.connect((HOST, PORT))
	serverSocket.sendall("Start_Connection".encode("utf-8"))

	data = serverSocket.recv(1024)
	randomString = data.decode("utf-8")
	#print(f"Received random string => {randomString}")
	sha1Result = hashlib.sha1((randomString + privateString).encode("utf-8")).hexdigest()
	#print(sha1Result)
	serverSocket.sendall(sha1Result.encode("utf-8"))

	while flag:
		data = serverSocket.recv(1024).decode("utf-8")
		if data == "succesful":
			while True:
				answer = input("Authentication succesful. Do you wish to proceed? (Y/N)")
				if answer == 'Y':
					serverSocket.sendall(answer.encode("utf-8"))
					threading.Thread(target = gameHandler, args =  (serverSocket,)).start()
					flag = False
					break
				elif answer == 'N':
					sys.exit()
				else:
					print("Please enter 'Y' or 'N'")
