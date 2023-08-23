//
//  Training_Select.swift
//  Figma
//
//  Created by Andy Yu on 2023/8/19.
//

import SwiftUI

struct Training_Select: View {
    @Environment(\.dismiss) private var dismiss
    @State private var rangeIndex = 2
    @State private var showPage = false
    var range = ["0 km - 5 km", "5 km - 10 km", "10 km - 半马", "半马 - 全马", "全马"]
    
    var body: some View {
        ZStack() {
            
            Image("Background")
                .resizable()
                .frame(width: 415, height: 101.45978)
                .offset(x: 0, y: 390)
                .edgesIgnoringSafeArea(.bottom)
            
            Image("line")
            .frame(width: 414.00003, height: 20.9658)
            .offset(x: 0, y: 3)
            .offset(x: 0, y: 348)
            
            ZStack() {
                Text("请选择您的训练目标")
                    .font(Font.custom("Roboto", size: 34).weight(.bold))
                    .foregroundColor(Color(red: 0.33, green: 0.30, blue: 0.37))
                    .offset(x: -18.50, y: -285)
                Text("训练计划将依您的目标产生变化")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(red: 0.56, green: 0.53, blue: 0.58))
                    .offset(x: -55, y: -244.52)
                
                VStack{
                    Section{
                        Picker(selection: $rangeIndex, label: Text("Range")){
                            ForEach(0 ..< range.count){
                                Text(self.range[$0]).tag($0)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 380, height: 400)
                        
                    }

                    
                    Button("确认"){
                        dismiss()
                    }
                    
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color(red: 0.55, green: 0.36, blue: 1)
                    .cornerRadius(50))
                }
                
                
            }
            .frame(width: 414, height: 896)
            .offset(x: 0, y: 0)
        }
        .offset(y:23)
        .frame(width: 414, height: 896);
    }
}

struct Training_Select_Previews: PreviewProvider {
    static var previews: some View {
        Training_Select()
    }
}

