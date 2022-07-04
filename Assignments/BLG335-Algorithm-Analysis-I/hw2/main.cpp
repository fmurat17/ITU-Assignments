/*
Fatih MURAT
150170039

compile command ->  g++ -std=c++11 main.cpp
run command -> ./a.out 100000 0.2
m and p can be changed

*/

#include <iostream>
#include <cstdlib> // srand(), rand()
#include <ctime> // time()
#include <vector> // vector<double>, erase(), begin
#include <cmath> // pow(), sqrt()
#include <fstream> // ifstream
#include <string> 
#include <chrono>

using namespace std;

// Priority queue with binary heap is constructed in that vector
vector<double> distance_vector;

//swap function to swap distances
void swap(double *x, double *y){
    double temp = *x;
    *x = *y;
    *y = temp;
}

// returns the parent index of parameter i index
int parent(int i){
    return (i-1) / 2;
}

// returns the left child index of parameter i index
int left(int i){
    return (2*i + 1);
}

// returns the right child index of parameter i index
int right(int i){
    return (2*i + 2);
}

// Minimum heapifies the index i
void MinHeapify(int i){
    int l = left(i); // left child index
    int r = right(i); // right child index
    int smallest = i; // inital smallest among i, right and left
    if(l < distance_vector.size() && distance_vector[l] < distance_vector[i]) // checks if left child exit and compare it
        smallest = l; // if left exist and smaller, we assign it to smallest
    if(r < distance_vector.size() && distance_vector[r] < distance_vector[smallest]) // checks if right child exit and compare it
        smallest = r; // if right exist and smaller, we assign it to smallest
    if(smallest != i){ // if smallest is not the given index, heapifis it
        swap(&distance_vector[i], &distance_vector[smallest]);
        MinHeapify(smallest);
    }
}

// Inserts the new distance
void insert_distance(double distance){
    // First insert the new distance at the end
    distance_vector.push_back(distance);
    int i = distance_vector.size() - 1; // last element's index
    
    // Min heapifes after adding to the end
    while(i != 0 && distance_vector[parent(i)] > distance_vector[i]){ // while we are not at the beginning and parent is bigger than the index
        swap(&distance_vector[i], &distance_vector[parent(i)]); // shift up swap
        i = parent(i); // assign new index
    }
}

// Updates the distance by deacreasing it 0.01 and min heapifies it
void decrease_distance(int i, double new_dist){
	// assigning new value
    distance_vector[i] = new_dist;

    // Same while with insert distance
    while(i != 0 && distance_vector[parent(i)] > distance_vector[i]){
        swap(&distance_vector[i], &distance_vector[parent(i)]);
        i = parent(i);
    }
}

// Calling taxi by removing it (first element) from the vector
void call_taxi(){
	// Checks if heap is empty
    if(distance_vector.size() <= 0){
        cout << "vector is empty!!";
        return;
    }
    // Checks if size is 1
    if(distance_vector.size() == 1)
        return;

    distance_vector[0] = distance_vector[distance_vector.size()-1]; // put first element to the end of the heap
    distance_vector.erase(distance_vector.begin()+(distance_vector.size()-1)); // erase it
    MinHeapify(0); // Min heapify the new first element
}

int main(int argc, char* argv[]){ // argv[1] = m, argv[2] = p
    auto start = chrono::steady_clock::now(); // starts the choronometer

    int n = 100000; // Total number of lines to be read from the file
    int m = stoi(argv[1]); // Total number of operations
    double p = stof(argv[2]); // Probability to choose which operation among update and add

    ifstream file; // file object
    
    file.open("locations.txt"); // Try to open file

    if (!file){ // Checks if file is opened
        cerr << "File cannot be opened!";
        exit(1);
    }

    string header; // This variables hold the first line of the text file
    getline(file, header);

    double hotel_x = 33.40819; // longtitude of hotel
    double hotel_y = 39.19001; // latitude of hotel

    double x, y, distance; // x and y from file, distance is distance between hotel and read location

    for(int i = 0; i < n; i++){ // In this block, we read the file
        file >> x;
        file >> y;

        distance = sqrt(pow(hotel_x-x,2) + pow(hotel_y-y, 2)); // distance calculations

        insert_distance(distance); // Inserting according to heap rules
    }

    double rnd_tx, tmp; // rnd_tx -> random taxi update
    int rnd, number_of_additions = 0, number_of_updates = 0;
    
    srand(time(NULL));

    for(int i = 0; i < m; i++){ // Main loop to operate desired operations
        rnd =  rand() % 100 + 1; // Random value between 1 and 100
 
        if(rnd < (p*100)){ // Update block
            number_of_updates++;
            rnd_tx = rand() % distance_vector.size();
            tmp = distance_vector[rnd_tx];
      
            tmp -= 0.01; // Decreasing by 0.01
            if(tmp <= 0){ // Preventing negative distance
                tmp = 0;
            }
            decrease_distance(rnd_tx, tmp); // Heapify the deacreased value
        }else{ // Addition block
            number_of_additions++;
            file >> x;
            file >> y;

            distance = sqrt(pow(hotel_x-x,2) + pow(hotel_y-y, 2)); // New location's distance

            insert_distance(distance); // Inserting new location according to min heap rules
        }
        if(i % 100 == 0){ // At each 100 iteration, call the taxi
            cout << "taxi has been called with the distance of " << distance_vector[0] << endl;
            call_taxi();
        }
    }
    // Printing number of operations
    cout << "additions: " << number_of_additions << " updates: " << number_of_updates << endl; 

    auto end = chrono::steady_clock::now(); // Stop the choronometer

    cout << "Elapsed time in milliseconds : " // Printing the total run time
         << chrono::duration_cast<chrono::milliseconds>(end - start).count()
         << " ms" << endl;

    file.close(); // Close the file

    return 0;
}