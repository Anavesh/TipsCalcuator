
import UIKit

class MainViewController: UIViewController {
    
 // Creation of Views that will be place in the ViewController
    
    let headView = HeadView()
    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    
    // Creation of Calculate button. The button is created here because data from different views will be used for the calculation
    
    let calculateButton: UIButton = {
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
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()

    }
    
    // This method sets the background colour for the main view and adds custom views to the main view
    
    private func setupView() {
        view.backgroundColor = .white
        addSubviews()
    }
    
    // This method indicates which subviews shall be placed in the main view
    
    private func addSubviews() {
        [headView, totalBillView, personsView, tipsView, calculateButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
}
