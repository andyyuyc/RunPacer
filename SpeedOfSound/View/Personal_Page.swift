//
//  Personal_Page.swift
//  Figma
//
//  Created by Andy Yu on 2023/8/20.
//

import SwiftUI

struct Personal_Page: View {
    var body: some View {
        ZStack() {
            Image("bg")
                .frame(width: 414, height: 425.93103)
                .offset(x: 0, y: -243)
            
            Image("Rectangle 216")
                .frame(width: 233.20918, height: 71.44806)
                .offset(x: -167, y: -280)
            
            Image("Path 103")
                .frame(width: 418.17752, height: 434.73764)
                .offset(x: 10, y: -290)
            
            Image("Rectangle 218")
                .frame(width: 428.55823, height: 114.98245)
                .offset(x: 167, y: -290)
            
            ZStack() {
                ZStack() {
                    ZStack() { }
                        .frame(width: 611.59, height: 453.49)
                        .offset(x: 0, y: 0)
                }
                .frame(width: 611.59, height: 453.49)
                .offset(x: 0, y: -228.98)
                
                ZStack() {
                    Text("43")
                        .font(Font.custom("Roboto", size: 20).weight(.bold))
                        .foregroundColor(.white)
                        .offset(x: -133.52, y: -11.16)
                    Text("7389")
                        .font(Font.custom("Roboto", size: 20).weight(.bold))
                        .foregroundColor(.white)
                        .offset(x: 5.04, y: -11.16)
                    Text("1")
                        .font(Font.custom("Roboto", size: 20).weight(.bold))
                        .foregroundColor(.white)
                        .offset(x: 130.04, y: -11.16)
                    Text("训练天数")
                        .font(Font.custom("Roboto", size: 14))
                        .foregroundColor(.white)
                        .offset(x: -133.36, y: 14.84)
                        .opacity(0.60)
                    
                    Image("Line 73")
                        .frame(width: 0, height: 18.75862)
                        .offset(x: -64.86, y: 1.84)
                    
                    Text("训练里程")
                        .font(Font.custom("Roboto", size: 14))
                        .foregroundColor(.white)
                        .offset(x: 3.64, y: 14.84)
                        .opacity(0.60)
                    
                    Image("Line 73")
                        .frame(width: 0, height: 18.75862)
                        .offset(x: 66.89, y: 1.84)
                    
                    Text("跑友数")
                        .font(Font.custom("Roboto", size: 14))
                        .foregroundColor(.white)
                        .offset(x: 130.14, y: 14.84)
                        .opacity(0.60)
                }
                
                .frame(width: 324.72, height: 47.69)
                .offset(x: -32.46, y: -61.12)
                ZStack() {
                    ZStack() { }
                    Image("Ellipse 97")
                        .frame(width: 93.84, height: 93.79)
                        .offset(x: -9.45, y: -43.59)
                    
                    Image("Ellipse 98")
                        .frame(width: 93.84, height: 93.79)
                        .offset(x: -9.45, y: -43.59)
                    
                    Text("MacDonald")
                        .font(Font.custom("Roboto", size: 20))
                        .foregroundColor(.white)
                        .offset(x: -8.79, y: 36.96)
                    ZStack() {
                        ZStack() { }
                        
                            .frame(width: 13.28, height: 13.07)
                            .offset(x: 0, y: 0)
                    }
                    Image("edit")
                        .frame(width: 13.28, height: 13.07)
                        .offset(x: 58.46, y: 38.53)
                    
                    Image("location")
                        .frame(width: 13.28, height: 13.07)
                        .offset(x: -42, y: 81.65)
                    
                    Text("Los Angeles")
                        .font(Font.custom("Roboto", size: 12))
                        .foregroundColor(.white)
                        .offset(x: 2.14, y: 81.65)
                }
                .frame(width: 130.19, height: 180.97)
                .offset(x: -19.37, y: -224)
                ZStack() {
                    ZStack() {
                        ZStack() { }
                            .frame(width: 5.92, height: 5.91)
                            .offset(x: -0, y: -0.10)
                        ZStack() { }
                            .frame(width: 16.56, height: 17.66)
                            .offset(x: 0, y: 0)
                    }
                    .frame(width: 16.56, height: 17.66)
                    .offset(x: 0.55, y: 0)
                }
                
                .frame(width: 33.12, height: 33.10)
                .offset(x: 139.54, y: -367.45)
            }
            .frame(width: 611.59, height: 911.45)
            .offset(x: 28.82, y: -7.72)
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
                            .foregroundColor(Color(red: 0.55, green: 0.36, blue: 1))
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
                        .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
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
                        .foregroundColor(Color(red: 0.55, green: 0.36, blue: 1))
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
                        .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
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

struct Personal_Page_Previews: PreviewProvider {
    static var previews: some View {
        Personal_Page()
    }
}
