//
//  EditableWidget.swift
//  EditableWidget
//
//  Created by tigi KIM on 2021/02/25.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        

        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 100 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    
    @available(iOSApplicationExtension 16.0, *)
    func recommendations() -> [IntentRecommendation<ConfigurationIntent>] {
        let recommendation = ConfigurationIntent()
        recommendation.parameter = "recommendation"
        recommendation.enumparameter = .first
        
        return [recommendation].map { intent in
            return IntentRecommendation(intent: intent, description: intent.parameter ?? "editable")
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct iAquaPulseWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    
   
    
    var body: some View {
        
        let sharedDefaults = UserDefaults(suiteName: "group.com.andyyuyc.iAquaPulse")
        
        let stepCount = sharedDefaults?.integer(forKey: "StepCountKey") ?? 0

        let targetWaterAmount = sharedDefaults?.integer(forKey: "TargetWaterAmountKey") ?? 0
        
        switch family {
        case .accessoryRectangular:
            ZStack(alignment: .leading) {
                if #available(iOSApplicationExtension 16.0, *) {
                    
                    
                    HStack(spacing: 10) {
                        
                        VStack(alignment: .leading) {
                            Text("补水量: \(targetWaterAmount)ml")
                            
                            
                            switch entry.configuration.enumparameter {
                            case .unknown:
                                Text("步数: \(stepCount)")
                            case .first:
                                Text("first enum")
                            case .second:
                                Text("second enum")
                            default:
                                Text("default enum")
                                
                            }
                        }
                    }
                    .padding()
                }
            }
        default:
            VStack(spacing: 20) {
                Text("补水量: \(targetWaterAmount)ml")
                
                
                switch entry.configuration.enumparameter {
                case .unknown:
                    Text("步数: \(stepCount)")
                case .first:
                    Text("步数: \(stepCount)")
                case .second:
                    Text("步数: \(stepCount)")
                default:
                    Text("步数: \(stepCount)")

                }
            }
        }
    }
}


struct iAquaPulseWidget: Widget {
    let kind: String = "iAquaPulseWidget"

    var supportedFamilies: [WidgetFamily] {
        if #available(iOSApplicationExtension 16.0, *) {
#if os(watchOS)
            return [.accessoryRectangular]
#else
            return [.accessoryRectangular, .systemSmall, .systemMedium, .systemLarge]
#endif
        } else {
#if os(watchOS)
            return []
#else
            return [.systemSmall, .systemMedium, .systemLarge]
#endif
        }
    }
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            iAquaPulseWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Editable Widget")
        .description("This is an editable widget.")
        .supportedFamilies(self.supportedFamilies)
    }
}


struct iAquaPulseWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            if #available(iOSApplicationExtension 16.0, *) {
                iAquaPulseWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                    .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
                    .previewDisplayName("accessoryRectangular")
            }
            
#if os(iOS)
            iAquaPulseWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .previewDisplayName("systemSmall")
            
            iAquaPulseWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .previewDisplayName("systemMedium")
            
            iAquaPulseWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .previewDisplayName("systemLarge")
#endif
        }
    }
}
