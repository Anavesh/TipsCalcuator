import UIKit

// This extensions to MainViewController defines the logic of CalculationButton. The logic of the button is coded as extension to MainViewController due to the fact that the calculation data will be obtained from different views.

extension MainViewController {
    
    // Adds alert with the result of tips calculation
    @objc func calculateButtonTapped() {
        showAlert()
    }
    
    // This method calculates the tips per person based on the data input by the User
    private func calculateCheckTips() -> String {
        guard let totalBillText = totalBillView.sumTextField.text,
              let totalBill = Int(totalBillText),
              let personCountText = personsView.personCountLabel.text,
              let personCount = Int(personCountText),
              personCount != 0 else {
            
            // Adding more information about possible mistakes
            if totalBillView.sumTextField.text == nil || totalBillView.sumTextField.text == "" {
                return "Total bill is empty"
            }
            if Int(totalBillView.sumTextField.text!) == nil {
                return "Total bill is not a valid number"
            }
            if personsView.personCountLabel.text == nil || personsView.personCountLabel.text == "" {
                return "Person count is empty"
            }
            if Int(personsView.personCountLabel.text!) == nil {
                return "Person count is not a valid number"
            }
            if Int(personsView.personCountLabel.text!) == 0 {
                return "Person count cannot be zero"
            }
            return "Invalid input"
        }
        
        // Assuming that tipsCount is not optional and always has value
        if tipsView.tipsCount == 0 {
            return "Tips count cannot be zero"
        }
        
        let sum = totalBill * tipsView.tipsCount / personCount / 100
        return String(sum)
    }
    
    // This method creates notification alert with the calculation result
    private func showAlert() { 
        let result = calculateCheckTips()
        let alertController = UIAlertController(title: "Tips per person", message: "\(result)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
