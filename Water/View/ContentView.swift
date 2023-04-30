import SwiftUI

struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            Home()
                .tabItem {
                    Image(systemName: "drop.degreesign")
                    Text("喝水")
                }
                .tag(0)
            
            Record()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("紀錄")
                }
                .tag(1)
            
            NavigationView {
                Sport()
            }
            .tabItem {
                Image(systemName: "figure.run")
                Text("運動")
            }
            .tag(2)
            NavigationView {
                Setting()
            }.tabItem {
                Image(systemName: "gearshape")
                Text("設定")
            }.tag(3)
            
        }
        .accentColor(.white)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = .black // 未選取的顏色
        }
        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
