/*
    Fatih MURAT - 150170039
    part2.cpp
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
    void remove(int, char);
    void merge(int);
    void fill(int);
    int key_finder(int, char);
    key getPred(int, char);
    key getSucc(int, char);
};

class BTree{
public:
    Node *root;
    int t;

    BTree(int);
    void traverse();
    void insert(int, int, char, char);
    void remove(int, char);
};

BTree::BTree(int temp){
    root = NULL;
    t = temp;
}

void BTree::traverse(){
    if(root) root->traverse();
}

int key::get_key(char k){
    if(k == 'x') return this->x;
    else if(k == 'y') return this->y;
    else return this->z;
}

int Node::key_finder(int k, char t){
    int idx = 0;
    while(idx<n && keys[idx].get_key(t) < k)
        ++idx;
    return idx;
}

void Node::remove(int k, char type){
    int idx = key_finder(k, type);

    if(idx < n && keys[idx].get_key(type) == k){
        if(leaf){
            for(int i=idx+1; i<n; ++i){
                keys[i-1].x = keys[i].x;
                keys[i-1].y = keys[i].y;
                keys[i-1].z = keys[i].z;
            }
            n--;
        }
        else{
            int k = keys[idx].get_key(type);

            if(Child[idx]->n >= t){
                key pred = getPred(idx, t);
                keys[idx].x = pred.x;
                keys[idx].y = pred.y;
                keys[idx].z = pred.z;
                Child[idx]->remove(pred.get_key(t), t);
            }else if(Child[idx+1]->n >= t){
                key succ = getSucc(idx, t);
                keys[idx].x = succ.x;
                keys[idx].y = succ.y;
                keys[idx].z = succ.z;
                Child[idx+1]->remove(succ.get_key(t), t);
            }else{
                merge(idx);
                Child[idx]->remove(k, t);
            }
        }
    }
    else{
        if(leaf) return;

        bool flag = (idx==n);

        if(Child[idx]->n < type)
            fill(idx);

        if(flag && idx > n) Child[idx-1]->remove(k, type);
        else Child[idx]->remove(k, type);
    }
    return;
}

key Node::getPred(int idx, char type){
    Node *cur = Child[idx];
    while(!cur->leaf)
        cur = cur->Child[cur->n];

    return cur->keys[cur->n-1];
}

key Node::getSucc(int idx, char type){
    Node *cur = Child[idx+1];
    while(!cur->leaf)
        cur = cur->Child[0];

    return cur->keys[0];
}

void Node::fill(int idx){
    if(idx != 0 && Child[idx-1]->n >= t){
        Node *child=Child[idx];
        Node *sibling=Child[idx-1];

        for(int i=child->n-1; i>=0; --i){
            child->keys[i+1].x = child->keys[i].x;
            child->keys[i+1].y = child->keys[i].y;
            child->keys[i+1].z = child->keys[i].z;
        }

        if(!child->leaf){
            for(int i=child->n; i>=0; --i)
                child->Child[i+1] = child->Child[i];
        }

        child->keys[0].x = keys[idx-1].x;
        child->keys[0].y = keys[idx-1].y;
        child->keys[0].z = keys[idx-1].z;

        if(!child->leaf) child->Child[0] = sibling->Child[sibling->n];

        keys[idx-1].x = sibling->keys[sibling->n-1].x;
        keys[idx-1].y = sibling->keys[sibling->n-1].y;
        keys[idx-1].z = sibling->keys[sibling->n-1].z;

        child->n += 1;
        sibling->n -= 1;
    }
    else if (idx != n && Child[idx+1]->n >= t){
        Node *child=Child[idx];
        Node *sibling=Child[idx+1];

        child->keys[(child->n)].x = keys[idx].x;
        child->keys[(child->n)].y = keys[idx].y;
        child->keys[(child->n)].z = keys[idx].z;

        if(!(child->leaf)) child->Child[(child->n)+1] = sibling->Child[0];

        keys[idx].x = sibling->keys[0].x;
        keys[idx].y = sibling->keys[0].y;
        keys[idx].z = sibling->keys[0].z;

        for(int i=1; i<sibling->n; ++i){
            sibling->keys[i-1].x = sibling->keys[i].x;
            sibling->keys[i-1].y = sibling->keys[i].y;
            sibling->keys[i-1].z = sibling->keys[i].z;
        }

        if(!sibling->leaf){
            for(int i=1; i<=sibling->n; ++i)
                sibling->Child[i-1] = sibling->Child[i];
        }

        child->n += 1;
        sibling->n -= 1;
    }
    else{
        if (idx != n) merge(idx);
        else merge(idx-1);
    }
    return;
}

void Node::merge(int idx){
    Node *child = Child[idx];
    Node *sibling = Child[idx+1];

    child->keys[t-1].x = keys[idx].x;
    child->keys[t-1].y = keys[idx].y;
    child->keys[t-1].z = keys[idx].z;

    for(int i = 0; i<sibling->n; ++i){
        child->keys[i+t].x = sibling->keys[i].x;
        child->keys[i+t].y = sibling->keys[i].y;
        child->keys[i+t].z = sibling->keys[i].z;
    }

    if(!child->leaf){
        for(int i = 0; i<=sibling->n; ++i)
            child->Child[i+t] = sibling->Child[i];
    }

    for(int i = idx+1; i<n; ++i){
        keys[i-1].x = keys[i].x;
        keys[i-1].y = keys[i].y;
        keys[i-1].z = keys[i].z;
    }

    for(int i = idx+2; i<=n; ++i)
        Child[i-1] = Child[i];

    child->n += sibling->n+1;
    n--;

    return;
}

void BTree::remove(int k, char t){
    if(!root) return;

    root->remove(k, t);

    if(root->n==0){
        Node *tmp = root;
        if(root->leaf) root = NULL;
        else root = root->Child[0];

        delete tmp;
    }
    return;
}

Node::Node(int t1, bool leaf1){
    t = t1;
    leaf = leaf1;

    keys = new key[2 * t - 1];
    Child = new Node *[2 * t];

    n = 0;
}

void Node::traverse() {
    int i;
    for(i = 0; i < n; i++){
        cout << "(" << keys[i].x << "," << keys[i].y << "," << keys[i].z << ")";
    }

    cout << endl;

    for(i = 0; i < n; i++){
        if(!leaf) Child[i]->traverse();
    }

    if(!leaf) Child[i]->traverse();
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
        if(root->n == 2 * t - 1) {
            Node *s = new Node(t, false);

            s->Child[0] = root;

            s->split_child(0, root, k);

            int i = 0;
            if (s->keys[0].get_key(k) < kk)
                i++;
            s->Child[i]->insert_non_full(x,y,z,k);

            root = s;
        }else
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

        if(Child[i + 1]->n == 2 * t - 1) {
            split_child(i + 1, Child[i + 1], k);

            if(keys[i + 1].get_key(k) < kk)
                i++;
        }
        Child[i + 1]->insert_non_full(x,y,z,k);
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

    if(!y->leaf) {
        for(int j = 0; j < t; j++)
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
    n = n + 1;
}

int main() {
    int number_of_nodes;
    int degree_of_tree;
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

    int to_be_deleted1;
    char to_be_deleted2;

    if(which_key == 'z'){
        cin >> to_be_deleted2;
        t.remove(to_be_deleted2, which_key);
    }else{
        cin >> to_be_deleted1;
        t.remove(to_be_deleted1, which_key);
    }

    t.traverse();

    return 0;
}