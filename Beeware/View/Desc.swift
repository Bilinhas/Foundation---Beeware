import SwiftUI

struct Desc: View {
    @State var product: Product
    
    var body: some View {
        Text("oi")
        Text("\(product.name)")
            .font(.system(size: 36, weight: .semibold))
            .frame(width:140)
            .position(x:50,y:40)
    }
}

#Preview {
    //Desc()
}
