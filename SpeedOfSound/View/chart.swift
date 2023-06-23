//
//  chart.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/29.
//

import SwiftUI

struct chart: View {
    @State private var currentNumber: Int = 0
    @State private var isIncrementing: Bool = false
    
    var body: some View {
        VStack {
            Text("Current Number: \(currentNumber)")
                .font(.headline)
            
            Button(action: {
                isIncrementing.toggle()
            }) {
                Text(isIncrementing ? "Stop" : "Start")
            }
        }
        .onReceive(timer) { _ in
            if isIncrementing && currentNumber < 100 {
                currentNumber += 1
            }
        }
    }
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
}

struct chart_Previews: PreviewProvider {
    static var previews: some View {
        chart()
    }
}
