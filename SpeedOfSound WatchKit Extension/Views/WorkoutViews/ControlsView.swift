//
//  ControlsView.swift
//  SpeedOfSound WatchKit Extension
//
//  Created by Andy Yu
//

import SwiftUI

struct ControlsView: View {
    @EnvironmentObject var workoutManager: WorkoutManager

    var body: some View {
        HStack {
            VStack {
                Button {
                    workoutManager.endWorkout()
                } label: {
                    Image(systemName: "xmark")
                }
                .tint(.red)
                .font(.title2)
                Text("結束")
            }
            VStack {
                Button {
                    workoutManager.togglePause()
                } label: {
                    Image(systemName: workoutManager.running ? "pause" : "play")
                }
                .tint(.yellow)
                .font(.title2)
                Text(workoutManager.running ? "暫停" : "Resume")
            }
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
