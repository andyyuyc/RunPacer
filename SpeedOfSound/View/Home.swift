//
//  Home.swift
//  Figma
//
//  Created by Andy Yu on 2023/8/7.
//

import SwiftUI

struct Home: View {
    @State private var showPage = false
    var body: some View {
        NavigationView {
            ZStack() {
                Image("Rectangle 223")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                Image("Background")
                    .resizable()
                    .frame(width: 415, height: 101.45978)
                    .offset(x: 0, y: 390)
                    .edgesIgnoringSafeArea(.all)
                ZStack() {
                    
                    Group {
                        ZStack() {
                            ZStack() { }
                                .frame(width: 414, height: 112.55)
                                .offset(x: 0, y: 0)
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
                            
                            
                            ZStack {
                                ZStack() {
                                    ZStack() { }
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
                                    Image("Group 6")
                                        .frame(width: 19.87, height: 19.86)
                                        .offset(x: 0, y: 0)
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
                                Image("Path 1508_highlight")
                                    .frame(width: 19.87, height: 19.86)
                                    .offset(x: 0, y: -8)
                                
                                Text("首页")
                                    .font(Font.custom("Roboto", size: 10))
                                    .foregroundColor(Color(red: 0.55, green: 0.36, blue: 1))
                                    .offset(x: 0, y: 13.72)
                            }
                            .frame(width: 21, height: 40.45)
                            .offset(x: -164.50, y: -2.95)
                            ZStack() { }
                            Image("posst")
                                .frame(width: 66.24, height: 66.21)
                                .offset(x: 0.55, y: -15.45)
                        }
                        .frame(width: 414, height: 112.55)
                        .offset(x: -0, y: 391.28)
                        ZStack() {
                            ZStack() {
                                ZStack() {
                                    ZStack() { }
                                        .frame(width: 24.29, height: 12.51)
                                        .offset(x: -1.29, y: 0)
                                        .opacity(0.35)
                                }
                                .frame(width: 26.86, height: 12.51)
                                .offset(x: 166.46, y: -2.21)
                                Text("9:41")
                                    .font(Font.custom("Segoe UI", size: 15))
                                    .foregroundColor(.white)
                                    .offset(x: -164.43, y: 0)
                            }
                            .frame(width: 359.78, height: 22.07)
                            .offset(x: 11.66, y: 2.21)
                        }
                        .frame(width: 414, height: 48.55)
                        .offset(x: -0, y: -423.72)
                        ZStack() { }
                        Image("Vector")
                            .frame(width: 414, height: 413.79)
                            .offset(x: 0, y: -173.79)
                            .opacity(0.75)
                        ZStack() {
                            ZStack() { }
                            
                                .frame(width: 17.66, height: 17.66)
                                .offset(x: -0, y: 74.48)
                        }
                        Image("Group 16")
                            .frame(width: 181.06, height: 193.10)
                            .offset(x: 0.55, y: -244.41)
                        
                        
                        //5KM
                        ZStack() {
                            ZStack() { }
                            
                            Image("Rectangle 227")
                                .frame(width: 41.95, height: 44.85)
                            
                            Image("Ellipse 118")
                                .frame(width: 37.536, height: 37.51724)
                                .background(
                                    Image("Union 3")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                )
                                .offset(x:60, y: 0.25)
                            
                            Text("5km跑")
                                .font(Font.custom("Roboto", size: 14))
                                .foregroundColor(.white)
                                .offset(x: -5.58, y: -8.25)
                            
                            Text("距离您500米")
                                .font(Font.custom("Roboto", size: 10))
                                .foregroundColor(.white)
                                .offset(x: -5.08, y: 8.25)
                        }
                        .frame(width: 153.46, height: 44.85)
                        .offset(x: -89.43, y: -256.75)
                        
                        
                        //10KM
                        ZStack() {
                            ZStack() { }
                            Image("Rectangle 227")
                                .frame(width: 41.95, height: 44.85)
                            
                            Image("Ellipse 120")
                                .frame(width: 37.536, height: 37.51724)
                                .background(
                                    Image("Union 3")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                )
                                .offset(x:60, y: 0.25)
                            
                            Text("10km跑")
                                .font(Font.custom("Roboto", size: 14))
                                .foregroundColor(.white)
                                .offset(x: -5.58, y: -8.25)
                            
                            Text("距离您1500米")
                                .font(Font.custom("Roboto", size: 10))
                                .foregroundColor(.white)
                                .offset(x: -5.58, y: 8.25)
                        }
                        .frame(width: 153.46, height: 44.85)
                        .offset(x: 107.09, y: -202.68)
                        
                        
                        //全马
                        ZStack() {
                            ZStack() { }
                            Image("Rectangle 227")
                                .frame(width: 41.95, height: 44.85)
                            
                            Image("Ellipse 119")
                                .frame(width: 37.536, height: 37.51724)
                                .background(
                                    Image("Union 3")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                )
                                .offset(x: 60, y: 0.25)
                            
                            Text("全马")
                                .font(Font.custom("Roboto", size: 14))
                                .foregroundColor(.white)
                                .offset(x: -10.06, y:  -8.25)
                            
                            Text("距离您1000米")
                                .font(Font.custom("Roboto", size: 10))
                                .foregroundColor(.white)
                                .offset(x: -10.06, y:  8.25)
                        }
                        .frame(width: 153.46, height: 44.85)
                        .offset(x: -94.95, y: -33.85)
                        
                        //半马
                        ZStack() {
                            ZStack() { }
                            Image("Rectangle 227")
                                .frame(width: 41.95, height: 44.85)
                                .offset(x: 85.06, y: -20.24)
                            
                            
                            Image("Ellipse 121")
                                .frame(width: 37.536, height: 37.51724)
                                .background(
                                    Image("Union 3")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                )
                                .offset(x: 145.06, y: -20.24)
                            
                            Text("距离您700米")
                                .font(Font.custom("Roboto", size: 10))
                                .foregroundColor(.white)
                                .offset(x: 83, y: -12.25)
                            
                            Text("半马")
                                .font(Font.custom("Roboto", size: 14))
                                .foregroundColor(.white)
                                .offset(x: 83, y: -28)
                            
                        }
                        .frame(width: 153.46, height: 44.85)
                        .offset(x: 15.44, y: -59.26)
                    }
                }
                .frame(width: 414, height: 896)
                .offset(x: 0, y: 0)
                
                Button(action: {
                    print("1")
                    showPage.toggle()
                }) {
                    ZStack() {
                        Image("Rectangle 3")
                            .frame(width: 150, height: 56)
                        
                        
                        Text("快速配对")
                            .font(Font.custom("Roboto", size: 20))
                            .foregroundColor(Color(red: 0.55, green: 0.36, blue: 1))
                        
                    }
                }.offset(x: 2, y: 194)
                    .fullScreenCover(isPresented:$showPage){
                        Match()
                    }
            }.offset(y:23)
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        
        Home()
    }
}
