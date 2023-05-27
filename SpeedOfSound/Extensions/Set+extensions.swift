//
//  Set+extensions.swift
//  MetronomeZones
//
//  Created by Andy Yu
//

import SwiftUI

extension Set where Element == PresentationDetent {

    func withLarge() -> Set<PresentationDetent> {
        var detent = self
        detent.insert(.large)
        return detent
    }
}
