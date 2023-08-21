//
//  Match.swift
//  Figma
//
//  Created by Andy Yu on 2023/8/11.
//

import SwiftUI

struct Match_Blind: View {
    
    @State private var distanceIndex = 2
    @State private var showPage = false
    var distance = ["同意", "不同意"]
    
    var body: some View{
        ZStack(){
            ZStack(){
                Text("请选择您的匹配意愿")
                    .font(Font.custom("Roboto", size:34).weight(.bold))
                    .foregroundColor(Color(red:0.33, green: 0.30, blue: 0.37))
                    .offset(x: -18.50, y: -285)
                
                Text("选择是否同意与视障人群匹配")
                    .font(Font.custom("Roboto", size:16))
                    .foregroundColor(Color(red:0.56, green: 0.53, blue: 0.58))
                    .offset(x: -65, y: -244.52)
                
                //ZStack(){
                // Text("500 m - 1000m")
                //   .font(Font.custom("Roboto",size: 20))
                // .foregroundColor(Color(red:0.33, green: //0.30, blue: 0.37))
                //.offset(x: 4.50, y: -1)
                // }
                
                VStack{
                    Section{
                        Picker(selection: $distanceIndex, label: Text("Distance")){
                            ForEach(0 ..< distance.count){
                                Text(self.distance[$0]).tag($0)
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
                        .cornerRadius(50))
                    .fullScreenCover(isPresented:$showPage){
                        Match_Process()
                    }
                }
                
            }
            
        }
    }
}


struct Match_Blind_Previews: PreviewProvider {
    static var previews: some View{
        Match_Blind()
    }
}
