#include <iostream>
#include <string>
using namespace std;

class Person{
private:
    string name;
    string surname;
public:
    void setName(string name){this->name = name;}
    string getName(){return this->name;}
    void setSurname(string surname){this->surname = surname;}
    string getSurname(){return this->surname;}
};

class Owner: public Person{
private:
    int ownership; //(100 / number_of_owners)
public:
    Owner *next;
    void setOwnership(int ownership){this->ownership = ownership;}
    int getOwnership(){return this->ownership;}
    Owner();
    Owner(string, string);
};

Owner::Owner(){
    next = NULL;
}

Owner::Owner(string name, string surname){
    this->setName(name);
    this->setSurname(surname);
}

class Courier: public Person{
private:
    string vehicle; // car(200), motorcycle(35), bicycle(10)
    int capacity;
public:
    Courier *next;
    void setVehicle(string vehicle){this->vehicle = vehicle;}
    string getVehicle(){return this->vehicle;}
    void setCapacity(int capacity){this->capacity = capacity;}
    int getCapacity(){return this->capacity;}
    Courier();
    Courier(string,string,string);
    bool operator==(Courier&);
};

Courier::Courier(string name, string surname, string vehicle){
    this->setName(name);
    this->setSurname(surname);
    this->setVehicle(vehicle);
    this->next = NULL;

    if(vehicle == "car"){
        setCapacity(200);
    }else if(vehicle == "motorcycle"){
        setCapacity(35);
    }else if(vehicle == "bicycle"){
        setCapacity(10);
    }else{
        setCapacity(0);
        if(vehicle != "silly_vehicle"){
            cout << "Wrong vehicle name is given!!! It's capacity is set to 0." << endl;
        }
    }
}

bool Courier::operator==(Courier &search) {
    return getName() == search.getName() && getSurname() == search.getSurname() && getVehicle() == search.getVehicle();
}

Courier::Courier() {

}

class Business{
private:
    string business_name;
    string address;
    int number_of_couriers;
public:
    Owner *head_owner = NULL;
    Courier *head_courier = NULL;
    Owner *owner_array;
    void setBusiness_name(string business_name){this->business_name = business_name;}
    string getBusiness_name(){return this->business_name;}
    void setAddress(string address){this->address = address;}
    string getAddress(){return this->address;}
    void Courier_number();
    void hire_courier(Courier&);
    void fire_courier(Courier&);
    void list_couriers();
    void list_owners();
    int calculate_shipment_capacity();
    Business(string, string, Owner*, int);
    void operator()();
    Courier& operator[](int);
    ~Business();
};

Business::Business(string business_name, string address, Owner* owner_array, int number_of_owners) {
    this->setBusiness_name(business_name);
    this->setAddress(address);
    this->owner_array = owner_array;
    for(int i = 0; i < number_of_owners; i++){
        Owner *new_owner = new Owner;
        new_owner -> setName(owner_array[i].getName());
        new_owner -> setSurname(owner_array[i].getSurname());
        new_owner -> setOwnership(100/number_of_owners);
        new_owner -> next = NULL;
        if(head_owner == NULL){
            head_owner = new_owner;
            head_owner->next=NULL;
        }else{
            Owner *temp = head_owner;
            while(temp -> next != NULL){
                temp = temp -> next;
            }
            temp -> next = new_owner;
            temp->next->next = NULL;
        }
    }
}

void Business::list_owners() {
    Owner *iter = head_owner;
    while(iter != NULL){
        if(head_owner == NULL){
            cout << "There is no owner in this business yet!!" << endl;
            return;
        }else {
            cout << iter->getName() << " " << iter->getSurname() << " " << iter -> getOwnership() << endl;
        }
        iter = iter -> next;
    }
}

void Business::hire_courier(Courier &inc_courier) { // Simple object addition to linked list
	Courier *new_courier = new Courier;
    new_courier->setName(inc_courier.getName());
    new_courier->setSurname(inc_courier.getSurname());
    new_courier->setVehicle(inc_courier.getVehicle());
    new_courier->setCapacity(inc_courier.getCapacity());
    new_courier -> next = NULL;
    if(head_courier == NULL){
        head_courier = new_courier;
        head_courier -> next = NULL;
    }else{
        Courier *iter = head_courier;
        while(iter->next != NULL){
            iter = iter -> next;
        }
        iter -> next = new_courier;
        iter -> next -> next = NULL;
    }
}

int Business::calculate_shipment_capacity() {
    int total_capacity = 0;
    Courier *iter = head_courier;
    while(iter != NULL){
        total_capacity += iter->getCapacity();
        iter = iter -> next;
    }
    return total_capacity;
}

void Business::list_couriers() {
    Courier *iter = head_courier;
	if(iter == NULL){
		cout << "There is no courier yet!!" << endl;
		return;
	}
    while(iter != NULL){
        cout << iter->getName() << " " << iter->getSurname() << " " << iter->getVehicle() << endl;
        iter = iter -> next;
    }
}

void Business::fire_courier(Courier &to_be_fired) { //Simple object deletion in linked list
    Courier *iter = head_courier;
    Courier *tail = head_courier;
    while(iter != NULL){
        if(*iter == to_be_fired){
            if(iter == head_courier){
                cout << "head" << endl;
                head_courier = head_courier -> next;
                delete tail;
                return;
            }else{
                tail -> next = iter -> next;
                delete iter;
                return;
            }
        }
        tail = iter;
        iter = iter -> next;
    }
}

void Business::operator()() {
    cout << getBusiness_name() << " " << getAddress() << endl;
    list_owners();
    list_couriers();
}

Courier& Business::operator[](int index) {
    Courier_number(); // calculates number of couriers currently.
    if(index+1 > number_of_couriers){
        cout << "Invalid index is entered!!! There is no matching courier to fire!!!" << endl;
        Courier *silly_courier = new Courier("silly_name", "silly_surname", "silly_vehicle");
        silly_courier -> next = NULL;	// If invalid index is entered, i create an object with silly attributes
        Courier *silly = head_courier;	// I add this silly object to end of the linked list. 
        if(silly == NULL){			// I return this silly object and it s fired.
            head_courier = silly_courier; // As a result, when the invalid input is given, without touching any
        }else{								// courier, i handle this error.
            while(silly->next != NULL){
                silly = silly -> next;
            }
            silly -> next = silly_courier;
        }
        return *silly_courier;
    }
    Courier *iter = head_courier; // If the index is valid, this block is executed.
    for(int i = 0; i < index; i++){
        iter = iter -> next;
    }
    return *iter;
}

Business::~Business() {
    Courier *dlt_c = head_courier;
    Courier *tail_c = head_courier;
    while(tail_c != NULL){
        tail_c = tail_c -> next;
        delete dlt_c;
        dlt_c = tail_c;
    }

    Owner *dlt_o = head_owner;
    Owner *tail_o = head_owner;
    while(tail_o != NULL){
        tail_o = tail_o -> next;
        delete dlt_o;
        dlt_o = tail_o;
    }
    delete [] owner_array; // From main function(i kept it with owner_array pointer in Business class)
}

void Business::Courier_number() { // Calculates the number of couriers currently.
    Courier *iter = head_courier;
    int x = 0;
    while(iter != NULL){
        x++;
        iter = iter -> next;
    }
    number_of_couriers = x;
}

int main(){
    // Create owners of the business
    //Constructor parameters: name, surname
    Owner o1 = Owner("Owner_name1", "surname1");
    Owner o2 = Owner("Owner_name2", "surname2");
    Owner* owner_arr = new Owner[2];
    owner_arr[0] = o1;
    owner_arr[1] = o2;    

    //Crete the business itself
    //Constructor parameters: name, address, owner_array, number_of_owners
    Business atlas = Business("Atlas", "Maslak Istanbul/Turkey", owner_arr, 2);
    
    // Print owner info to screen: name, surname, ownership
    atlas.list_owners();

    // Add new employees
    // Constructor parameters: name, surname, vehicle_type
    Courier c1 = Courier("Courier", "surname1", "car");
    Courier c2 = Courier("Courier", "surname2", "motorcycle");
    Courier c3 = Courier("Courier", "surname3", "motorcycle");    

    atlas.hire_courier(c1);
    atlas.hire_courier(c2);
    atlas.hire_courier(c3);


    // Print business info to screen
    // Name, address, owners, couriers
    atlas();

    // Get courier with index 1 and remove it from the list/array
    Courier cour = atlas[1];
    atlas.fire_courier(cour);
    
    // Print remaining couriers
    atlas.list_couriers();
    
    // Print current maximum shipment capacity
    cout << atlas.calculate_shipment_capacity() << endl;
    return 0;
}