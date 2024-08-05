import UIKit

class PersonsView: UIView {


    fileprivate let personsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = "Persons"
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let personCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Bold", size: 36)
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    fileprivate let lightBlueView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5972653031, green: 0.9011378884, blue: 1, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Создаем свойство объекта класса счетчик для изменения количества людей в personsCountLabel через кнопки downButton и upButton
    var personCounter:Int = 0
    
    let personIncreaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("\u{2014}", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 24)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = .init(gray: 20, alpha: 0.5) // задает цвет границы
        button.layer.borderWidth = 1.5 // задает ширину границы кнопки
        button.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside) // задаем поведение кнопки. #selector() обозначает метод из objc который будет задавать логику действия кнопки, в () пишется название самого метода
        button.backgroundColor = #colorLiteral(red: 0.4951053858, green: 0.9051901698, blue: 1, alpha: 0.926919495)
        return button
    }()
    
    let personDecreaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 24)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = .init(gray: 20, alpha: 0.5)
        button.layer.borderWidth = 1.5
        button.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.9051901698, blue: 1, alpha: 0.7538803808)
        return button
    }()
   
// MARK: Логика работы кнопок увеличения/уменьшения количества людей (personIncreaseButton/personDecreaseButton)
        
    @objc func upButtonTapped() {
        if personCounter > 0 {
            personIncreaseButton.isEnabled = true
            personCounter += 1
            personCountLabel.text = "\(personCounter)"
        }
        personCounter += 1
            personCountLabel.text = "\(personCounter)"
    }
    
    @objc func downButtonTapped() {
        
        if personCounter == 0 {
            personIncreaseButton.isEnabled = false
        } else {
            personCounter -= 1
            personCountLabel.text = "\(personCounter)"
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    fileprivate func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(personsLabel)
        addSubview(lightBlueView)
        lightBlueView.addSubview(personDecreaseButton)
        lightBlueView.addSubview(personIncreaseButton)
        lightBlueView.addSubview(personCountLabel)
    }

    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            personsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            personsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            personsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.19),
            
            lightBlueView.topAnchor.constraint(equalTo: personsLabel.bottomAnchor, constant: 4),
            lightBlueView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lightBlueView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lightBlueView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            
            personIncreaseButton.topAnchor.constraint(equalTo: lightBlueView.topAnchor),
            personIncreaseButton.heightAnchor.constraint(equalTo: lightBlueView.heightAnchor),
            personIncreaseButton.widthAnchor.constraint(equalTo: lightBlueView.widthAnchor, multiplier: 0.2),
            personIncreaseButton.leadingAnchor.constraint(equalTo: lightBlueView.leadingAnchor),
        
            personDecreaseButton.topAnchor.constraint(equalTo: lightBlueView.topAnchor),
            personDecreaseButton.heightAnchor.constraint(equalTo: lightBlueView.heightAnchor),
            personDecreaseButton.widthAnchor.constraint(equalTo: lightBlueView.widthAnchor, multiplier: 0.2),
            personDecreaseButton.trailingAnchor.constraint(equalTo: lightBlueView.trailingAnchor),
            
            personCountLabel.topAnchor.constraint(equalTo: lightBlueView.topAnchor),
            personCountLabel.leadingAnchor.constraint(equalTo: personIncreaseButton.trailingAnchor, constant: 10),
            personCountLabel.trailingAnchor.constraint(equalTo: personDecreaseButton.leadingAnchor, constant: -10),
            personCountLabel.centerYAnchor.constraint(equalTo: lightBlueView.centerYAnchor)
        ])
    }
}
