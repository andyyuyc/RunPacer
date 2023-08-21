//
//  Match_Process.swift
//  Figma
//
//  Created by Andy Yu on 2023/8/19.
//

import SwiftUI

struct Match_Process: View{
    @State private var isActive: Bool = false
    var body: some View{
        NavigationView {
            VStack {
                NavigationLink(
                    destination: Match_Result().navigationBarBackButtonHidden(true),
                    isActive: $isActive,
                    label: {
                        ZStack(){
                            Image("Rectangle 223")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                            
                            Image("Vector")
                                .frame(width:414, height:413.79)
                                .offset(x: 0, y: -32.10)
                                .opacity(0.75)
                            
                            Image("Group 16")
                                .frame(width: 181.06, height: 193.10)
                                .offset(x: 0, y: -95.10)
                            
                            
                            ZStack(){
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
                                
                                Text("距离您1500米")
                                    .font(Font.custom("Roboto", size: 14))
                                    .foregroundColor(.white)
                                    .offset(x: -5.23, y: -1.43)
                            }
                            .frame(width: 153.46, height : 44.85)
                            .offset(x: 88.73, y: 75.43)
                            
                            ZStack(){
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
                                    .offset(x:60, y: 0.25)
                                
                                Text("距离您500米")
                                    .font(Font.custom("Roboto", size: 14))
                                    .foregroundColor(.white)
                                    .offset(x: -5.23, y: -1.43)
                            }
                            .frame(width: 153.46, height : 44.85)
                            .offset(x: -55.27, y: -192.57)
                            
                            ZStack(){
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
                                
                                Text("距离您1000米")
                                    .font(Font.custom("Roboto", size: 14))
                                    .foregroundColor(.white)
                                    .offset(x: -5.23, y: -1.43)
                            }
                            .frame(width: 153.46, height : 44.85)
                            .offset(x: -109.27, y: 50.43)
                            
                            ZStack(){
                                Image("Rectangle 227")
                                    .frame(width: 41.95, height: 44.85)
                                
                                Image("Ellipse 121")
                                    .frame(width: 37.536, height: 37.51724)
                                    .background(
                                        Image("Union 3")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                    )
                                    .offset(x:60, y: 0.25)
                                
                                Text("距离您200米")
                                    .font(Font.custom("Roboto", size: 14))
                                    .foregroundColor(.white)
                                    .offset(x: -5.23, y: -1.43)
                            }
                            .frame(width: 153.46, height : 44.85)
                            .offset(x: 67.15, y: -102.57)
                            
                            Text("配对中...")
                                .font(Font.custom("Roboto", size: 20))
                                .foregroundColor(.white)
                                .offset(x: 8, y: 243)
                            
                        }}
                )
            }
            .onAppear {
                startTimer()
            }
        }
    }
    func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isActive = true
        }
    }
}

struct Match_Process_Previews: PreviewProvider{
    static var previews: some View{
        Match_Process()
    }
}
