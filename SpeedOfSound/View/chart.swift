//
//  chart.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/29.
//

import SwiftUI

struct chart: View {
    var body: some View {
         ZStack {
             Color.blue
                 .ignoresSafeArea()
             ScrollView {
                 VStack(spacing: 20) {
                     ForEach(1...20, id: \.self) { index in
                         Text("Row \(index)")
                             .font(.title)
                             .foregroundColor(.white)
                             .frame(maxWidth: .infinity)
                             .frame(height: 100)
                             .background(Color.orange)
                             .cornerRadius(10)
                     }
                 }
                 .padding()
             }
         }
     }}

struct chart_Previews: PreviewProvider {
    static var previews: some View {
        chart()
    }
}
