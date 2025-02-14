import SwiftUI
import SwiftData

struct Home:View {
   @State var selectedCategory = ""
   @State private var showMenu: Bool = false
    
  
   var body: some View {
           NavigationView {
               ScrollView {
                   VStack {
                       HStack {
                           
                       }
                       .frame(height:25)
                       
                       Text("Beeware - Início")
                           .font(.system(size:25))
                           .padding(.leading)
                           .position(x:105,y:30)
                       Image(systemName: "house")
                           .position(x:217,y:-7)
                       
                       HStack{
                           
                       }
                       .frame(height:25)
                       
                       
                       //category list - FILTRAR PRODUTOS POR CATEGORIA
                       ScrollView {
                           
                           CategoryListView
                       }
                       
                       
                       //collection view
                       HStack {
                           Text("Mais populares")
                               .font(.system(size:24))
                           
                           Spacer()
                           
                           Image(systemName: "arrow.right")
                               .imageScale(.large)
                       }
                       .padding(.horizontal, 30)
                       .padding(.vertical, 15)
                       
                       //product list
                       ScrollView(.horizontal,showsIndicators: false) {
                           HStack {
                               ForEach(productList,id: \.id) { item in
                                   ProductCard(product: item)
                               }
                           }
                           .padding(.leading)
                       }
                   }
               }
       }
   }

   var CategoryListView: some View {
       
       ScrollView(.horizontal,showsIndicators: false) {
           HStack {
               ForEach(categoryList, id: \.id) { item in
                   Button {
                       selectedCategory = item.title
                   } label: {
                       HStack {
                           if item.title != "Todos" {
                               Image(item.icon)
                                   .foregroundColor(selectedCategory == item.title ? .yellow: .black)
                           }
                           Text(item.title)
                       }
                       .padding(20)
                       .background(selectedCategory == item.title ? .black: .gray.opacity(0.1))
                       .foregroundColor(selectedCategory != item.title ? .black: .white)
                       .clipShape(Capsule())
                       
                   }
               }
           }
           .padding(.horizontal,30)
       }
   }
}


struct ProductCard: View {
    @State var product: Product
    
    @Query var products: [Product]
    @Environment(\.modelContext) var modelContext

    
   var body: some View {
       NavigationLink {
        //desc
       } label: {
           ZStack {
               if product.category == "GPU" {
                   Image(product.image)
                        .resizable()
                        .frame(width:500)
                        .position(x:80,y:220)
                        .scaledToFit()
                        .padding(.trailing, -200)
                        .rotationEffect(Angle(degrees: 8))
               } else if product.category == "CPU" {
                   Image(product.image)
                        .resizable()
                        .frame(width:450,height:400)
                        .position(x:205,y:250)
                        .scaledToFit()
                        .padding(.trailing, -200)
                        .rotationEffect(Angle(degrees: 0))
               } else if product.category == "ARM" {
                   Image(product.image)
                        .resizable()
                        .frame(width:590,height:590)
                        .position(x:200,y:250)
                        .scaledToFit()
                        .padding(.trailing, -200)
                        .rotationEffect(Angle(degrees: 0))
               } else if product.category == "Fonte" {
                   Image(product.image)
                       .resizable()
                       .frame(width:325,height:325)
                       .position(x:145,y:250)
                       .scaledToFit()
                       .padding(.trailing, -200)
                       .rotationEffect(Angle(degrees: 0))
               }
               
               ZStack {
                   VStack(alignment: .leading, content: {
                       if product.category == "GPU" {
                           Text("\(product.name)")
                               .font(.system(size: 36, weight: .semibold))
                               .frame(width:140)
                               .position(x:50,y:40)
                           
                           Text(product.category)
                               .font(.callout)
                               .padding()
                               .background(.white.opacity(0.5))
                               .clipShape(Capsule())
                               .position(x:50,y:-35)
                           
                           Spacer()
                           
                           HStack {
                               Text("R$\(product.price).0")
                                   .font(.system(size: 25, weight: .semibold))
                               
                               Spacer()
                               
                               Button {
                                   modelContext.insert(product)
                               } label: {
                                   Image(systemName: "plus")
                                       .imageScale(.large)
                                       .frame(width: 90, height: 60)
                                       .background(.black)
                                       .clipShape(Capsule())
                                       .foregroundColor(.white)
                               }
                               .padding(.horizontal,-10)
                           }
                           .padding(.leading)
                           .padding()
                           .frame(maxWidth: .infinity)
                           .frame(height: 80)
                           .background(.white.opacity(0.9))
                           .clipShape(Capsule())
                       } else if product.category == "CPU" {
                           Text("\(product.name)")
                               .font(.system(size: 36, weight: .semibold))
                               .frame(width:140)
                               .position(x:60,y:30)
                           
                           Text(product.category)
                               .font(.callout)
                               .padding()
                               .background(.white.opacity(0.5))
                               .clipShape(Capsule())
                               .position(x:60,y:-60)
                           
                           Spacer()
                           
                           HStack {
                               Text("R$\(product.price).0")
                                   .font(.system(size: 25, weight: .semibold))
                               
                               Spacer()
                               
                               Button {
                                   modelContext.insert(product)
                               } label: {
                                   Image(systemName: "plus")
                                       .imageScale(.large)
                                       .frame(width: 90, height: 60)
                                       .background(.black)
                                       .clipShape(Capsule())
                                       .foregroundColor(.white)
                               }
                               .padding(.horizontal,-10)
                           }
                           .padding(.leading)
                           .padding()
                           .frame(maxWidth: .infinity)
                           .frame(height: 80)
                           .background(.white.opacity(0.9))
                           .clipShape(Capsule())
                           
                       } else if product.category == "ARM" {
                           Text("\(product.name)")
                               .font(.system(size: 36, weight: .semibold))
                               .frame(width:140)
                               .position(x:50,y:40)
                           
                           Text(product.category)
                               .font(.callout)
                               .padding()
                               .background(.white.opacity(0.5))
                               .clipShape(Capsule())
                               .position(x:50,y:-25)
                           
                           Spacer()
                           
                           HStack {
                               Text("R$\(product.price).0")
                                   .font(.system(size: 25, weight: .semibold))
                               
                               Spacer()
                               
                               Button {
                                   
                                   modelContext.insert(product)
                               } label: {
                                   Image(systemName: "plus")
                                       .imageScale(.large)
                                       .frame(width: 90, height: 60)
                                       .background(.black)
                                       .clipShape(Capsule())
                                       .foregroundColor(.white)
                               }
                               .padding(.horizontal,-10)
                           }
                           .padding(.leading)
                           .padding()
                           .frame(maxWidth: .infinity)
                           .frame(height: 80)
                           .background(.white.opacity(0.9))
                           .clipShape(Capsule())
                       }
                       
                       else if product.category == "Fonte" {
                           Text("\(product.name)")
                               .font(.system(size: 36, weight: .semibold))
                               .frame(width:140)
                               .position(x:65,y:40)
                           
                           Text(product.category)
                               .font(.callout)
                               .padding()
                               .background(.white.opacity(0.5))
                               .clipShape(Capsule())
                               .position(x:210,y:-100)
                           
                           Spacer()
                           
                           HStack {
                               Text("R$\(product.price).0")
                                   .font(.system(size: 25, weight: .semibold))
                               
                               Spacer()
                               
                               Button {
                                   modelContext.insert(product)
                               } label: {
                                   Image(systemName: "plus")
                                       .imageScale(.large)
                                       .frame(width: 90, height: 60)
                                       .background(.black)
                                       .clipShape(Capsule())
                                       .foregroundColor(.white)
                               }
                               .padding(.horizontal,-10)
                           }
                           .padding(.leading)
                           .padding()
                           .frame(maxWidth: .infinity)
                           .frame(height: 80)
                           .background(.white.opacity(0.9))
                           .clipShape(Capsule())
                       }
                   })
               }
               .padding(30)
               .frame(width:336,height:422)
           }
           .frame(width:336,height:422)
           .background(product.colorComponent.color.opacity(0.13))
           .clipShape(.rect(cornerRadius:57))
           .padding(.leading, 20)
       }
   }
      
}
#Preview {
   Home()
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
