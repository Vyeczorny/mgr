import UIKit

protocol ViewDecorator {
    associatedtype ViewType: UIView // typ powiązany
    func decorate(view: ViewType)
}

class ImageViewDecorator: ViewDecorator {
    typealias ViewType = UIImageView

    func decorate(view: UIImageView) {
        view.backgroundColor = UIColor.black
        view.layer.cornerRadius = 5.0
        // ... więcej ustawień
    }
}

class LabelDecorator: ViewDecorator {
    typealias ViewType = UILabel

    func decorate(view: UILabel) {
        view.font = UIFont.systemFont(ofSize: 20.0)
        // ...
    }
}

let decorator1 = ImageViewDecorator() // nie trzeba podawać typu generycznego,
                                      // implementacja klasy wskazuje, czym jest ViewType
let decorator2 = LabelDecorator()
decorator1.decorate(view: UIImageView()) // system typów pilnuje,
                                         // aby view było typu UIImageView
decorator2.decorate(view: UILabel())
