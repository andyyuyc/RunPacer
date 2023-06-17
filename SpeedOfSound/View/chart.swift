//
//  chart.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/29.
//

import SwiftUI

struct chart: View {
    let data = ["Apple", "Banana", "Orange"]

    var body: some View {
        VStack {
            ForEach(Array(data.enumerated()), id: \.offset) { index, item in
                Text("Index: \(index), Item: \(item)")
            }
        }
    }
    
}

struct chart_Previews: PreviewProvider {
    static var previews: some View {
        chart()
    }
}
