//
//  Match_Result.swift
//  Figma
//
//  Created by Andy Yu on 2023/8/19.
//



import SwiftUI

struct Match_Result: View {
    @State private var showPage = false
    var body: some View {
        ZStack() {
            ZStack() {
                Text("为您推荐的配对")
                    .font(Font.custom("Roboto", size: 34).weight(.bold))
                    .foregroundColor(Color(red: 0.33, green: 0.30, blue: 0.37))
                    .offset(x: -60.50, y: -305)
                
                Text("请选择是否同意配对")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(red: 0.56, green: 0.53, blue: 0.58))
                    .offset(x: -105.50, y: -264.52)
            }
            .frame(width: 414, height: 896)
            .offset(x: 0, y: 0)
            
            
            Image("Rectangle 228")
            .frame(width: 352, height: 308)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            .offset(x: 0, y: -20)
            
            
            ZStack() {
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
                        .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                        .offset(x: 0, y: 13.17)
                }
                .frame(width: 41, height: 39.35)
                .offset(x: -79.50, y: -2.05)
                
                
                ZStack() {
                    Text("首页")
                        .font(Font.custom("Roboto", size: 10))
                        .foregroundColor(Color(red: 0.55, green: 0.36, blue: 1))
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
            
            
            ZStack() { }
            Image("Union 3")
                .frame(width: 56, height: 59.87)
                .offset(x: -137, y: -124.07)
            
            Image("Ellipse 119")
                .frame(width: 56, height: 59.87)
                .offset(x: -137, y: -124.07)
            
            Text("女\n训练计划: 5km - 10km\n已持续训练8天\n")
                .font(Font.custom("Roboto", size: 22))
                .foregroundColor(.white)
                .offset(x: -40, y: -27.50)
            Text("5km 最佳成绩：45 min 19 s")
                .font(Font.custom("Roboto", size: 22))
                .foregroundColor(.white)
                .offset(x: -10, y: 10)
            Text("Sandy\n距离您1000米")
                .font(Font.custom("Roboto", size: 20))
                .foregroundColor(.white)
                .offset(x: -40, y: -124)
            Button(action: {
                                showPage.toggle()
            }) {
                ZStack() {
                    Image("Rectangle 4")
                        .frame(width: 150, height: 56)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    
                    Text("配对")
                        .font(Font.custom("Roboto", size: 20))
                        .foregroundColor(Color(red: 0.55, green: 0.36, blue: 1))
                        .offset(x: 0, y: 0)
                }
            }
            .frame(width: 150, height: 56)
            .offset(x: 0, y: 255)
            .fullScreenCover(isPresented:$showPage){
                ContentView()
            }
            Button(action: {
                                showPage.toggle()
            }) {
                ZStack() {
                    Image("Rectangle 5")
                        .frame(width: 150, height: 56)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    
                    Text("不配对")
                        .font(Font.custom("Roboto", size: 20))
                        .foregroundColor(Color(red: 1, green: 0.97, blue: 0.36))
                        .offset(x: 0, y: 0)
                }
                .frame(width: 150, height: 56)
            }
            .offset(x: 0, y: 343)
            .fullScreenCover(isPresented:$showPage){
                ContentView()
            }
        }
        .frame(width: 414, height: 896);
    }
}

struct Match_Result_Previews: PreviewProvider {
    static var previews: some View {
        Match_Result()
    }
}
