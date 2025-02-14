import SwiftUI
import SwiftData
         
struct ContentView: View {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Product.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    
    @Query var products: [Product]
    @State private var showMenu: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .leading) {
                TabView{
                    Group {
                        Home()
                            .tabItem {
                                Image(systemName: "house")
                            }
                        Favorites()
                            .tabItem {
                                Image(systemName: "star")
                            }
                        Profile()
                            .tabItem {
                                Image(systemName:"circle")
                            }
                            
                    }
                }
                
                
                //ADICIONAR AVISO NAO TAO EVASIVO
//                if products.count > 0 {
//                    
//                }
                
            }
        }
        .modelContainer(sharedModelContainer)
        
        
    }
}

#Preview {
    ContentView()
}
