//
//  chart.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/29.
//

import SwiftUI

struct chart: View {
    @State private var bgColor =
        Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
   
      
    @State private var enableNotifications = true
        @State private var enableDarkMode = false
        @State private var selectedFontSize = 16
        
        var body: some View {
            Form {
                Section(header: Text("通知設定")) {
                    Toggle("啟用通知", isOn: $enableNotifications)
                }
                
                Section(header: Text("外觀設定")) {
                    Toggle("深色模式", isOn: $enableDarkMode)
                    NavigationLink(destination: Water()) {
                        Text("目標自訂" ).foregroundColor(Color.black)
                    }
                    Picker("字體大小", selection: $selectedFontSize) {
                        Text("小").tag(14)
                        Text("中").tag(16)
                        Text("大").tag(18)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Button(action: {
                        // 點擊按鈕的動作
                    }) {
                        Text("登出")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("設定")
        }
    
}

struct chart_Previews: PreviewProvider {
    static var previews: some View {
        chart()
    }
}
