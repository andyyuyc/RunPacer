//
//  ContentView.swift
//  SpeedOfSound WatchKit Extension
//
//  Created by Anzer Arkin on 20.04.22.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var workoutTypes: [WorkoutType] = [.indoorRunning, .outdoorRunning, .indoorWalking, .outdoorWalking]
    var body: some View {
        List(workoutTypes) { workoutType in
            NavigationLink(tag: workoutType, selection: $workoutManager.selectedWorkout) {
                SessionPagingView()
            } label: {
                HStack {
                    Image(workoutType.imagName)
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(workoutType.name)
                        .bold()
                        .font(.footnote)
                }
                .onTapGesture {
                    workoutManager.selectedOneWorkout(workoutType: workoutType)
                }
            }
            .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
        }
        .listStyle(.carousel)
        .navigationBarTitle("Lets GO!!! 💪")
        .onAppear {
            workoutManager.requestAuthorization()
        }
    }
}

enum WorkoutType: String, Identifiable {
    var id: RawValue { rawValue }

    
    case outdoorRunning = "戶外跑步"
    case indoorRunning = "室內跑步"
    case outdoorWalking = "戶外步行"
    case indoorWalking = "室內步行"
    
    var name: String {
        switch self {
        case .outdoorRunning:
            return "戶外跑步"
        case .indoorRunning:
            return "室內跑步"
        case .outdoorWalking:
            return "戶外步行"
        case .indoorWalking:
            return "室內步行"
        }
    }
    
    var imagName: String {
        switch self {
        case .outdoorRunning:
            return "running"
        case .indoorRunning:
            return "running"
        case .outdoorWalking:
            return "walking"
        case .indoorWalking:
            return "walking"
        }
    }
}

