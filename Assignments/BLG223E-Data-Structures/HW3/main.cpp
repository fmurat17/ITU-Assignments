/* @Author
Student Name: Fatih MURAT
Student ID: 150170039
Date: 19.12.2019 */

#include <iostream>
#include <string>  // stoi(), getline()
#include <fstream> 

using namespace std;

struct nodeMH{
    int MHvalue;	//This node holds the mobile hosts' values.
    nodeMH *next;	// While adding a mobile host, i use this node.
};

struct nodeBS{	// While adding a base station to our general tree, i use this node.
    int BS_value;	// This node holds the base stations' values.
    nodeBS *sibling;	
    nodeBS *child;
    nodeBS *parent; // I use parent pointer to create relation with childs and parents in order to find a shortest path from root to any base station that holds target mobile host.
    nodeMH *next; //next pointer of the nodeBS holds the mobile hosts(Attention! next pointer's data type is nodeMH, not nodeBS).
};

struct tree{
    nodeBS *root; // root pointer that points out to central controller.
    nodeBS *traverse; // pointer that is used during dfs_to_BS(depth-first search)
    nodeBS *target; //  pointer that is used during printing path from target MH's BS to root.
    nodeBS *temp_for_parent;
    nodeBS *temp_for_target;
    int path_keeper[10000]; // I use this path_keeper to save my path into it. It is necessary when i need a path from root to target mobile host's base station.
    int checker = 0; // i use this control mechanisim while finding the target MH.
    void create(); // creates Central Controller and sets other necessary initials.
    void add_BS(int, int); // Adds new base stations to the tree.
    void dfs_to_BS(nodeBS *ptr, int second); // depth-first search(preorder search).
    void dfs_to_add_MH(nodeBS *ptr, int first, int second); //Finds the proper place for the new MH and add it to the tree.
    void MHfinder(nodeBS *ptr, int num); // searches for the target Mobile Host in the current Base Station.
    void add_BS_MH(string,int,int); // This function adds the BSs and MHs to the tree using add_BS() and dfs_to_add_MH().
    void path_printer(string,int); // prints out the path that is from target MH's BS to the central controller(cc,root).
};

void tree::create(){

    nodeBS *cc = new nodeBS;	// In this function, i create a node that is called as cc which stands for central controller.
    root = cc;					//And i assing root pointer to cc.
    root -> BS_value = 0;		// cc's value is 0.
	root -> child = NULL;
    root -> sibling = NULL;
    root -> parent = NULL;
    root -> next = NULL;
    traverse = root;  // i assign traverse pointer to root so that i can traverse over tree starting from root.
}

void tree::dfs_to_BS(nodeBS *ptr, int second){ // this function finds the target BS using deep first search(manner). 
    if(ptr == NULL) return;
    if(ptr -> BS_value == second) target = ptr;	//When we reach to the target BS, i assign target pointer to BS that is found by using deep first manner.
    dfs_to_BS(ptr -> child, second); //first child last sibling(preorder, deep first search manner)
    dfs_to_BS(ptr -> sibling, second);
}

void tree::add_BS(int first, int second){ // this function add's new BS to tree using dfs_to_BS().

    traverse = root; // i assign traverse pointer to root node so that when add() function called, we can start from root to search target BS every time.

    dfs_to_BS(traverse, second); // finds the target BS and assign the target pointer to target BS.

    nodeBS *newnode = new nodeBS; //We create the new BS node and assign its properties.
    newnode -> BS_value = first;
    newnode -> child = NULL;
    newnode -> sibling = NULL;
    newnode -> next = NULL;
    newnode -> parent = NULL;

    if(target -> child == NULL){ // if target BS has no child, we can immediately add new BS to target BS.
        target -> child = newnode;
        newnode -> parent = target; // And we assign newnode's parent to target BS to be able to use it while printing the shortest path from root to target MH's BS value.
        return;
    }
    if(target -> child != NULL){ // if target BS has childs, we need to go to the last child to add new BS since the order is important.
        temp_for_parent = target; // But first we assign a pointer called temp_for_parent to target pointer which points to new node's parent not to lose parent BS.
        target = target -> child; // after that, we go to the parent BS's first child(one level below).
        while(target -> sibling != NULL){ // We go to the last child of the parent BS.(basically, iterating until we reach to the last child(single linked list iteration))
            target = target -> sibling; 
        }
        target -> sibling = newnode;	// now, our target pointer points to the last child of the parent BS, and we assign last child's sibling to the new BS.
        newnode -> parent = temp_for_parent; // We assign the newnode's parent.(remember temp_for_parent is pointing out the parent BS node)
        return;
    }
}

void tree::dfs_to_add_MH(nodeBS *ptr, int first, int second){ // this function finds the proper place to add MH using deep first search(manner).
    
	if(ptr == NULL) return; // it search until reach to the deep point.
    
	if(ptr -> BS_value == second){ // If we find the target BS to add new MH, this block works.       		
		nodeMH *newMH = new nodeMH;
        newMH -> MHvalue = first; // We create our new MH and assign its properties.
        newMH -> next = NULL;
        
		if(ptr -> next == NULL){ // if ptr -> next is NULL, it means that our BS doesn't have any MH and we can immediately add our MH to BS.
            ptr -> next = newMH;
            return;
        }		
        if(ptr -> next != NULL){ // if ptr -> next is not NULL, it means that our BS does have at least one MH and we should iterate to last MH.
            nodeMH *temp = ptr -> next;
            while(temp -> next != NULL){
                temp = temp -> next; // using temp pointer we iterate until reach to the last MH.
            }
            temp -> next = newMH; // After we reach to the last MH, we put our new MH to its proper place which is last MH's next.
            return;
        }
    }
	
    dfs_to_add_MH(ptr -> child, first, second); // Until we reach to the target BS, we search for it by using deep first manner.
    dfs_to_add_MH(ptr -> sibling, first, second);
}

void tree::add_BS_MH(string type, int first, int second){ // This function is used to shorten main() function. According to the type of the incoming string(BS or MH), it adds it to the our tree using other adding functions.
        
		if(type == "BS"){
			add_BS(first, second);
		}else if(type == "MH"){
            nodeBS *forMH = root;
            dfs_to_add_MH(forMH, first, second);
        }
}

void tree::MHfinder(nodeBS *ptr, int num) { // This function prints out the path while we are traversing to send our message to target MH.
    
	nodeMH *tempptr;
    
	if(ptr == NULL) return;
	
    if(ptr -> BS_value != 0) cout << " " << ptr -> BS_value;
    
	if(ptr -> next != NULL){ // if ptr -> next is not equal to NULL, it means that ptr has at least one MH and we can search our target MH among them.
        tempptr = ptr -> next;
        while(tempptr != NULL){ // simple iteration until the NULL.
            if(tempptr -> MHvalue == num){ // if we find the target MH this block works.
                checker = 1; // We assign our checker to 1 to be able to control our search mechanism.
                target = ptr; // We assign target pointer to ptr that holds the BS of the target MH that we have just found it. 
                return; // With this assignment we can print out the path from target MH's BS to root. We use this target pointer in the path_printer() to print path.
            }else{
                checker = 0; // if we cant find the MH we assign checker to 0.
            }
            tempptr = tempptr -> next; // And we iterate.
        }
    }
    
	MHfinder(ptr -> child, num); // We keep searching by using deep first manner.
	if(checker != 1) MHfinder(ptr -> sibling, num); //(Most important line of the code) When we find the target MH, checker will be assigned to 1. And after we find it we shouldn't keep searching. Putting if(checker != 1) to the beginning of the line prevent us from the extra search.	If we don't use it, it gives wrong output.
}

void tree::path_printer(string message, int target_num){
	
    int i = 0;
    temp_for_target = target; // this target pointer points to target nodeMH(we did it in MHfinder function), and we assign temp_for_target pointer to target pointer to iterate towards root.
    while(temp_for_target -> parent != NULL){	//This while block assigns the path_keeper's elements' to the BS_value of the current base station that temp_for_target pointer points to.	
        path_keeper[i] = temp_for_target -> BS_value;
        i++;
        temp_for_target = temp_for_target -> parent;
    }
    
    if(checker == 1){ // If checker is 1, it means that we have found the target mobile host and we print out the shorters path from the root to target mobile host.
        cout << "Message:" << message << " To:0"; 
        for(; i > 0; i--){
            cout << " " << path_keeper[i-1];
        }
        cout << " mh_" << target_num << endl;
    }else{ // If checker is not 1, which is 0, it means that we couldn't find the target mobile host.
        cout << "Can not be reached the mobile host mh_" << target_num << " at the moment" << endl;
    }
}

int main(int argc, char *argv[]){

    tree obj; // We create our object.
    obj.create(); // We assign initials using create().

    ifstream file1(argv[1], ios::in);

    if(!file1.is_open()) cout << "ERROR: Network.txt could not been open" << endl;
        
    while(file1.peek() != EOF){ //Reads Network.txt to create tree
        
        string name, f, s;
        
        getline(file1, name, ' ');
        getline(file1, f, ' ');
        getline(file1, s, '\n');

        int first, second;
        first = stoi(f);
        second = stoi(s);

        obj.add_BS_MH(name,first,second);
    }
    file1.close();


    ifstream file2(argv[2], ios::in);

    if(!file2.is_open()) cout << "ERROR: Messages.txt could not been open" << endl;
        
    while(file2.peek() != EOF ){ //Reads Messages.txt to send message
        
        string message, to;
        
        getline(file2,message,'>');
        getline(file2,to,'\n');

        int target_num = stoi(to);
        
        nodeBS *forMH2 = obj.root;
        cout << "Traversing:0";
		obj.checker = 0;
        obj.MHfinder(forMH2, target_num);
        cout << endl;
        
        obj.path_printer(message, target_num);
    }
    
    file2.close();

    return 0;
}