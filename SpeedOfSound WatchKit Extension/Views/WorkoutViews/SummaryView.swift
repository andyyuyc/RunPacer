//
//  SummaryView.swift
//  SpeedOfSound WatchKit Extension
//
//  Created by Anzer Arkin on 25.04.22.
//

import Foundation
import HealthKit
import SwiftUI
import WatchKit

struct SummaryView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @Environment(\.dismiss) var dismiss
    @State private var durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    var body: some View {
        if workoutManager.workout == nil {
            ProgressView("保存中")
                .navigationBarHidden(true)
        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    SummaryMetricView(title: "總時間",
                                      value: durationFormatter.string(from: workoutManager.workout?.duration ?? 0.0) ?? "")
                        .foregroundStyle(.yellow)
                    SummaryMetricView(title: "平均心率",
                                      value: workoutManager.averageHeartRate.formatted(.number.precision(.fractionLength(0))) + " bpm")
                        .foregroundStyle(.red)
                    SummaryMetricView(title: "抬腕次數",
                                      value: workoutManager.workoutModel.numberOfGotLooked.formatted() + " times")
                    SummaryMetricView(title: "反饋次數",
                                      value: workoutManager.workoutModel.numberOfFeedback.formatted() + " times")
                    SummaryMetricView(title: "總距離",
                                      value: Measurement(value: workoutManager.workout?.totalDistance?.doubleValue(for: .meter()) ?? 0,
                                                         unit: UnitLength.meters)
                                        .formatted(.measurement(width: .abbreviated,
                                                                usage: .road,
                                                                numberFormatStyle: .number.precision(.fractionLength(2)))))
                    
                        .foregroundStyle(.green)
                    Text("運動環")
                    ActivityRingsView(healthStore: workoutManager.healthStore)
                        .frame(width: 50, height: 50)
                    Button("完成") {
                        dismiss()
                    }
                }
                .scenePadding()
            }
            .navigationTitle("概括")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SummaryMetricView: View {
    var title: String
    var value: String

    var body: some View {
        Text(title)
            .foregroundStyle(.foreground)
        Text(value)
            .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
        Divider()
    }
}

struct ActivityRingsView: WKInterfaceObjectRepresentable {
    let healthStore: HKHealthStore

    func makeWKInterfaceObject(context: Context) -> some WKInterfaceObject {
        let activityRingsObject = WKInterfaceActivityRing()

        let calendar = Calendar.current
        var components = calendar.dateComponents([.era, .year, .month, .day], from: Date())
        components.calendar = calendar

        let predicate = HKQuery.predicateForActivitySummary(with: components)
        let query = HKActivitySummaryQuery(predicate: predicate) { query, summaries, error in
            DispatchQueue.main.async {
                activityRingsObject.setActivitySummary(summaries?.first, animated: true)
            }
        }

        healthStore.execute(query)

        return activityRingsObject
    }

    func updateWKInterfaceObject(_ wkInterfaceObject: WKInterfaceObjectType, context: Context) {

    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
