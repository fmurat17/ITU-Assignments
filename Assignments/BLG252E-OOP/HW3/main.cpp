/*
    @Author: Fatih MURAT
    @Student ID: 150170309
    To compile, g++ -std=c++11 -Wall -Werror -lm 150170039.cpp -o main
    To run, ./main input.txt
*/
#include <iostream>
#include <cmath>
#include <fstream>
#include <string>
#define Euler 2.71828 // Euler number

using namespace std;

class Neuron{ //pure abstract Neuron class
protected:
    double a;
    double z;
public:
    virtual void activate() = 0;
    void setA(double a){ this->a = a; }
    double getA() const{ return this->a; }
    void setZ(double z){ this->z = z; }
    double getZ() const{ return this->z; }
    virtual ~Neuron(){};
};

class SigmoidNeuron: public Neuron{
private:
public:
    SigmoidNeuron(){ a = 0, z = 0;};
    void activate(){ a = 1 / (1 + (1/(pow(Euler, z))));};
};

class LReluNeuron: public Neuron{
private:
public:
    LReluNeuron(){ a = 0, z = 0;};
    void activate(){ a = max(0.1*z, z); };
};

class ReluNeuron: public Neuron{
private:
public:
    ReluNeuron(){ a = 0, z = 0;};
    void activate(){ a = max(0.0, z);};
};

class Layer{
private:
    Neuron **neuron; // dynamic array of pointers of pointers of objects in one layer.
    int number_of_neurons_of_layer; // number of neurons in the layer
    string type_of_layer; // type of the neurons in the layer
public:
    Layer(){ neuron = NULL; };
    Neuron** getNeuron(){ return neuron; }; // getter of neuron array
    void create_layer(); // creates the layer
    void setNumberOfNeurons(int x){ number_of_neurons_of_layer = x; };
    int getNumberOfNeurons() const{ return number_of_neurons_of_layer; };
    void setTypeOfLayer(int);
    string getTypeOfLayer() const{ return type_of_layer; };
    void print_layer()const; // prints the a and z values of the layer
    ~Layer();
};


void Layer::setTypeOfLayer(int x){ // I set the type of layer.
    if(x == 0){
        type_of_layer = "sigmoid";
    }else if(x == 1){
        type_of_layer = "lrelu";
    }else if(x == 2){
        type_of_layer = "relu";
    }
}

void Layer::create_layer(){ // according to layer type and number of neurons in the layer, layer is created.

    neuron = new Neuron*[number_of_neurons_of_layer];

    if(type_of_layer == "sigmoid"){
        for(int i = 0; i < number_of_neurons_of_layer; i++){
            neuron[i] = new SigmoidNeuron;
        }
    }else if(type_of_layer == "relu"){
        for(int i = 0; i < number_of_neurons_of_layer; i++){
            neuron[i] = new ReluNeuron;
        }
    }else if(type_of_layer == "lrelu"){
        for(int i = 0; i < number_of_neurons_of_layer; i++){
            neuron[i] = new LReluNeuron;
        }
    }
}

void Layer::print_layer()const{ // prints the a and z values of neurons in the layer
    for(int i = 0; i < number_of_neurons_of_layer; i++){
        cout << neuron[i]->getA() << endl;
    }
}

Layer::~Layer(){ // Destructor of Layer class
    for(int i = 0; i < number_of_neurons_of_layer; i++){
        delete neuron[i];
    }
    delete [] neuron;
}

class Network{
private:
    Layer *layer_array; // layer array that holds incoming layers
    int number_of_layers; // total number of layers
    int current_layer; // indicates where to add incoming new layer
public:
    Network(int);
    Layer* getLayerArray() const{ return layer_array; };
    void setNumberOfLayers(int x){ number_of_layers = x; };
    int getNumberOfLayers() const{ return number_of_layers; };
    void add2network(Layer *layer);
    void print() const;
    ~Network();
};

Network::Network(int x){ // Contructor with parameter for Network class
    number_of_layers = x;
    layer_array = new Layer[number_of_layers];
    current_layer = 0;
}

void Network::add2network(Layer *layer){
    layer_array[current_layer] = *layer;
    current_layer++;
}

void Network::print()const{ // prints all the network
    for(int i = 0; i < number_of_layers; i++){
        cout << "Layer " << i << ":" << endl;
        layer_array[i].print_layer();
    }
}

Network::~Network(){
    delete [] layer_array;
}

int main(int argc, char *argv[]){

    int line1, int* line2, int* line3, int* line4;
    int i, j;
    
    ifstream infile;
    infile.open(argv[1]);

    infile >> line1;

    line2 = new int[line1];
    for(i = 0; i < line1; i++){  // Reading line2 from txt file
        infile >> line2[i];
    }

    line3 = new int[line1];			// Reading line3 from txt file
    for(i = 0; i < line1; i++){
        infile >> line3[i];
    }

    line4 = new int[line2[0] + 1];		// Reading line4 from txt file. +1 alloacation for the exception handling later.
    line4[line2[0]] = 123123;
    for(i = 0; i < line2[0]+1; i++){
        infile >> line4[i];
    }

    if(!infile.is_open()){ // Checks if the txt file can be opened or not.
        cout << "ERROR: input file can not been opened!!!" << endl;
        return 0;
    }

    Network network(line1);

    int error1 = 1;
    try{  // Checks if activation types are proper or not.
        for(int i = 0; i < line1; i++){
            if(line3[i] != 0 && line3[i] != 1 && line3[i] != 2){
                throw error1;
            }
        }
    }catch(int error1){
        cout << "Unidentified activation function!" << endl;
        return 0;
    }

    int error2 = 2;
    try{ // Checks if number of z values from txt file is correct or not.
        if(line4[line2[0]] != 123123){
            throw error2;
        }
    }catch(int error2){
        cout << "Input shape does not match!" << endl;
        return 0;
    }

    int number_of_neurons;
    int type_of_neurons;

    for(i = 0; i < line1; i++){
        number_of_neurons = line2[i];
        type_of_neurons = line3[i];

        Layer *new_layer = new Layer;
        new_layer -> setTypeOfLayer(type_of_neurons);
        new_layer -> setNumberOfNeurons(number_of_neurons);
        new_layer -> create_layer();

        network.add2network(new_layer);
    }

    double first_z = 0.0;
    // In this for loop, i give the values from line4 to first layer.
    for(i = 0; i < network.getLayerArray()[0].getNumberOfNeurons(); i++){       
    	
        network.getLayerArray()[0].getNeuron()[i]->setA(line4[i]);
        network.getLayerArray()[0].getNeuron()[i]->setZ(line4[i]);
        first_z += line4[i];
    }

    first_z = first_z * 0.1 + 0.1;
    // After i created the first layer, i set other layers a and z values in this for loop.
    for(i = 1; i < network.getNumberOfLayers(); i++){
        for(j = 0; j < network.getLayerArray()[i].getNumberOfNeurons(); j++){
            if(i == 1){
                network.getLayerArray()[i].getNeuron()[j]->setZ(first_z); 
                network.getLayerArray()[i].getNeuron()[j]->activate();
            }else{
                network.getLayerArray()[i].getNeuron()[j]->setZ(((network.getLayerArray()[i-1].getNeuron()[0]->getA())*network.getLayerArray()[i-1].getNumberOfNeurons())*0.1 + 0.1);
                network.getLayerArray()[i].getNeuron()[j]->activate();
            } 
        }
    }

    network.print(); // Prints the result.

    delete [] line2;
    delete [] line3;
    delete [] line4;

    infile.close();

    return 0;
}