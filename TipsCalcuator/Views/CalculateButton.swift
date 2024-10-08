import UIKit

class CalculationButton: UIView {

    // MARK: Variables
    
    let tipsCalculator = CalculationLogic()
    
    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 24)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = .init(gray: 20, alpha: 0.5) // задает цвет границы
        button.layer.borderWidth = 1.5 // задает ширину границы кнопки
        button.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.7803921569, blue: 0.05882352941, alpha: 1)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector (calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: 
    
    @objc func calculateButtonTapped() {
        showAlert()
    }
    private func showAlert() {
        let result = tipsCalculator.calculateCheckTips()
        let alertController = UIAlertController(title: "Tips per person", message: "\(result)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: View and constraints setup
    fileprivate func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(calculateButton)
    }

    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            
            calculateButton.topAnchor.constraint(equalTo: topAnchor),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            calculateButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            
        ])
    }
}
