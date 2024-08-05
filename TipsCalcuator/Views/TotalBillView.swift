import UIKit

class TotalBillView: UIView {
    
    fileprivate let totalBillLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = "Total bill"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true // размещает шрифт по ширине view
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sumTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir Next Bold", size: 36)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = #colorLiteral(red: 0.5972653031, green: 0.9011378884, blue: 1, alpha: 1)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        textField.tintColor = .black
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(totalBillLabel)
        addSubview(sumTextField)
    }

    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            totalBillLabel.topAnchor.constraint(equalTo: topAnchor),
            totalBillLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            totalBillLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            
            sumTextField.topAnchor.constraint(equalTo: totalBillLabel.bottomAnchor, constant: 4),
            sumTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            sumTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            sumTextField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

