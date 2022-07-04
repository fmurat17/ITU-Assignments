/* @Author
Student Name: Fatih MURAT
Student ID : 150170039
Date: 13.11.2019 */

#include <iostream>
#include <stdlib.h>
#include <string.h>
#include <iomanip>

#include "task_management_tool.h"

using namespace std; 


void WorkPlan::display(bool verbose,bool testing)
{
	string inone="***";
	if (head!=NULL)
	{
		Task *pivot =new Task;
		Task *compeer =new Task;
			
		pivot=head;
		do
		{
			if(testing)
				inone+=" ";
			else
				cout << pivot->day <<". DAY"<< endl;
			compeer=pivot;
			while(compeer!=NULL)
			{
				string PREV= compeer->previous!=NULL?compeer->previous->name:"NULL";
				string NEXT=compeer->next!=NULL?compeer->next->name:"NULL";
				string CONT=compeer->counterpart!=NULL?compeer->counterpart->name:"NULL";
				if (testing)
					inone+=compeer->name;
				else
					if(verbose)
						cout<<"\t"<<setw(2)<< compeer->time <<":00\t"<< PREV<<"\t<- "<< compeer->name <<"("<< compeer->priority <<")->\t"<<NEXT <<"\t |_"<<CONT<<endl;
					else
						cout<<"\t"<<setw(2)<< compeer->time <<":00\t"<< compeer->name <<"("<< compeer->priority <<")"<<endl;				
				compeer=compeer->counterpart;
			}
			pivot=pivot->next;
		}while(pivot!=head);
		if(testing)
		{
			cout<<inone<<endl;
			cout<<"(checking cycled list:";
			if (checkCycledList())
				cout<<" PASS)"<<endl;
			else
				cout<<" FAIL)"<<endl;
		}
	}
	else
		cout<<"There is no task yet!"<<endl;
}

int WorkPlan::getUsableDay()
{
	return usable_day;
}

int WorkPlan::getUsableTime()
{
	return usable_time;
}


void WorkPlan::create()
{		
	head = NULL;
	usable_day = 0;				// We assign this this values to use them in functions properly.
	usable_time = 0;
}

void WorkPlan::close(){
	
	Task *tailptr = head;		
	Task *temp = head;			
	temp = temp -> counterpart;
	
	do{										//First we delete counterpart nodes of each days from head to end one by one.
		temp = tailptr -> counterpart;		//To be able to start from the head, i use do-while loop.
	    while((temp != NULL)){	        	
			remove(temp);
	        temp = tailptr -> counterpart;
	    }
	    tailptr = tailptr -> next;	    
	}while(tailptr != head);
	
	tailptr = tailptr -> next;			//After we delete all the counterparts, we come back to the head->next and from head -> next to the end we delete all nodes.
	while(tailptr != head){				//We check if only head node is remaining. If it is tailptr must points to the head node. So we pass this while block and remove head.
	    remove(tailptr);
		tailptr = head -> next;	    
	}
	
	remove(head);							
}

void WorkPlan::add(Task *task)
{
    if(head == NULL){									//First, i check if head is equal to NULL. If it is, it means that we havent created any node yet.
        head = new Task;								//We put informations to head node.
        head -> day = task -> day;
        head -> time = task -> time;
        head -> priority = task -> priority;
        head -> name = new char [strlen(task->name)];		//We take place from memory to assign name.
        strcpy(head -> name, task -> name);					// This line, copies task->name to head -> name.
        head -> previous = head;							//Both these lines are in order to create circular structure.
	    head -> next = head;
	    head -> counterpart = NULL;							
	    return;		//After we've created head node, we terminate the function.
    }
    
    Task *cpytask = new Task;						//If head node is created, we come to this line. Since "Task task;" line is outside of the while loop
    cpytask -> day = task -> day;					//in order to take difference adresses from the memory we copy the task's informations to new pointer
    cpytask -> time = task -> time;					//called cpytask;
    cpytask -> priority = task -> priority;				
	cpytask ->name=new char [strlen(task->name)];
    strcpy(cpytask -> name, task -> name);
    cpytask -> next = NULL;							// This NULL assignments for escaping from any segmentation fault.
    cpytask -> previous = NULL;
    cpytask -> counterpart = NULL;
    
    if(cpytask -> day < head -> day){       		//This and the next if blocks are the extreme situations in case of the changing of head pointer's node.
        head -> previous -> next = cpytask;
        cpytask -> previous = head -> previous;		//If cpytask -> day is smaller than head node, we put cpytask to left of the head node and we assign
        head -> previous = cpytask;					// head to cpytask.
        cpytask -> next = head;
        head = cpytask;
        return;
    }
    if((cpytask -> day == head -> day) && (cpytask -> time < head -> time)){	//If "cpytask -> day == head -> day" and "cpytask -> time < head -> time"
        head -> previous -> next = cpytask;										//we put cpytask to above of head node and we assign head pointer to cpytask.
        cpytask -> previous = head -> previous;
        cpytask -> next = head -> next;
        head -> previous = NULL;
        head -> next -> previous = cpytask;
        head -> next = NULL;
        cpytask -> counterpart = head;
        head = cpytask;
        return;
    }
    
	Task *iterptr = head;			//We create new pointer that points to head.
    do{
        if(cpytask -> day == iterptr -> day){			//After we are done with the any change of head pointer's place, we come to this line.
            if(cpytask -> time < iterptr -> time){		//Since we are working with circular list, our terminating situation in the while loop is
                iterptr -> previous -> next = cpytask;	//when iterptr point reach to head.
                iterptr -> next -> previous = cpytask;	//But, in order to start from beginnig to back to the beginnig, do-while loop amazingly does this job.
                cpytask -> next = iterptr -> next;		
                cpytask -> previous = iterptr -> previous;	//This if block checks if we need to add cpytask to day that already exists.
                cpytask -> counterpart = iterptr;			//If cpytask -> time is less than the node, we put cpytask to above him with proper link operations.		
                iterptr -> next = NULL;	
                iterptr -> previous = NULL;
                return;
            }
            Task *traverse = iterptr;			// We define new Task pointer that is equal to iterptr.
            while(iterptr != NULL){				// If we come to this line, it means that cpytask is equal or smaller than the iterptr.			
                if(cpytask -> time <= iterptr -> time) break; // We find the line that we are going to operate on it.
                traverse = iterptr;
                iterptr = iterptr -> counterpart;
            }
            if(iterptr == NULL){					//if iterptr is NULL, it means that we come to the end of the day.
                traverse -> counterpart = cpytask;	//So we add cpytask to last part of the day.
                cpytask -> counterpart = NULL;		//In order to avoid of segmentation fault.
                return;
            }
            if(iterptr -> time > cpytask -> time){	//if cpytask's time is smaller than we put cpytask to right before the iterptr.
                traverse -> counterpart = cpytask;
                cpytask -> counterpart = iterptr;
                return;
            }
            if(iterptr -> time == cpytask -> time){		//We still check our position to know about why cpytask stopped there.
                if(cpytask -> priority > iterptr -> priority){	// if we are in this block it means that iterptr -> time is equal to cpytask -> time. So, days are equal, times are equal, we need to compare priorities.
                    checkAvailableNextTimesFor(iterptr);	//Since days and times are equal, one pointer's position needs to be changed to the next available spot.
                    int x = iterptr -> priority;			//We change priorities and the names each other.
                    iterptr -> priority = cpytask -> priority;
                    cpytask -> priority = x;
                    char arr[5];
                    strcpy(arr, iterptr -> name);
                    strcpy(iterptr -> name, cpytask -> name);
                    strcpy(cpytask -> name, arr);
                    cpytask -> day = getUsableDay();	
                    cpytask -> time = getUsableTime();
                    cpytask -> counterpart = NULL;
                    
                    add(cpytask); //After we assign all the informations, we add cpytask to node.
                    return;
                }
                if(cpytask -> priority < iterptr -> priority){//if iterptr has priority, we dont change anything about iterptr.
                    checkAvailableNextTimesFor(iterptr);	//We add cpytask to proper place of the list in terms of available day respect to iterptr.
                    cpytask -> day = getUsableDay();
                    cpytask -> time = getUsableTime();
                    cpytask -> name = task -> name;
                    cpytask -> counterpart = NULL;
                    
                    add(cpytask);
                    return;
                }
            }
            
        }
        if(cpytask -> day < iterptr -> day){ // if day of the cpytask doesnt exist, we add it to proper place according to cpytask's day.
            iterptr -> previous -> next = cpytask;
            cpytask -> previous = iterptr -> previous;
            cpytask -> next = iterptr;
            iterptr -> previous = cpytask;
            return;
        }

        iterptr = iterptr -> next; //Untill we find the proper position to do opeations, we iterate over while loop.
    }while(iterptr != head);
    
	iterptr = head -> previous;
    iterptr -> next -> previous = cpytask;	// If we go outside of do-while loop, it means that we come to the beginning and this means that 
    cpytask -> next = iterptr -> next;		//cpytask needs to be added to end of the list.
    iterptr -> next = cpytask;
    cpytask -> previous = iterptr;
    return;
} 

Task * WorkPlan::getTask(int day, int time)
{   
    Task *fndptr = head;
    if(head == NULL) return NULL;				 
	do{
	    if(fndptr -> day == day){			//Again, in order to start from head pointer we use do-while loop.
	        while(fndptr != NULL){			//First we go to the day wanted, and then we iterate over counterpart list untill we reach to the time.
	            if(fndptr -> time == time){
	                return fndptr;
	            }
	            fndptr = fndptr -> counterpart;
	        }
	        return NULL;
	    }
	    fndptr = fndptr -> next;  
	}while(fndptr != head);
	return NULL;
}


void WorkPlan::checkAvailableNextTimesFor(Task *delayed)	//We assign usable day and usable time to values according to pointer that is wanted to be delayed.
{	
    if(head == NULL) return;
    Task *temp = delayed;
    while(temp -> counterpart != NULL){
        if(temp -> counterpart -> time - temp -> time > 1){	//We look for available time in the counterpart list of the delayed pointer.
            usable_time = temp -> time + 1;
            usable_day = temp -> day;
            return;
        }
        temp = temp -> counterpart;	//We iterate untill temp -> counterpart becomes NULL.
    }
    
	Task *daytracker = head;				//If we come to here it means that we couldn't find available day at the same day.
    while(daytracker -> day != delayed -> day){//So we keep searching in next days.
        daytracker = daytracker -> next;		//We bring daytracker pointer to delayed -> day.
    }
    
	daytracker = daytracker -> next; //We carry our daytracker pointer to one node after from the day of delayed pointer.
    temp = daytracker;
    while(daytracker != head){
        if(daytracker -> time > 8){			//If 8 is available we immediately place delay pointer to 8:00 of one day after.
            usable_time = 8;
            usable_day = daytracker -> day;
            return;
        }
        
        while(temp -> counterpart != NULL){	//If we come to this line, it means that there is no available time before the first time of the day that daytracker points to.
            if(temp -> counterpart -> time - temp -> time > 1){
                usable_time = temp -> time + 1;
                usable_day = temp -> day;							//If 8:00 is not available we find proper place on the counterpart list.
                return;
            }
        temp = temp -> counterpart;
        }

        daytracker = daytracker -> next; //Untill we reach head, we keep searching for all days to find available time.
    }
    
	while(daytracker -> day != delayed -> day){	//If we come to this line, it means that we couldnt any available time among the existing times of the days.
        daytracker = daytracker -> next;
    }
												// So we need to create available day.
	do{
        if(daytracker -> next -> day - daytracker -> day > 1){ //We look for space among the existing days.
            usable_day = daytracker -> day + 1;
            usable_time = 8;
            return;
        }
        daytracker = daytracker -> next;
    }while(daytracker != head);
    
    usable_day = head -> previous -> day + 1;	//If we come to here, it means that still we couldn't find a available place to delay. It means we need to
    usable_time = 8;							// create new day end of the list(head->previous).
}

void WorkPlan::delayAllTasksOfDay(int day)
{
	Task *iter = head;
	while(iter -> day != day){ //We carry iter to day's first node.
		iter = iter -> next;
	}		
	while(iter != NULL){
		Task *temp = new Task;
		temp -> day = iter -> day;
		temp -> time = iter -> time;
		temp -> priority = iter -> priority;		//We copy the informations of iter to temp.
		temp -> name = new char(strlen(iter -> name));
		stpcpy(temp -> name, iter -> name);
		
		while(temp -> day == day){
			checkAvailableNextTimesFor(temp);	//Until we find the usable time and usable day different from current day, we look for available day.
			temp -> day = getUsableDay();
			temp -> time = getUsableTime();		
		}
		add(temp);					//After we find the usable day we put it to available place that we already spot.
		temp = iter;
		iter = iter -> counterpart;	
		remove(temp);
	}	
}

void WorkPlan::remove(Task *target)
{
    if(target -> next != NULL){ //This part inspects the probability of being of target in the middle of list with counterparts and without counterpart.
        if(target -> counterpart != NULL){//Removing the node that it has counterparts and has next and previous nodes.
            target -> previous -> next = target -> counterpart;
            target -> next -> previous = target -> counterpart;		 
            target -> counterpart -> next = target -> next;
            target -> counterpart -> previous = target -> previous;
            target -> next = NULL;
            target -> previous = NULL;
            if(target == head){	//This line means that we come to the head, we check head's situation if it has counterparts or not.
				if(head -> counterpart == NULL) head = head -> next;//After we determine head's situation we change head's position and we delete former head.
                head = target -> counterpart;
            }
            delete(target);
        }else if(target -> counterpart == NULL){ // if target's counterpart is NULL, we link its next and its previous and we delete target.
            target -> next -> previous = target -> previous;
            target -> previous -> next = target -> next;
            if(target == head){ //We again check head.
                head = target -> next;
            }
            delete(target);
        }
    }else{//If we come to this line it means that target is in the counterpart line.
        Task *incptr = head;
        while(incptr -> day != target -> day){ // first we go to the target's day via incptr.
            incptr = incptr -> next;
        }
        while(incptr -> counterpart != target){ // second we go to the node that one time before of the target via incptr.
            incptr = incptr -> counterpart;
        }
        incptr -> counterpart = target -> counterpart; // We link incptr -> counterpart with target-> counterpart and then we delete target.
        delete(target);
    }
}

bool WorkPlan::checkCycledList()
{				
	Task *pivot=new Task();
	pivot=head;
	int patient=100;
	bool r=false;
	while (pivot!=NULL&&patient>0)
	{		
		patient--;
		pivot=pivot->previous;
		if(pivot==head)
		{
			r=true;
			break;
		}
	}
	cout<<"("<<100-patient<<")";
	patient=100;
	bool l=false;
	while (pivot!=NULL&&patient>0)
	{		
		patient--;
		pivot=pivot->next;
		if(pivot==head)
		{
			l=true;
			break;
		}
	}
	return r&l;
}