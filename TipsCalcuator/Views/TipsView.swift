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
    
    fileprivate let tipsCollection: UICollectionView = { // в этой константе создаем саму коллекцию
        let collectionFlowLayout = UICollectionViewFlowLayout() // Создается экземпляр UICollectionViewFlowLayout, который будет использоваться в качестве макета для UICollectionView. Этот макет определяет, как ячейки коллекции должны быть расположены. То есть создается макет коллекции.
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout) // тут создается сама коллекция с использованием макета коллекции, созданного в константе collectionFlowLayout.
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection // возвращается коллекция
    }()
    
   // Создаем массив со значениями чаевых, которые будут присваиваться лейблам
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
      tipsCollection.register(TipsViewCollectionCell.self, forCellWithReuseIdentifier: "cell") // Этот код регистрирует класс TipsViewCollectionCell для использования в коллекции tipsCollection с указанным идентификатором "cell". tipsCollection.register: Вызывается метод register на объекте tipsCollection, который является экземпляром UICollectionView. TipsViewCollectionCell.self: Здесь TipsViewCollectionCell — это класс пользовательской ячейки коллекции. Использование self означает, что регистрируется сам класс, а не экземпляр этого класса. Это нужно для того, чтобы коллекция знала, какой тип ячеек она должна создавать и использовать. forCellWithReuseIdentifier: "cell": Указывается строка-идентификатор "cell", который будет использоваться для переиспользования ячеек. Этот идентификатор позже используется для dequeuing (извлечения) ячеек из очереди переиспользования.
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
extension TipsView: UICollectionViewDataSource { // Протокол UICollectionViewDataSource определяет методы, которые отвечают за предоставление данных и создание ячеек для коллекции.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { // numberOfItemsInSection возвращает количество элементов (ячеек) в заданном разделе коллекции.
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { // cellForItemAt - Этот метод отвечает за создание и настройку ячейки для коллекции в заданном индексе пути (indexPath).
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsViewCollectionCell else {return UICollectionViewCell()} // Создаем одну ячейку, которую будем использовать 4 раза. Идентификатор ячейки нам не важен, потому что ячейка всего одна. IndexPath определяем исходя из входных параметров и он будет определять номер ячейки и номер столбца. As? означает, что мы стандартную ячейку пытаемся привести к виду нашей кастомизированной ячейки TipsViewCollectionCell, если не получается вернуть нашу кастомизированную ячейку, то возвращается стандартная ячейка UICollectionViewCell(), скобки указывают на создание объекта или выполнение действия, или же инициализацию замыкания {}()
        cell.tipsAmountLabel.text = tipsArray[indexPath.row] // indexPath.row отвечает за порядковый номер ячейки, indexPath.section отвечает за ряд ячейки, в нашем случае так как всего 1 ряд ячеек, то section будет 0
        return cell
    }
}
extension TipsView: UICollectionViewDelegateFlowLayout { // Данный протокол позволяет определять логику определения размера ячеек в коллекции
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/5, height: collectionView.frame.width/6.5) // Этот метод (collectionView(_:layout:sizeForItemAt:) вызывается коллекцией для запроса размера ячейки для заданного indexPath (координаты ячейки в коллекции). Возвращаемый тип метода является CGSize, который определяет размеры ячейки
    }
}
