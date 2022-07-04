/*
    Fatih MURAT
    150170039
    @compile -> g++ -std=c++11 main.cpp
    @run     -> ./a.out euroleague.csv
*/


#include <iostream>
#include <string>
#include <fstream>

using namespace std;

// Node of the Red-Black Tree
class Node{
public:
    Node(string, int, int, int);// Constuctor with parameter
    string name;                // Key of the node
    int point, rebound, assist; // extra attributes
    Node* parent;               // parent of the node
    Node* left;                 // left child of the node
    Node* right;                // right child of the node
    string color;               // "BLACK" or "RED"
    int depth;                  // depth of the node
};

// Assigning the members with constructor with parameters
Node::Node(string name, int point, int rebound, int assist){
    this->name = name;
    this->point = point;
    this->rebound = rebound;
    this->assist = assist;
    this->color = "RED";     // Any node is RED when is created
    this->parent = nullptr;
    this->left = nullptr;
    this->right = nullptr;
    this->depth = 0;
}

// Class to hold max stats of the season
class stats{
public:
    int max_stat;
    string name;
    stats(){max_stat = 0; name = "";}
};

// Red-Black Tree class to manage all required operations
class RBT{
public:
    Node* root;                                // Root of the tree
    bool flag;                                 // Used for intermediate control operations

    RBT();                                     // Constructor
    void insert(Node&);                        // Inserts a new node to the tree as in BST insertion
    void print(Node*);                         // Prints the first season
    void insertFix(Node*);                     // Fixes the tree after insertion
    void leftRotate(Node*);                    // Left rotates the sub-tree
    void rightRotate(Node*);                   // Right rotates the sub-tree
    void is_exist(string);                     // Checks if player exists in tree
    void update(Node*, string, int, int, int); // Updates the existing player's information
    void depth(Node*);                         // Sets the depth of the players of the first season
    void find_maxes(Node*, stats*);            // Finds the max stats of the season and prints them out
    void delete_recursively(Node*);            // Frees the allocated memory
    void swap_colors(string*, string*);        // Swaps the colors of two nodes
    ~RBT();                                    // Destructor
};


RBT::RBT(){
    root = nullptr;
    flag = false;
}

// Left Rotation
void RBT::leftRotate(Node* pt)
{
    Node *pt_right = pt->right;

    pt->right = pt_right->left;

    if (pt->right != NULL)
        pt->right->parent = pt;

    pt_right->parent = pt->parent;

    if (pt->parent == NULL)
        root = pt_right;
    else if (pt == pt->parent->left)
        pt->parent->left = pt_right;
    else
        pt->parent->right = pt_right;

    pt_right->left = pt;

    pt->parent = pt_right;
}

// Right Rotation
void RBT::rightRotate(Node* pt)
{
    Node *pt_left = pt->left;

    pt->left = pt_left->right;

    if (pt->left != NULL)
        pt->left->parent = pt;

    pt_left->parent = pt->parent;

    if (pt->parent == NULL)
        root = pt_left;
    else if (pt == pt->parent->left)
        pt->parent->left = pt_left;
    else
        pt->parent->right = pt_left;

    pt_left->right = pt;

    pt->parent = pt_left;
}

void RBT::insertFix(Node* pt)
{
    Node *parent_pt = NULL;
    Node *grand_parent_pt = NULL;

    while ((pt != root) && (pt->color != "BLACK") && (pt->parent->color == "RED")){
        parent_pt = pt->parent;
        grand_parent_pt = pt->parent->parent;

        // This if block runs when parent of pf is left child of grandparent of pt
        if (parent_pt == grand_parent_pt->left){
            Node *uncle_pt = grand_parent_pt->right;

            // Case-1 : The uncle of pt is also red. Only Recoloring required.
            if (uncle_pt != NULL && uncle_pt->color == "RED"){
                grand_parent_pt->color = "RED";
                parent_pt->color = "BLACK";
                uncle_pt->color = "BLACK";
                pt = grand_parent_pt;
            }else{
                // Case-2 : pt is right child of its parent. Left-rotation required
                if (pt == parent_pt->right){
                    leftRotate(parent_pt);
                    pt = parent_pt;
                    parent_pt = pt->parent;
                }
                // Case-3 : pt is left child of its parent. Right-rotation required.
                rightRotate(grand_parent_pt);
                swap_colors(&parent_pt->color, &grand_parent_pt->color);
                pt = parent_pt;
            }
        }else{ // Parent of pt is right child of grandparent of pt.
            Node *uncle_pt = grand_parent_pt->left;

            // Case-1 : The uncle of pt is also red. Only Recoloring required.
            if ((uncle_pt != NULL) && (uncle_pt->color == "RED")){
                grand_parent_pt->color = "RED";
                parent_pt->color = "BLACK";
                uncle_pt->color = "BLACK";
                pt = grand_parent_pt;
            }else{
                // Case-2 : pt is left child of its parent. Right-rotation required.
                if (pt == parent_pt->left){
                    rightRotate(parent_pt);
                    pt = parent_pt;
                    parent_pt = pt->parent;
                }
                // Case-3 : pt is right child of its parent. Left-rotation required.
                leftRotate(grand_parent_pt);
                swap_colors(&parent_pt->color,
                            &grand_parent_pt->color);
                pt = parent_pt;
            }
        }
    }
    root->color = "BLACK"; // Whatever changes, we assign root's color as BLACK
}

void RBT::insert(Node& newnode){
    if(!root){ // checks if tree is empty
        root = &newnode; // Assign new node as root
        root->color = "BLACK"; // setting root's color to black
        root->depth = 0;
        return;
    }

    Node* temp = root; // temp pointer to find proper place to insert new node

    while(temp != nullptr){ // Inserting new node
        if(newnode.name > temp->name){ // If new node's name is greater than node's name go right.
            if(temp->right == nullptr){ // Before going to right, check if we reach to the leaf
                temp->right = &newnode; // Assign new node to right child
                newnode.parent = temp; // Assign parent
                break; // End the loop
            }
            temp = temp->right; // Otherwise, keep iterating towards right
        }else if(newnode.name < temp->name){ // If new node's name is smaller than node's name go left.
            if(temp->left == nullptr){ // Before going to left, check if we reach to the leaf
                temp->left = &newnode; // Assign new node to left child
                newnode.parent = temp; // Assign parent
                break; // End the loop
            }
            temp = temp->left; // Otherwise, keep iterating towards left
        }
    }

    if (newnode.parent->parent == nullptr){ // If node's parent's parent is null, just return
        return;
    }

    insertFix(&newnode); // Fix the tree after insertion
}

// Prints the information of first season
void RBT::print(Node* node){
    if(node != nullptr){                        // If tree exists
        for(int i = 0; i < node->depth; i++){   // Printing dashes in the number of depth
            cout << "-";
        }
        cout << "(" << node->color << ")"       // Printing another information
             << " "
             << node->name << endl;
        print(node->left);
        print(node->right);
    }
}

void RBT::is_exist(string name) { // flag is set to false always before this function's call.
    Node *temp = root;          // Starting from root

    while(temp != nullptr){     // While temp is not heading to leaf
        if(temp->name == name){ // Check if desired name is found
            flag = true;        // set flag true
            return;             // end searching
        }
        if(name > temp->name){  // if name is bigger then the current node's name
            temp = temp->right; // go right
        }else if(name < temp->name){ // if name is smaller then the current node's name
            temp = temp->left; // go left
        }
    }
}

// If player exists, update is called instead of insert.
void RBT::update(Node *node, string name, int po, int as, int re){
    if(node == nullptr) return;

    if(node->name == name){ // When player is found, update the information.
        node->point += po;
        node->assist += as;
        node->rebound += re;
        return;
    }

    // Keep searching with preorder traversal
    update(node->left, name, po, as, re);
    update(node->right, name, po, as, re);
}

// Sets the depth of nodes of the first season players
void RBT::depth(Node* pt) {
    if(pt == nullptr) return;

    if(pt != root){ // Root's depth is 0, and already assigned
        pt->depth = pt->parent->depth + 1; // Depth is equal to parent's depth plus 1
    }

    // Keep assigning with preorder traversal
    depth(pt->left);
    depth(pt->right);
}

void RBT::find_maxes(Node* node, stats* stat_array) {
    if(node == nullptr) return;

    // max point of the season
    if(node->point > stat_array[0].max_stat){
        stat_array[0].max_stat = node->point;
        stat_array[0].name = node->name;
    }

    // max assist of the season
    if(node->assist > stat_array[1].max_stat){
        stat_array[1].max_stat = node->assist;
        stat_array[1].name = node->name;
    }

    // max rebound of the season
    if(node->rebound > stat_array[2].max_stat){
        stat_array[2].max_stat = node->rebound;
        stat_array[2].name = node->name;
    }

    find_maxes(node->left, stat_array);
    find_maxes(node->right, stat_array);
}

// Deleting nodes with postorder traversal in order not to lost any connection
void RBT::delete_recursively(Node* node) {
    if(node){
        delete_recursively(node->left);
        delete_recursively(node->right);
        delete node;
    }
}

// Destructor of RBT
RBT::~RBT(){
    delete_recursively(root);
}


// Swapping colors by reference
void RBT::swap_colors(string* color1, string *color2) {
    string temp = *color1;
    *color1 = *color2;
    *color2 = temp;
}

int main(int argc, char* argv[]){

    ifstream file; // Creating file object

    RBT r; // Creating tree object

    file.open(argv[1]); // Opening the file

    if (!file){ // Checking if file is opened
        cerr << "File cannot be opened!";
        exit(1);
    }

    string header, t; // Used for intermediate operations
    getline(file, header); // Read the header (first) line

    // These flag are used for intermediate operations
    bool flag = true;
    bool flag_se_pr = true;

    // Variables to handle main operations
    int prev_seas;
    int season, rebound, assist, point, first_season;
    string s, re, a, p, name;

    // Creating stats array with 3 elements
    stats stats_array[3];

    // Creating stats objects
    stats points;
    stats assists;
    stats rebounds;

    // Assigning which element holds which information
    stats_array[0] = points;
    stats_array[1] = assists;
    stats_array[2] = rebounds;

    // Main while loop to handle operations
    while(!file.eof()){ // Until the end of file
        // Reading the line
        getline(file, s, '-');   // Season
        getline(file, t, ',');   // Omitting
        getline(file, name, ',');// Name
        getline(file, t, ',');   // Omitting
        getline(file, re, ',');  // Rebound
        getline(file, a, ',');   // Assist
        getline(file, p, '\n');  // Point

        // Converting strings to int
        season = stoi(s);
        if(flag){ // This if block runs only once, in order to assign first season information.
            first_season = season;
            prev_seas = first_season; // Handles season changes
            flag = false; // Closes the if block
        }
        rebound = stoi(re);
        assist = stoi(a);
        point = stoi(p);

        // If season is end, desired information is printed out
        if(prev_seas != season){
            r.find_maxes(r.root, stats_array); // First assigning all-time max stats

            cout << "End of the " << prev_seas << "-" << prev_seas+1 << " Season" << endl
                 << "Max Points: " << stats_array[0].max_stat << " - " << "Player Name: " << stats_array[0].name << endl
                 << "Max Assists: " << stats_array[1].max_stat << " - " << "Player Name: " << stats_array[1].name << endl
                 << "Max Rebs: " << stats_array[2].max_stat << " - " << "Player Name: " << stats_array[2].name << endl;
            prev_seas++; // Incrementing the season
        }

        // Printing first season's black-red states and depth
        // flag_se_pr controls the block and block runs only once
        if(season != first_season && flag_se_pr){
            r.depth(r.root);
            r.print(r.root);
            flag_se_pr = false;
        }

        r.flag = false; // Setting flag of the tree to false each time before searching
        r.is_exist(name); // If player exists, sets flag true, else false.
        if(r.flag){
            r.update(r.root, name, point, assist, rebound); // Update found player's information
        }else{
            Node *new_node = new Node(name, point, rebound, assist); // Create new player
            r.insert(*new_node); // Add new player to tree
        }
    }

    // The last season will not be recognized in the while loop, so the last season is printed here.
    r.find_maxes(r.root, stats_array);
    cout << "End of the " << season << "-" << season+1 << " Season" << endl
         << "Max Points: " << stats_array[0].max_stat << " - " << "Player Name: " << stats_array[0].name << endl
         << "Max Assists: " << stats_array[1].max_stat << " - " << "Player Name: " << stats_array[1].name << endl
         << "Max Rebs: " << stats_array[2].max_stat << " - " << "Player Name: " << stats_array[2].name << endl;

    // Runs if only one season exists
    if(season == first_season){
        r.depth(r.root);
        r.print(r.root);
    }

    // Closing the file
    file.close();

    return 0;
}