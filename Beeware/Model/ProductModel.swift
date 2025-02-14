import SwiftUI
import SwiftData

struct ColorComponents: Codable {
    let red: Float
    let green: Float
    let blue: Float
    
    var color: Color {
        Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
    
    static func fromColor(_ color:Color) -> ColorComponents{
        let resolved = color.resolve(in: EnvironmentValues())
        return ColorComponents(
            red: resolved.red,
            green: resolved.green,
            blue: resolved.blue
        )
    }
}

@Model
class Product {
//    var id: UUID = .init()
    var name: String
    var category: String
    var desc: String
    var image: String
    var colorComponent: ColorComponents
    var price: Int
    
    init(name: String, category: String, desc: String, image: String, color: Color, price: Int) {
        self.name = name
        self.category = category
        self.desc = desc
        self.image = image
        self.colorComponent = ColorComponents.fromColor(color)
        self.price = price
    }
}

@Model
class Cart {
    var products: [Product]
    var total: Int
    
    init(products: [Product], total: Int = 0) {
        self.products = products
        self.total = total
    }
}

var productList = [
    Product(name: "RTX 4090", category: "GPU", desc: "descriçao do produto",image: "4090", color: .blue, price: 4000),
    Product(name: "Ryzen 7", category: "CPU", desc: "descriçao do produto 2",image: "ryzen", color: .blue, price: 1200),
    Product(name: "Kingston SSD", category: "ARM", desc: "descriçao do produto",image: "kingston", color: .blue, price: 377),
    Product(name: "Corsair 550w", category: "Fonte", desc: "descriçao do produto",image: "corsair", color: .blue, price: 411),
    ]
