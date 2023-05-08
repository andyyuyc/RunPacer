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
                .toolbarBackground(Color.blue, for: .tabBar)
                .tag(0)
            
            Record()
            .tabItem {
                Image(systemName: "clock.fill")
                Text("紀錄")
            }
            .toolbarBackground(Color.yellow, for: .tabBar)
            .tag(1)
            
            NavigationView {
                Sport()
            }
            .tabItem {
                Image(systemName: "figure.run")
                Text("運動")
            }
            .toolbarBackground(Color("SportColor"), for: .tabBar)
            .tag(2)
            
            NavigationView {
                Setting()
            }
            .tabItem {
                Image(systemName: "gearshape")
                Text("設定")
            }
            .toolbarBackground(Color("BG"), for: .tabBar)
            .tag(3)
            
        }
        .accentColor(.white)
        .onAppear { // 設定初始的背景色
            UITabBar.appearance().unselectedItemTintColor = .black // 未選取的顏色
        }
    }
}

// 根據選擇的選項設定 tabbar 的背景色
private func setTabBarColor(for tab: Int) {
    switch tab {
    case 0:
        UITabBar.appearance().backgroundColor = .blue
    case 1:
        UITabBar.appearance().backgroundColor = .green
    case 2:
        UITabBar.appearance().backgroundColor = .red
    default:
        break
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
