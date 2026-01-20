// =====================================
// 1. Class & Encapsulation
// =====================================

class Person {
  // Private variables (use underscore prefix)
  String _name;
  int _age;

  // Constructor to initialize private variables
  Person(this._name, this._age);

  // Public getters only (no setters for encapsulation)
  String get name => _name;
  int get age => _age;

  // Added method to provide basic person information
  String getInfo() {
    return 'Name: $_name, Age: $_age';
  }
}

// =====================================
// 2. Inheritance & Method Overriding
// =====================================

class Driver extends Person {
  // Extra variable specific to Driver
  String vehicle;

  // Constructor: calls parent constructor using super
  Driver(String name, int age, this.vehicle) : super(name, age);

  // Override method to provide driver-specific information
  @override
  String getInfo() {
    // Calling the superclass method might be useful, or just re-implement.
    // Here, we provide a driver-specific implementation.
    return '${super.getInfo()}, Vehicle: $vehicle';
    // Alternatively: return 'Name: $name, Age: $age, Vehicle: $vehicle';
  }
}

// =====================================
// 3. Abstraction & Polymorphism
// =====================================

// Abstract class defining the contract for rides
abstract class Ride {
  double calculateFare(double distance);
}

// Concrete implementation for bike rides
class BikeRide implements Ride {
  @override
  double calculateFare(double distance) {
    // Fare logic: 30 taka base + 15 taka per km
    double baseFare = 30.0;
    double perKmRate = 15.0;
    return baseFare + (distance * perKmRate);
  }
}

// Polymorphism: function accepts any Ride type
void printFare(Ride ride, double distance) {
  double fare = ride.calculateFare(distance);
  print('Distance: ${distance}km');
  print('Total Fare: ${fare.toStringAsFixed(2)} BDT');
}

// =====================================
// 4. Main Function - Output & Code Quality
// =====================================

void main() {
  print('=== Ride System Demo ===\n');

  // Create a Driver object
  Driver driver = Driver('Ariyan Ahammed Fahim ', 26, 'Bike');

  // Print driver information
  print('Driver Information:');
  print(driver.getInfo());
  print('');

  // Create a BikeRide object
  BikeRide bikeRide = BikeRide();

  // Calculate and print fare for different distances
  print('Ride Fare Calculation:');
  printFare(bikeRide, 5.0);
  print('');

  // Demonstrating polymorphism with another example
  print('Another Ride:');
  printFare(bikeRide, 10.5);
}
