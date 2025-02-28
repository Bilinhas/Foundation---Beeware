import SwiftUI
import SwiftData

struct Favorites:View {
    @Environment(\.modelContext) var modelContext
    
    @Query var products: [Product]
        
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack {
                    HStack {
                        Text("Meu PC")
                            .font(.system(size:29))
                            .padding(.trailing)
                        Image(systemName: "pc")
                            .position(x:0,y:45)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Quantidade: ")
                                .frame(width:120,height:80)
                            Text("\(products.count)")                                .imageScale(.large)
                                .padding()
                                .frame(width:70,height:90)
                                .background(.blue.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                        
                    }
                    .padding(30)
                    
                    //cart products
                    VStack(spacing: 20) {
                        ForEach(products, id: \.name) { item in
                            CartProductCard(product:item)
                        }.onDelete { indices in
                            for indice in indices {
                                modelContext.delete(products[indice])
                            }
                        }
                        .padding(.horizontal)
                        
                        // card total
                        VStack(alignment: .leading) {
                            
                            HStack {
                                Text("Valor total: ")
                                    .font(.system(size:36, weight: .semibold))
                                
                                
                                Text("R$ \(products.reduce(0) { $0 + $1.price })")
                                    .font(.system(size:36, weight: .semibold))
                            }
                            .padding(30)
                            .frame(width: .infinity)
                            .background(.blue.opacity(0.5))
                            .clipShape(.rect(cornerRadius:30))
                            .padding()
                        }
                        
                        Button {
                            let predefinition = Predefinition(products: products)
                            modelContext.insert(predefinition)
                        } label: {
                            Text("Criar predefinição")                                .imageScale(.large)
                                .padding()
                                .frame(width: .infinity)
                                .background(.blue.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                        
                        Text("OBS: Você pode criar uma predefinição para armazenar as peças que deseja montar em diferentes PCs. \n\nAs predefinições criadas podem ser visualizadas no perfil do usuário (Configurações > Conta > Predefinições).")
                            .multilineTextAlignment(.center)
                          
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    
    
    
}

//cart product view
struct CartProductCard: View {
    
    @Environment(\.modelContext) var modelContext
    
    var product: Product
    
    var deletável : Bool = true
    
    var body: some View {
        HStack(alignment:.center,spacing:20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width:80, height: 80)
                .background(.blue.opacity(0.1))
                .clipShape(Circle())
            
            
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.headline)
                
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            })
            
            
            Spacer()
            
            if deletável {
                Button {
                    modelContext.delete(product)
                } label: {
                    Text("Deletar")
                }
            }
            
            
            Text("$\(product.price)")
                .padding(.horizontal,10)
                .background(.blue.opacity(0.5))
                .clipShape(Capsule())

        }
    }
}
