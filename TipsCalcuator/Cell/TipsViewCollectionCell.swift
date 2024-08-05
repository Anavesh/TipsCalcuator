import UIKit

class TipsViewCollectionCell: UICollectionViewCell {
    
    
    let tipsAmountLabel: UILabel = {
        let button = UILabel()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.text = "0"
        button.textAlignment = .center
        button.font = UIFont(name: "Avenir Next Bold", size: 24)
        button.textColor = .black
        button.minimumScaleFactor = 0.5
        button.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        addSubview(tipsAmountLabel)
        backgroundColor = #colorLiteral(red: 0.4951053858, green: 0.9051901698, blue: 1, alpha: 0.926919495)
        layer.cornerRadius = 10
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tipsAmountLabel.topAnchor.constraint(equalTo: topAnchor,constant: 3),
            tipsAmountLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 3),
            tipsAmountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            tipsAmountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            tipsAmountLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
}
