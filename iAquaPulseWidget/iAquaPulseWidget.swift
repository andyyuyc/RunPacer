//
//  iAquaPulseWidget.swift
//  iAquaPulseWidget
//
//  Created by Andy Yu on 2023/5/13.
//

import WidgetKit
import HealthKit
import SwiftUI


struct iAquaPulseWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "com.andyyuyc.iAquaPulse.iAquaPulseWidget", provider: Provider()) { entry in
            iAquaPulseWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("iAquaPulse Widget")
        .description("Display your step count and workouts count")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
    
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> iAquaPulseWidgetEntry {
        let stepCount = UserDefaults(suiteName: "group.com.andyyuyc.iAquaPulse")?.integer(forKey: "stepCount") ?? 1
        let workoutsCount = UserDefaults(suiteName: "group.com.andyyuyc.iAquaPulse")?.integer(forKey: "workoutsCount") ?? 1
        
        return iAquaPulseWidgetEntry(date: Date(), stepCount: stepCount, workoutsCount: workoutsCount)
    }

    
    func getSnapshot(in context: Context, completion: @escaping (iAquaPulseWidgetEntry) -> ()) {
        let stepCount = UserDefaults(suiteName: "group.com.andyyuyc.iAquaPulse")?.integer(forKey: "stepCount") ?? 1
        let workoutsCount = UserDefaults(suiteName: "group.com.andyyuyc.iAquaPulse")?.integer(forKey: "workoutsCount") ?? 1
        
        let entry = iAquaPulseWidgetEntry(date: Date(), stepCount: stepCount, workoutsCount: workoutsCount)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<iAquaPulseWidgetEntry>) -> ()) {
        let stepCount = UserDefaults(suiteName: "group.com.andyyuyc.iAquaPulse")?.integer(forKey: "stepCount") ?? 1
        let workoutsCount = UserDefaults(suiteName: "group.com.andyyuyc.iAquaPulse")?.integer(forKey: "workoutsCount") ?? 1
        
        let entry = iAquaPulseWidgetEntry(date: Date(), stepCount: stepCount, workoutsCount: workoutsCount)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}


struct iAquaPulseWidgetEntry: TimelineEntry {
    let date: Date
    let stepCount: Int
    let workoutsCount: Int
}

struct iAquaPulseWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            Text("Step Count: \(entry.stepCount)")
            Text("Workouts Count: \(entry.workoutsCount)")
        }
    }
}


struct iAquaPulseWidget_Previews: PreviewProvider {
    static var previews: some View {
        let stepCount = UserDefaults(suiteName: "group.com.andyyuyc.iAquaPulse")?.integer(forKey: "stepCount") ?? 1
        let workoutsCount = UserDefaults(suiteName: "group.com.andyyuyc.iAquaPulse")?.integer(forKey: "workoutsCount") ?? 1
        
        return iAquaPulseWidgetEntryView(entry:iAquaPulseWidgetEntry(date: Date(), stepCount: stepCount, workoutsCount: workoutsCount))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

