import SwiftUI

struct CustomTabView: View {
    
    @State var name: String = "Kaya"
    @State var plan: String = "포항에서 살아남자!!"
    
    var body: some View {
        
        TabView {
            MainView(name: $name, plan: $plan)
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(1)
            
            ProfileView(name: $name, plan: $plan)
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
                .tag(2)
        }
        .accentColor(.black)
    }
}

#Preview {
    CustomTabView()
}


