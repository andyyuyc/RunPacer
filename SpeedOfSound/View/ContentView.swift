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
                    
                }
                .tag(0)
            
            Record()
                .tabItem {
                    
                }
                
                .tag(1)
            NavigationView {
                ContentView_1()
            }
            .tabItem {
                
            }
            .toolbarBackground(Color("SportColor"), for: .tabBar)
            .tag(2)
            
            NavigationView {
                ContentView_1()
            }
            .tabItem {
                
            }
            .toolbarBackground(Color("SportColor"), for: .tabBar)
            .tag(3)
            
            Personal_Page()
            .tabItem {
                
            }
            .toolbarBackground(Color("BG"), for: .tabBar)
            .tag(4)
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
