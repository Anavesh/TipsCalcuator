import UIKit

class TipsView: UIView {
    
    fileprivate let tipsLabel:UILabel = {
        let label = UILabel()
        label.text = "Tips"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    fileprivate let tipsCollection: UICollectionView = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
   // This array will define the values of cells in the collection
    
    fileprivate var tipsArray = ["10%", "15%", "20%","25%"]
    
    var tipsCount = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setUpConstraints()
        delegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func delegate() {
        tipsCollection.delegate = self
        tipsCollection.dataSource = self
    }
    
    fileprivate  func setupView() {
        addSubview(tipsLabel)
        addSubview(tipsCollection)
        tipsCollection.register(TipsViewCollectionCell.self, forCellWithReuseIdentifier: "cell")
    }
    
  fileprivate func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            tipsLabel.topAnchor.constraint(equalTo: topAnchor),
            tipsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:5),
            tipsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
        
            tipsCollection.topAnchor.constraint(equalTo: tipsLabel.bottomAnchor, constant: 4),
            tipsCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            tipsCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            tipsCollection.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            tipsCollection.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}

extension TipsView: UICollectionViewDelegate {
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           switch indexPath.row {
           case 0:
               tipsCount = 10
           case 1:
               tipsCount = 15
           case 2:
               tipsCount = 20
           case 3:
               tipsCount = 25
           default:
               tipsCount = 0
        }
    }
}
extension TipsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsViewCollectionCell else {return UICollectionViewCell()}
        cell.tipsAmountLabel.text = tipsArray[indexPath.row]
        return cell
    }
}
extension TipsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/5, height: collectionView.frame.width/6.5)
    }
}
