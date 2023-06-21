import SwiftUI
import UserNotifications
import CoreData

struct ContentView: View {
    @State private var selection = 0
    @State private var isFunctionExecuted = false
    
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
                ContentView_1()
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
            
            NavigationView {
                testCoredata()
            }
            .tabItem {
                Image(systemName: "gearshape")
                Text("Test")
            }
            .toolbarBackground(Color("BG"), for: .tabBar)
            .tag(4)
            
        }
        .accentColor(.white)
        .onAppear { // 設定初始的背景色
            UITabBar.appearance().unselectedItemTintColor = .black //
            scheduleLocalNotification()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
func scheduleLocalNotification() {
       let content = UNMutableNotificationContent()
       content.title = "Function Execution"
       content.body = "It's time to execute the function!"
       
       let calendar = Calendar.current
       let now = Date()
       
       // 設定下一個12點的日期元件
       var dateComponents = calendar.dateComponents([.year, .month, .day, .hour], from: now)
       dateComponents.hour = 12
       let nextNoon = calendar.nextDate(after: now, matching: dateComponents, matchingPolicy: .nextTime)
       
       /*let trigger = UNCalendarNotificationTrigger(dateMatching: calendar.dateComponents([.year, .month, .day, .hour], from: nextNoon!), repeats: true)
       
       let request = UNNotificationRequest(identifier: "FunctionExecution", content: content, trigger: trigger)
       
       UNUserNotificationCenter.current().add(request) { error in
           if let error = error {
               print("Failed to schedule local notification: \(error)")
           } else {
               print("Local notification scheduled.")
           }
       }*/
   }
