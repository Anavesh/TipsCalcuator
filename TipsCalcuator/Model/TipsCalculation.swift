import Foundation
import UIKit

class CalculatorModel {
    var totalBill: Double = 0.0
    var tipPercentage: Double = 0.0
    var numberOfPersons: Int = 0
    
    func calculateTipPerPerson() -> Double {
        let tipAmount = totalBill * tipPercentage / 100
        let totalAmount = totalBill + tipAmount
        return totalAmount / Double(numberOfPersons)
    }
}
