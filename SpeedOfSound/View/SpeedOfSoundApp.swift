import SwiftUI

@main
struct SpeedOfSoundApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            //Home()
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
