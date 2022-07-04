/*
Fatih MURAT
150170039
g++ -std=c++11 -Wall -Werror main.cpp
./a.out 1000
*/

#include <iostream>
#include <fstream>
#include <string>
#include <istream>
#include <chrono>
#include <iomanip>

using namespace std;

class sale{  // We keep our data in a class
public:
    string country;
    string item;
    string id;
    int sold;
    double profit;
};

void swap(sale* a, sale* b) // This swap function swaps the address of the objects
{
    sale t = *a;
    *a = *b;
    *b = t;
}

/*
I wanted to choose last element as pivot. In the partition function, last element is picked as pivot. Pivot is put
into correct position according to that left ones are smaller than pivot and right ones are bigger than pivot.
This is actually main part of sorting.
*/
int partition (sale arr[], int low, int high)  // This function does the partition of quicksort
{
    string pivot = arr[high].country; // pivot as string
    double pivot_profit = arr[high].profit; // pivot as double. In case of same country names, pivo_profit is used to compare.
    int i = (low - 1); // Keeps the index of the element which is going to be swapped

    for (int j = low; j <= high - 1; j++) 
    {
        if(arr[j].country < pivot || (arr[j].country == pivot && arr[j].profit > pivot_profit)){
        	// In this if block, we control the swap situtation. In addition, we check the same country names.
            i++; // Incrementing the i.
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[high]);

    return (i + 1); // Returns pivot position in the end so that we can continue to sort the array.
}

void quickSort(sale arr[], int low, int high) // Recursive function to sort array. Array is sorted from low to high index.
{
    if (low < high)
    {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

int main(int argc, char* argv[]){

    ifstream file;
    file.open("sales.txt");

    if (!file){ // Simple check if file is opened
        cerr << "File cannot be opened!";
        exit(1);
    }

    int N = stoi(argv[1]); //you should read value of N from command line
    sale *arr = new sale[N];

    string line;

    getline(file, line); //this is the header line


    for(int i = 0; i<N; i++){
        getline(file, arr[i].country, '\t'); //country (string)
        getline(file, arr[i].item, '\t'); //item type (string)
        getline(file, arr[i].id, '\t'); //order id (string)
        file >> arr[i].sold; //units sold (integer)
        file >> arr[i].profit; //total profit (float)
        getline(file, line, '\n'); //this is for reading the \n character into dummy variable.
    }

    auto start = chrono::steady_clock::now(); // Starts chronometer
    quickSort(arr, 0, N-1);
    auto end = chrono::steady_clock::now(); // Stops chronometer

    cout << "Elapsed time in seconds : "
         << chrono::duration_cast<chrono::milliseconds>(end - start).count() / 1000.0
         //<< chrono::duration_cast<chrono::nanoseconds>(end - start).count() / 1000000000.0
         << " s" << endl;

    ofstream outfile; // We start to write into file our sorted array.
    outfile.open("sorted.txt");

    outfile << "Country\tItem Type\tOrder ID\tUnits Sold\tTotal Profit";

    for(int i = 0; i < N; i++){
        outfile << "\n" << arr[i].country << "\t";
        outfile << arr[i].item << "\t";
        outfile << arr[i].id << "\t";
        outfile << arr[i].sold << "\t";
        outfile << setprecision(2) << fixed <<  arr[i].profit;
    }

    delete [] arr; // We delete arr in order to prevent memory leak.

    return 0;
}