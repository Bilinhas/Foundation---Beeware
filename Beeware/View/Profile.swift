import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationView {
            HStack {
                ForEach(categoryList, id: \.id) { item in
                    //Text("oi")
                }
            }
            .padding(.horizontal,30)
        }
    }
}


struct Profile_Previews: PreviewProvider {
  static var previews: some View {
      ContentView()
  }
}

