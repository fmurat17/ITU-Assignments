/* @Author
Student Name: Fatih MURAT
Student ID: 150170039
Date: 22.10.2019 */

#include <iostream>
#include <stdio.h> //fopen(), fscanf(), EOF

using namespace std;

struct node{
    int size; // part of the node that shows the size of shoes
    int quant; // part of the node that shows the amount of the sizes
    node *next; // part of the node that will point to the another node that provide us to create our linked list.
};

struct stock{
    node *head;	// head poiner that points to another node and the important part of the program.
    void create(); // function that creates the head pointer
    void add_stock(int); // function that if the number that came from input.txt is positive, inserts the number to appropriate position to the linked list in ascending order. 
    void sell(int); // function that if the number that came from the input.txt is negative, decreases the quant of the proper node by 1 and if any quant becomes 0 or the node that we have searched for it doesn't exist, prints NO_STOCK and deletes the node with 0 quant.
    void current_stock(); // function that if the number that came from input.txt is zero, displays the current stock with sizes and the quants that match with the proper size.
    void clear(); // function that deletes all the nodes of the linked list at the end of the main function.
};


void stock::create(){    
	head = NULL; // We have created head pointer and assigned it to NULL.
}

void stock::add_stock(int num){
    
    node *newptr = new node; // We have created new pointer that points to the our new node.
    newptr -> size = num; // We have assigned num to the new node's size part.
    newptr -> quant = 1; // We have assigned quant to the new node's quant part as 1.
    
    if(head == NULL){ // This line checks the if head pointer is NULL which means there is not a linked list yet.
        head = newptr; // With this line head pointer becomes equal to the first and new pointer. Therefore we have created first node of our linked list.
        head -> next = NULL; // We have assigned node's next part to the head to prevent memory errors.
    }

    else if(head -> next == NULL){ // If first node is already created, then this else if part operates its flow.
        if(num > head -> size){ // If num is bigger than head pointer's size, new pointer becomes the second node.
            head -> next = newptr;
            newptr -> next = NULL; // We have assigned node's next part to the head to prevent memory errors.
        }else if(num < head -> size){ // If num is smaller than head pointer's size, new pointer pointer becomes head pointer.
            newptr -> next = head;
            head = newptr;
        }else{ // If the size of the node that new pointer points is equal to head pointer's size, quant of the node that head pointer points is increased by 1.
            head -> quant++;
        }
    }else{ // If the first two nodes is already created, following operations flows to create other nodes of the linked list if exist.
        if(num < head -> size){ // Checks if the coming node is smaller than the node that headpointer points(First node).
            newptr -> next = head;// If it is, newptr becomes head pointer(It means that if the coming node is the smallest one among the linked list in terms of sizes, we insert the new node to the starting of the linked list).
            head = newptr;
        }else{ // If the program comes to this else block, it means that incoming node(new node) is not the smallest one, so we should find the proper place to insert the new node.
			node *iter = head; 
			node *tail = NULL; // tail pointer follows the iter pointer by one node behind.
			while(iter != NULL){
				if(iter -> size >= num) break;	//With this while block, we determine the place that we are going to insert our new node.
				tail = iter;					//But we don't know if the new node's size is already exist.
				iter = iter -> next;			//Therefore, we check it below and execute the flow according to the detection.
			}
			if(iter == NULL){ // This if block checks if iter pointer is NULL, which means we are at the end of the linked list and it means that the size of the new node is the biggest one among the sizes that exists among the linked list.      
				tail -> next = newptr; // We add our new node to the end of the linked list.
				newptr -> next = NULL; // We assigned our newptr -> next to NULL to prevent memory errors again.
			}else if(iter -> size == num){ // If our new node's size is equal to the iter pointer's size, we increase iter pointer's quant by 1.
				iter -> quant++;
				delete newptr; // Since newptr has been created at this point but will not be used, we need to delete newptr to prevent memory leak.
			}else{
				newptr -> next = iter; // We have inserted our new node to the proper place of the linked list(to the middle of the list somewhere, not to the beginning or end).  
				tail -> next = newptr;
			}
        }
    }
}

void stock::sell(int num){
    
	node *iterptr = head;
    node *tailptr = NULL;
    
	while(iterptr != NULL){					// With this while loop, we again determine the proper place of the node that either we are going decrease its quant by 1 or delete it from the list.
        if(iterptr -> size >= num) break;	// There is also possibilty of not being of the size that we are looking for.
        tailptr = iterptr;					// After we determined the place that we are going to work on it, following if else blocks executes the proper operations.
        iterptr = iterptr -> next;
    }
	
	if(iterptr == NULL) cout << "NO_STOCK" << endl; // This line means that we are at the end of the linkes list and we don't have the size that we are looking for. Therefore, we print NO_STOCK immediately.
    else if(iterptr -> size > num) cout << "NO_STOCK" << endl; // This line means that we have stopped at this place but not beacause of we have found the node that we are looking for, but because of the node's size is bigger than the node that we are looking for. Therefore, we print NO_STOCK immediately.
    else if(iterptr -> quant > 1) iterptr -> quant--; // This line means that we have found the node that we are looking for and its quant is bigger than 1 and we decrease the quant by 1.
    else if(iterptr == head){ // This line means that we have found the node that we are looking for and it's quant is 1 and this node is also head node. So it requires special border operation.
        head = head -> next;// We execute the special border operation here.
        delete iterptr;
    }
    else{ // This line means that we have found the node that we are looking for and it's quant is 1 and it's not head node. So we decrease the quant of the node by 1 and it's quant becomes 0. So we need to delete this node from the list and we do it.
        tailptr -> next = iterptr -> next;
        delete iterptr; // We deleted the node since it's quant is 0 which means it is not in our stocks anymore.
    }    
}

void stock::clear(){ // With this function, we delete all the nodes in the linked list at the end of the program.
    
	node *dltptr = head;
    
	while(dltptr != NULL){
        head = head -> next;
        delete dltptr;
        dltptr = head;
    }
}

void stock::current_stock(){ // With this function, we display the current stock with sizes and matching quants when it is called.
    
	node *prntptr = head;
    
	while(prntptr != NULL){
        cout << prntptr -> size << ":" << prntptr -> quant << endl;
        prntptr = prntptr -> next;
    }
}


int main(int argc, char *argv[]){
        
    stock shoes;
    shoes.create();
    int num;
        
    FILE *fptr; // We have created fptr that points to file.
    fptr = fopen(argv[1], "r"); // We have opened our file with "r" method, so we can only read from the file.
    
	if(fptr == NULL){ // If the file can't be opened beacuse of the special reasons, program will be terminated.
		cout << "ERROR!!!File cannot be opened!!!" ;
		return 1; // Terminating line.
	}
	
	while(fscanf(fptr, "%d", &num) != EOF){ // It reads the file to the end of file(EOF) and takes numbers as integer("%d").
	    if(num > 0){
	        shoes.add_stock(num);
	    }else if(num < 0){
			num = -num; // Since the numbers that came from the file at this block is negative, we have converted them to the positive.
	        shoes.sell(num);
	    }else{
	        shoes.current_stock();
	    }
	}
	
    void clear();
    return 0;
}