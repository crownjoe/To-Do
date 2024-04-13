import SwiftUI

struct CustomTabView: View {
    
    var body: some View {
        TabView {
            MainView(viewModel: TodoViewModel())
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(1)
            
            ProfileView()
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


