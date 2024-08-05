import UIKit

extension MainViewController {
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        // Due to the fact that all views use the same parameters as a constraint creating a method for indentifying constraints for each view was viable. This method takes in Constants and multipliers value and assigns them to constraints predefined in the body of the method.
        
        func addConstraints(to view: UIView, topAnchor: NSLayoutYAxisAnchor, topConstant: CGFloat, heightMultiplier: CGFloat, widthMultiplier: CGFloat) {
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: topAnchor, constant: topConstant),
                view.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: heightMultiplier),
                view.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: widthMultiplier),
                view.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
            ])
        }
        
        addConstraints(to: headView, topAnchor: safeArea.topAnchor, topConstant: 8, heightMultiplier: 0.34, widthMultiplier: 0.8)
        addConstraints(to: totalBillView, topAnchor: headView.bottomAnchor, topConstant: 8, heightMultiplier: 0.1, widthMultiplier: 0.8)
        addConstraints(to: personsView, topAnchor: totalBillView.bottomAnchor, topConstant: 8, heightMultiplier: 0.1, widthMultiplier: 0.8)
        addConstraints(to: tipsView, topAnchor: personsView.bottomAnchor, topConstant: 16, heightMultiplier: 0.16, widthMultiplier: 0.8)
        addConstraints(to: calculateButton, topAnchor: tipsView.bottomAnchor, topConstant: 20, heightMultiplier: 0.08, widthMultiplier: 0.6)
    }
}


