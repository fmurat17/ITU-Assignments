/*
    Fatih MURAT - 150170039
    part1.cpp
*/
#include <iostream>
using namespace std;

class key{
public:
    int x;
    int y;
    char z;
    int get_key(char);
};

class Node{
public:
    key *keys;
    int t;
    Node **Child;
    int n;
    bool leaf;

    Node(int, bool);
    void insert_non_full(int, int, char, char);
    void split_child(int, Node*, char);
    void traverse();
};

class BTree{
public:
    Node *root;
    int t;

    BTree(int);
    void traverse();
    void insert(int, int, char, char);
};

int key::get_key(char k){
    if(k == 'x') return this->x;
    else if(k == 'y') return this->y;
    else return this->z;
}

BTree::BTree(int temp){
    root = NULL;
    t = temp;
}

void BTree::traverse(){
    if(root) root->traverse();
}

Node::Node(int t1, bool leaf1){
    t = t1;
    leaf = leaf1;

    keys = new key[2 * t - 1];
    Child = new Node*[2 * t];

    n = 0;
}

void Node::traverse(){
    int i;
    for(i = 0; i < n; i++){
        cout << "(" << keys[i].x << "," << keys[i].y << "," << keys[i].z << ")";
    }

    cout << endl;

    for(i = 0; i < n; i++){
        if(!leaf)
            Child[i]->traverse();
    }

    if(!leaf)
        Child[i]->traverse();
}

void BTree::insert(int x, int y, char z, char k){
    int kk;
    if(k == 'x') kk = x;
    if(k == 'y') kk = y;
    if(k == 'z') kk = z;

    if(root == NULL){
        root = new Node(t, true);
        root->keys[0].x = x;
        root->keys[0].y = y;
        root->keys[0].z = z;
        root->n = 1;
    }else{
        if(root->n == 2 * t - 1){
            Node *s = new Node(t, false);

            s->Child[0] = root;

            s->split_child(0, root, k);

            int i = 0;
            if (s->keys[0].get_key(k) < kk)
                i++;
            s->Child[i]->insert_non_full(x,y,z,k);

            root = s;
        } else
            root->insert_non_full(x,y,z,k);
    }
}

void Node::insert_non_full(int x, int y, char z, char k){
    int kk;
    if(k == 'x') kk = x;
    if(k == 'y') kk = y;
    if(k == 'z') kk = z;

    int i = n - 1;

    if(leaf){
        while(i >= 0 && keys[i].get_key(k) > kk){
            keys[i + 1].x = keys[i].x;
            keys[i + 1].y = keys[i].y;
            keys[i + 1].z = keys[i].z;
            i--;
        }

        keys[i + 1].x = x;
        keys[i + 1].y = y;
        keys[i + 1].z = z;
        n = n + 1;
    }else{
        while(i >= 0 && keys[i].get_key(k) > kk)
            i--;

        if(Child[i + 1]->n == 2 * t - 1){
            split_child(i + 1, Child[i + 1], k);

            if(keys[i + 1].get_key(k) < kk)
                i++;
        }
        Child[i + 1]->insert_non_full(x, y, z, k);
    }
}

void Node::split_child(int i, Node *y, char k){
    Node *z = new Node(y->t, y->leaf);
    z->n = t - 1;

    for(int j = 0; j < t - 1; j++){
        z->keys[j].x = y->keys[j + t].x;
        z->keys[j].y = y->keys[j + t].y;
        z->keys[j].z = y->keys[j + t].z;
    }

    if(!y->leaf){
        for (int j = 0; j < t; j++)
            z->Child[j] = y->Child[j + t];
    }

    y->n = t - 1;
    for(int j = n; j >= i + 1; j--)
        Child[j + 1] = Child[j];

    Child[i + 1] = z;

    for(int j = n - 1; j >= i; j--){
        keys[j + 1].x = keys[j].x;
        keys[j + 1].y = keys[j].y;
        keys[j + 1].z = keys[j].z;
    }

    keys[i].x = y->keys[t - 1].x;
    keys[i].y = y->keys[t - 1].y;
    keys[i].z = y->keys[t - 1].z;
    n++;
}

int main(){
    int number_of_nodes, degree_of_tree;
    char which_key;

    cin >> number_of_nodes;
    cin >> degree_of_tree;
    cin >> which_key;

    BTree t(degree_of_tree);

    int x,y;
    char z;

    for(int i = 0; i < number_of_nodes; i++){
        cin >> x >> y >> z;
        t.insert(x, y, z, which_key);
    }

    t.traverse();

    return 0;
}