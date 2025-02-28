import SwiftUI
import SwiftData
         
struct ContentView: View {
   // @State private var showSheet = false
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Product.self,
            Predefinition.self,
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
                                Text("Início")
                            }
                        Favorites()
                            .tabItem {
                                Image(systemName: "pc")
                                Text("Meu PC")
                            }
                        Settings()
                            .tabItem {
                                Image(systemName:"gear")
                                Text("Configurações")
                            }
                            
                    }
                }
                
                
//                if products.count > 0 {
//                    self.showSheet = true
//                }
//                .actionSheet(isPresented: $showSheet)
                
            }
        }
        .modelContainer(sharedModelContainer)
        
        
    }
}

#Preview {
    ContentView()
}
