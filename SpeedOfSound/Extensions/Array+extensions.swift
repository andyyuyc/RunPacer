//
//  Array+extensions.swift
//  SpeedOfSound
//
//  Created by Andy Yu
//

import Foundation

extension Array {
    func batched(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
