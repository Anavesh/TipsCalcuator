import UIKit

extension MainViewController {
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        // All of the custom views use the same anchors for their placement on the view. Therefore a function was created that takes in the values of constants and multipliers and assigns them to the predefined anchors in the method
        
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


