//
//  NotificationView.swift
//  SpeedOfSound WatchKit Extension
//
//  Created by Anzer Arkin on 20.04.22.
//

import SwiftUI

struct NotificationView: View {
    var message: String
    
    var body: some View {
        if message == "Slow" {
            VStack {
                Image(systemName: "drop.triangle")
                    .foregroundColor(.yellow)
                    .font(.system(size: 50))
                    .padding()
                Text("請及時補水!")
                    .foregroundColor(.yellow)
                    .font(.system(size: 20))
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(message: "Slow")
    }
}
