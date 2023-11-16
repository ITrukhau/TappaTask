enum CarPriceCode: Int {
    case economy
    case supercar
    case muscle
}

struct Car {
    let title: String
    var priceCode: CarPriceCode
}

struct Rental {
    let car: Car
    let daysRented: Int
    
    func calculateAmount() -> Double {
        switch car.priceCode {
        case .economy:
            return 80 + max(0, Double(daysRented - 2) * 30.0)
            
        case .supercar:
            return Double(daysRented) * 200.0

        case .muscle:
            return 200 + max(0, Double(daysRented - 3) * 50.0)
        }
    }
    
    func calculateFrequentRenterPoints() -> Int {
        guard car.priceCode == .supercar, daysRented > 1 else {
            return 1
        }
        
        return 2
    }
}

struct Customer {
    private var rentals: [Rental] = []

    let name: String
    
    init(name: String) {
        self.name = name
    }

    mutating func addRental(_ rental: Rental) {
        rentals.append(rental)
    }
    
    func billingStatement() -> String {
        var totalAmount: Double = 0
        var frequentRenterPoints = 0
         
        var result = "Rental Record for \(name)\n"
        
        rentals.forEach { rental in
            let rentalAmount = rental.calculateAmount()
            let rentalFrequentRenterPoints = rental.calculateFrequentRenterPoints()
            
            totalAmount += rentalAmount
            frequentRenterPoints += rentalFrequentRenterPoints
            
            result += "\t\(rental.car.title)\t\(rentalAmount)\n"
        }
        
        result += "Final rental payment owed \(totalAmount)\n"
        result += "You received an additional \(frequentRenterPoints) frequent customer points"
        return result
    }
}

let rental1 = Rental(car: Car(title: "Mustang", priceCode:.muscle), daysRented: 5)
let rental2 = Rental(car: Car(title: "Lambo", priceCode: .supercar), daysRented: 20)
var customer = Customer(name: "Liviu")
customer.addRental(rental1)
customer.addRental(rental2)


print(customer.billingStatement())
