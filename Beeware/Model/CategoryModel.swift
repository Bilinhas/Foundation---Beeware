import SwiftUI
        
        struct CategoryModel: Identifiable, Hashable {
            var id: UUID = .init()
            var icon: String
            var title: String
        }
    
        var categoryList: [CategoryModel] = [
            CategoryModel(icon:"",title:"Todos"),
            CategoryModel(icon:"",title:"CPU"),
            CategoryModel(icon:"",title:"GPU"),
            CategoryModel(icon:"",title:"RAM"),
            CategoryModel(icon:"",title:"Gabinete"),
            CategoryModel(icon:"",title:"Air Cooler"),
            CategoryModel(icon:"",title:"Fonte"),
            CategoryModel(icon:"",title:"Placa"),
        ]
