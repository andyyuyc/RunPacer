//
//  Training_Select.swift
//  Figma
//
//  Created by Andy Yu on 2023/8/19.
//

import SwiftUI

struct Training_Select: View {
    
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
                        showPage.toggle()
                    }
                    
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color(red: 0.55, green: 0.36, blue: 1)
                        .cornerRadius(50)).fullScreenCover(isPresented:$showPage){
                            //Record_Water()
                        }
                }
                
                
            }
            .frame(width: 414, height: 896)
            .offset(x: 0, y: 0)
            
            
            ZStack() {
                ZStack() {
                    ZStack() {
                        ZStack() {
                            Image("icon")
                                .frame(width: 19.87, height: 19.86)
                                .offset(x: 0, y: 0)
                        }
                        .frame(width: 17.66, height: 19.81)
                        .offset(x: -0.06, y: -10.32)
                        Text("个人主页")
                            .font(Font.custom("Roboto", size: 10))
                            .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                            .offset(x: 0, y: 13.72)
                    }
                    .frame(width: 40, height: 40.45)
                    .offset(x: 164, y: -2.95)
                }
                    
                
                ZStack() {
                    ZStack() {
                        Image("Group 7")
                            .frame(width: 19.87, height: 19.86)
                            .offset(x: 0, y: 0)
                    }
                    .frame(width: 19.87, height: 19.86)
                    .offset(x: -0.12, y: -9.74)
                    
                    Text("消息")
                        .font(Font.custom("Roboto", size: 10))
                        .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                        .offset(x: 0.05, y: 13.17)
                }
                .frame(width: 20.11, height: 39.34)
                .offset(x: 82.05, y: -2.05)
                

                
                
                ZStack() {
                    ZStack() {
                        ZStack() { }
                        Image("Group 6_highlight")
                            .frame(width: 19.87, height: 19.86)
                            .offset(x: 0, y: 0)
                    }
                    .frame(width: 19.88, height: 19.87)
                    .offset(x: -0.23, y: -9.74)
                    
                    Text("训练计划")
                        .font(Font.custom("Roboto", size: 10))
                        .foregroundColor(Color(red: 0.55, green: 0.36, blue: 1))
                        .offset(x: 0, y: 13.17)
                }
                .frame(width: 41, height: 39.35)
                .offset(x: -79.50, y: -2.05)
                
                
                
                
                ZStack() {
                    Image("Path 1508")
                        .frame(width: 19.87, height: 19.86)
                        .offset(x: 0, y: -8)
                    
                    Text("首页")
                        .font(Font.custom("Roboto", size: 10))
                        .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                        .offset(x: 0, y: 13.72)
                }
                .frame(width: 21, height: 38.55)
                .offset(x: -164.50, y: -2)
                
                ZStack() { }
                Image("posst")
                    .frame(width: 66.24, height: 66.21)
                    .offset(x: 0.55, y: -15.45)
            }
            .frame(width: 414, height: 112.55)
            .offset(x: 0, y: 391.28)
            ZStack() {
                ZStack() { }
                    .frame(width: 414, height: 112.55)
                    .offset(x: 0, y: 0)
                ZStack() {
                    ZStack() {
                        ZStack() { }
                            .frame(width: 9.94, height: 9.93)
                            .offset(x: -0.20, y: -4.94)
                        ZStack() { }
                            .frame(width: 17.66, height: 8.79)
                            .offset(x: 0, y: 5.51)
                    }
                    .frame(width: 17.66, height: 19.81)
                    .offset(x: -0.06, y: -10.32)
                    Text("个人主页")
                        .font(Font.custom("Roboto", size: 10))
                        .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                        .offset(x: 0, y: 13.72)
                }
                .frame(width: 40, height: 40.45)
                .offset(x: 164, y: -2.95)
                ZStack() {
                    ZStack() {
                        ZStack() { }
                            .frame(width: 19.87, height: 19.86)
                            .offset(x: 0, y: 0)
                    }
                    .frame(width: 19.87, height: 19.86)
                    .offset(x: -0.12, y: -9.74)
                    Text("消息")
                        .font(Font.custom("Roboto", size: 10))
                        .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                        .offset(x: 0.05, y: 13.17)
                }
                .frame(width: 20.11, height: 39.34)
                .offset(x: 82.05, y: -2.05)
                ZStack() {
                    ZStack() {
                        ZStack() { }
                            .frame(width: 19.73, height: 19.50)
                            .offset(x: -0.04, y: -0.06)
                    }
                    .frame(width: 19.88, height: 19.87)
                    .offset(x: -0.23, y: -9.74)
                    Text("训练计划")
                        .font(Font.custom("Roboto", size: 10))
                        .foregroundColor(Color(red: 0.55, green: 0.36, blue: 1))
                        .offset(x: 0, y: 13.17)
                }
                .frame(width: 41, height: 39.35)
                .offset(x: -79.50, y: -2.05)
                ZStack() {
                    Text("首页")
                        .font(Font.custom("Roboto", size: 10))
                        .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                        .offset(x: 0, y: 13.72)
                }
                .frame(width: 21, height: 40.45)
                .offset(x: -164.50, y: -2.95)
                ZStack() { }
                    .frame(width: 66.24, height: 66.21)
                    .offset(x: 0.55, y: -15.45)
            }
            .frame(width: 414, height: 112.55)
            .offset(x: 0, y: 581.28)
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

