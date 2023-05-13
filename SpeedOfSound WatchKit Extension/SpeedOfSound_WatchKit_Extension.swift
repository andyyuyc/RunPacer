//
//  SpeedOfSound_WatchKit_Extension.swift
//  SpeedOfSound WatchKit Extension
//
//  Created by Andy Yu on 2023/4/25.
//

import AppIntents

struct SpeedOfSound_WatchKit_Extension: AppIntent {
    @available(watchOS 9, *)
    @available(watchOS 9, *)
    static var title: LocalizedStringResource = "SpeedOfSound WatchKit Extension"
    
    @available(watchOS 9.0, *)
    func perform() async throws -> some IntentResult {
        if #available(watchOS 9.0, *) {
            return .result()
        } else {
            // Fallback on earlier versions
        }
    }
}
