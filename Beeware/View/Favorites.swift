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
                        Text("Favoritos")
                            .font(.system(size:29))
                            .padding(.trailing)
                        Image(systemName: "star")
                            .position(x:0,y:45)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("\(products.count)")                                .imageScale(.large)
                                .padding()
                                .frame(width:70,height:90)
                                .background(.gray.opacity(0.5))
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
                            .background(.gray.opacity(0.5))
                            .clipShape(.rect(cornerRadius:30))
                            .padding()
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    
    //cart product view
    struct CartProductCard: View {
        
        @Environment(\.modelContext) var modelContext
        
        var product: Product
        
        var body: some View {
            HStack(alignment:.center,spacing:20) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width:80, height: 80)
                    .background(.gray.opacity(0.1))
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.headline)
                    
                    
                    Text(product.category)
                        .font(.callout)
                        .opacity(0.5)
                })
                
                
                Spacer()
                
                Button {
                    modelContext.delete(product)
                } label: {
                    Text("Deletar")
                }
                
                
                Text("$\(product.price)")
                    .padding()
                    .background(.yellow.opacity(0.5))
                    .clipShape(Capsule())
            }
        }
    }
    
}
