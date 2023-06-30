//
//  iAquaPulseWidgetBundle.swift
//  iAquaPulseWidget
//
//  Created by Andy Yu on 2023/5/13.
//


import WidgetKit
import SwiftUI

@available(iOSApplicationExtension 17.0, *)
@main
struct iAquaPulseWidgetBundle: WidgetBundle {
    var body: some Widget {
        iAquaPulseWidget()
        iAquaPulseWidgetLiveActivity()
        
    }
}
