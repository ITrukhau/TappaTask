import UIKit
import Foundation

// Basic program that calculates a statement of a customer's charges at a car rental store.
//
// A customer can have multiple "Rental"s and a "Rental" has one "Car"
// As an ASCII class diagram:
//          Customer 1 ----> * Rental
//          Rental   * ----> 1 Car
//
// The charges depend on how long the car is rented and the type of the car (economy, muscle or supercar)
//
// The program also calculates frequent renter points.
//
//
// Refactor this class how you would see fit.
//
// The actual code is not that important, as much as its structure. You can even use "magic" functions (e.g. foo.sort()) if you want


 class Car {
    static let MUSCLE = 2
    static let ECONOMY = 0
    static let SUPERCAR = 1

    let _title: String
    var _priceCode: Int
    
    init(title: String, priceCode: Int) {
         self._title = title
         self._priceCode = priceCode
    }
    func getPriceCode() -> Int {
         return _priceCode
    }
    func setPriceCode(arg: Int) {
         self._priceCode = arg
    }
    func getTitle() -> String {
         return _title
    }
}


 class Rental {
    private let _car : Car
    private let _daysRented: Int
    
    init(car: Car, daysRented: Int) {
         self._car = car
         self._daysRented = daysRented
    }
    func getDaysRented() -> Int {
         return _daysRented;
    }
    func getCar() ->  Car {
         return _car;
    }
}

class Customer {
    let _name: String
    private var _rentals = [Rental]();

    init(name: String) {
         self._name = name;
    }
    
    func addRental(arg: Rental) {
        _rentals.append(arg);
    }
    func getName() -> String {
         return _name;
    }

    func billingStatement() -> String {
        
    var totalAmount: Double = 0
    var frequentRenterPoints = 0
     
    var iterator = _rentals.makeIterator()
    var result = "Rental Record for " + getName() + "\n"
    
    while (true) {
            if let each = iterator.next() {
                var thisAmount: Double = 0;

                //determine amounts for each line
                switch each.getCar().getPriceCode() {
                    case Car.ECONOMY:
                         thisAmount += 80
                         if (each.getDaysRented() > 2) {
                            thisAmount += (Double(each.getDaysRented()) - 2) * 30.0
                         }
                         break;
                    case Car.SUPERCAR:
                        thisAmount += Double(each.getDaysRented()) * 200.0
                         break;
                    case Car.MUSCLE:
                         thisAmount += 200
                         if (each.getDaysRented() > 3) {
                            thisAmount += (Double(each.getDaysRented()) - 3) * 50.0
                         }
                        break
                    default:
                        break;
                }
                // add frequent renter points
                frequentRenterPoints += 1
                // add bonus for a two day new release rental
                if ((each.getCar().getPriceCode() == Car.SUPERCAR) && each.getDaysRented() > 1) { frequentRenterPoints += 1 }
                //show figures for this rental
                result += "\t" + each.getCar().getTitle() + "\t" + String(thisAmount) + "\n";
                totalAmount += thisAmount;
            } else {
                break
            }
    }
    //add footer lines
    result += "Final rental payment owed " + String(totalAmount) + "\n";
    result += "You received an additional " + String(frequentRenterPoints) + " frequent customer points"; return result;
    }
}



let rental1 = Rental(car: Car(title: "Mustang", priceCode: Car.MUSCLE), daysRented: 5)
let rental2 = Rental(car: Car(title: "Lambo", priceCode: Car.SUPERCAR), daysRented: 20)
let customer = Customer(name: "Liviu")
customer.addRental(arg: rental1)
customer.addRental(arg: rental2)


print(customer.billingStatement())
