import SwiftUI
import SwiftData

struct Home:View {
    @State var selectedCategory: FilterCategory = .Todos
    @State private var showMenu: Bool = false
    @State var filteredProductList: [Product] = productList

    var body: some View {
        NavigationView {
            ScrollView {

                VStack {
                    HStack {
                        
                    }
                    .frame(height:25)
                
                    Text("Início")
                        .font(.system(size:25))
                        .padding(.leading)
                        .position(x:50,y:30)
                    Image(systemName: "house")
                        .position(x:105,y:-7)
                    
                    
                    Text("MONTE SEU PC")
                        .padding()
                        .bold()
                        .font(.system(size:35))
                    Text("Clique nos produtos para mais informações")
                    
                    
                    
                    
                    HStack{
                        
                    }
                    .frame(height:25)

                    
                    //category list
                    ScrollView {
                        CategoryListView
                    }
       
                    //collection view
                    VStack {
                        
                        
                        ForEach(categoryList) { category in
                                if(category.title ==    selectedCategory   .rawValue) {
                                    Text(category.desc)
                                        .multilineTextAlignment(.center)
                                }
                        }
                        .padding()
                        
                    
                        HStack {
                            Text("Sugestões")
                                .font(.system(size:24))
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    //product list
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(filteredProductList,id: \.id) { item in
                                ProductCard(product: item)
                            }
                        }
                        .padding(.leading)
                        VStack {
                            
                        }
                        .frame(height:130)
                    }
                }
            }
            
        }
    }
 
        
    var CategoryListView: some View {
        
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                
                ForEach(FilterCategory.allCases, id: \.self) { category in
                    Button {
                        selectedCategory = category
                        filteredProductList = selectedCategory.getOptions()
                    } label: {
                        HStack {
                            if category.rawValue != "Todos", let imageName = category.getImage() {
                                Image("")
                                    .foregroundColor(selectedCategory.rawValue == category.rawValue ? .yellow: .black)
                            }
                            Text(category.rawValue)

                        }
                        .padding(20)
                        .background(
                            selectedCategory.rawValue == category.rawValue ? .black: .gray.opacity(0.1)
                                
                        )
                        .foregroundColor(
                            selectedCategory.rawValue != category.rawValue ? .black: .white
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    }
                }
                
            }
            .padding(.horizontal,30)
            
        }
        
    }
}

struct ProductCard: View {
    @State var product: Product
    @State var filteredProductList: [Product] = productList

    @Query var products: [Product]
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        NavigationLink {
            ScrollView(.horizontal){
                HStack {
                    
                    
                    if product.image2 == "4090 2" {
                        Image(product.image)
                            .resizable()
                            .frame(width:360, height: 200)
                            .position(x:190,y:200)
                        Image(product.image2)
                            .resizable()
                            .frame(width:360, height: 200)
                            .position(x:190,y:200)
                    } else {
                        Image(product.image)
                            .resizable()
                            .frame(width:240, height: 200)
                            .position(x:190,y:200)
                        Spacer(minLength: 120)
                        Image(product.image2)
                            .resizable()
                            .frame(width:240, height: 200)
                            .position(x:190,y:200)
                        Spacer(minLength: 80)
                    }
                }
            }
            .frame(height:300)
            
            if product.category == "Gabinete" {
                Text(product.name)
                                .position(x:150,y:65)
                                .bold()
                                .font(.system(size:27))
            } else if product.category == "CPU"{
                Text(product.name)
                                                .position(x:148,y:65)
                                                .bold()
                                                .font(.system(size:33))
            } else if product.category == "RAM"{
                Text(product.name)
                                                .position(x:143,y:65)
                                                .bold()
                                                .font(.system(size:27))
            } else if product.category == "Cooler"{
                Text(product.name)
                                                .position(x:143,y:65)
                                                .bold()
                                                .font(.system(size:27))
            } else if product.category == "PlacaMàe"{
                Text(product.name)
                                                .position(x:120,y:65)
                                                .bold()
                                                .font(.system(size:27))
            } else {
                Text(product.name)
                                                .position(x:120,y:65)
                                                .bold()
                                                .font(.system(size:40))
            }
                
            
        
            Text(product.marca)
                .position(x:55,y:20)
            
            
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
            .padding(.horizontal,-15)
            .position(x:360,y:40)
            
            
            ScrollView {
                VStack (alignment: .leading){
                    Divider()
                    Text("Descrição: \n")
                        .position(x: 50,y:35)
                        .bold()
                    Text(product.desc)
                        .frame(alignment:.leading)
                    
                    Text("\nRecomendação: \n")
                        .bold()
                    
                    if product.rating == ""{
                        Text("Indisponível.")
                            .multilineTextAlignment(.center)
                    } else {
                        Text(product.rating)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack {
                        
                    }
                    .padding(.vertical,10)
                    
                    Text("Lojas recomendadas: \n")
                        .bold()
                    
                    Link("Pesquise na Web \n", destination: URL(string: "https://google.com/search?q=\(product.name)")!)
                        .bold()
                    
                    Link("Pichau \n", destination:URL(string:"https://www.pichau.com.br/search?q=\(product.name)")!)
                        .bold()
                    
                    Link("Kabum \n", destination:URL(string: "https://www.kabum.com.br/busca/\(product.name)")!)
                        .bold()
                    
                    Link("Terabyte \n", destination:URL(string: "https://www.terabyteshop.com.br/busca?str=\(product.name)")!)
                        .bold()
                    
                    Link("Aliexpress \n", destination:URL(string: "https://pt.aliexpress.com/w/wholesale-\(product.name).html?osf=direct&spm=a2g0n.home.header.0")!)
                        .bold()
                    
                    
                    HStack {
                        
                    }
                    .frame(height:200)
                    
                }
            }
            .padding(10)
            .position(x:215,y:375)
            .frame(height: 600)
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
                } else if product.category == "PSU" {
                    Image(product.image)
                        .resizable()
                        .frame(width:325,height:325)
                        .position(x:145,y:250)
                        .scaledToFit()
                        .padding(.trailing, -200)
                        .rotationEffect(Angle(degrees: 0))
                } else if product.category == "RAM" {
                    Image(product.image)
                        .resizable()
                        .frame(width:325,height:325)
                        .position(x:130,y:250)
                        .scaledToFit()
                        .padding(.trailing, -200)
                        .rotationEffect(Angle(degrees: 0))
                } else if product.category == "Gabinete" {
                    Image(product.image)
                        .resizable()
                        .frame(width:325,height:325)
                        .position(x:190,y:235)
                        .scaledToFit()
                        .padding(.trailing, -200)
                        .rotationEffect(Angle(degrees: 0))
                } else if product.category == "Cooler"{
                    Image(product.image)
                        .resizable()
                        .frame(width:270,height:270)
                        .position(x:160,y:230)
                        .scaledToFit()
                        .padding(.trailing, -200)
                        .rotationEffect(Angle(degrees: 0))
                } else if product.category == "PlacaMãe"{
                    Image(product.image)
                        .resizable()
                        .frame(width:310,height:310)
                        .position(x:175,y:238)
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
                                .position(x:45,y:40)
                            
                            Text(product.category)
                                        .font(.callout)
                                        .padding()
                                        .background(.white.opacity(0.5))
                                        .clipShape(Capsule())
                                        .position(x:140,y:-105)
                            
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
                                        .position(x:60,y:-40)
                            
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
                                .frame(width:170)
                                .position(x:70,y:30)
                        
                            Text(product.category)
                                        .font(.callout)
                                        .padding()
                                        .background(.white.opacity(0.5))
                                        .clipShape(Capsule())
                                        .position(x:190,y:-93)
                            
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
                        
                        else if product.category == "PSU" {
                            Text("\(product.name)")
                                .font(.system(size: 36, weight: .semibold))
                                .frame(width:140)
                                .position(x:65,y:20)
                            
                            Text(product.category)
                                        .font(.callout)
                                        .padding()
                                        .background(.white.opacity(0.5))
                                        .clipShape(Capsule())
                                        .position(x:170,y:-93)
                            
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
                        else if product.category == "RAM"{
                            Text("\(product.name)")
                                .font(.system(size: 36, weight: .semibold))
                                .frame(width:190)
                                .position(x:80,y:30)
                            
                            Text(product.category)
                                        .font(.callout)
                                        .padding()
                                        .background(.white.opacity(0.5))
                                        .clipShape(Capsule())
                                        .position(x:230,y:-105)
                            
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
                        else if product.category == "Gabinete"{
                            Text("\(product.name)")
                                .font(.system(size: 36, weight: .semibold))
                                .frame(width:250)
                                .position(x:80,y:30)
                
                            Text(product.category)
                                        .font(.callout)
                                        .padding()
                                        .background(.white.opacity(0.5))
                                        .clipShape(Capsule())
                                        .position(x:40,y:-30)
                            
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
                        else if product.category == "Cooler"{
                            Text("\(product.name)")
                                .font(.system(size: 36, weight: .semibold))
                                .frame(width:170)
                                .position(x:80,y:30)
                            
                            Text(product.category)
                                        .font(.callout)
                                        .padding()
                                        .background(.white.opacity(0.5))
                                        .clipShape(Capsule())
                                        .position(x:230,y:-105)
                            
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
                        else if product.category == "PlacaMãe"{
                            Text("\(product.name)")
                                .font(.system(size: 36, weight: .semibold))
                                .frame(width:140)
                                .position(x:60,y:33)
                            
                            Text(product.category)
                                        .font(.callout)
                                        .padding()
                                        .background(.white.opacity(0.5))
                                        .clipShape(Capsule())
                                        .position(x:215,y:-105)
                            
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
