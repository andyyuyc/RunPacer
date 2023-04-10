//
//  SportWater.swift
//  Water
//
//  Created by Andy Yu on 2023/4/10.
//

import Foundation
import SwiftUI

struct SportWater: View {
    @State var progress: CGFloat = 0
    @State var startAnimeation: CGFloat = 0
    @State var change: Int = 0
    var body: some View {
        VStack{
            
            Spacer()
            Color.white
                .opacity(0)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            GeometryReader{ proxy in
                let size = proxy.size
                
                ZStack{
                    Image(systemName: change == 0 ? "drop" : "drop.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .scaleEffect(x:1.1,y: 1)
                        .offset(y: -1)
                    
                    WaterWave(progress: progress, waveHelight: 0.05 , offset: startAnimeation)
                        .fill(Color("SportColor"))
                        .overlay(content:{
                            ZStack{
                                Circle().fill(.white.opacity(0.4))
                                    .frame(width: 12,height: 12)
                                    .offset(x: -20)
                                Circle().fill(.white.opacity(0.3))
                                    .frame(width: 20,height: 20)
                                    .offset(x: -50,y :50)
                                Circle().fill(.white.opacity(0.3))
                                    .frame(width: 5,height: 5)
                                    .offset(x: 60,y :-50)
                                Circle().fill(.white.opacity(0.4))
                                    .frame(width: 30,height: 30)
                                    .offset(x: 60,y :120)
                                Circle().fill(.white.opacity(0.4))
                                    .frame(width: 25,height: 25)
                                    .offset(x: -30,y :100)
                                Circle().fill(.white.opacity(0.2))
                                    .frame(width: 10,height: 10)
                                    .offset(x: -30,y :-70)
                            }
                        })
                        .mask {
                            Image(systemName: "drop.fill")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .padding(20)
                        }
                }.frame(width: size.width,height: size.height,alignment:.center)
                    .onAppear{
                        withAnimation(.linear(duration: 2)
                            .repeatForever(autoreverses:false)){
                            startAnimeation = size.width}
                    }
                
                
            }
            Text("200 ml")
                .font(.largeTitle).padding()
                .foregroundColor(.white)
            Button(action: {
                change = change == 0  ? 1 : 0
            }) {
                Text("喝水")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("SportColor"))
                    .cornerRadius(100)
            }.padding()
            Slider(value: $progress)
                .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing], 50.0/*@END_MENU_TOKEN@*/)
            
        }.padding().frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top).background(Color("BG_Dark"))
    }
}

struct SportWater_Previews: PreviewProvider {
    static var previews: some View {
        SportWater()
    }
}

struct SportWaterWave: Shape{
    
    var progress : CGFloat
    
    var waveHelight: CGFloat
    
    var offset: CGFloat
    
    var animatableData: CGFloat{
        get{offset}
        set{offset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{path in path.move(to: .zero)
            
            let progressHeight: CGFloat = (1-progress)*rect.height
            let height = waveHelight * rect.height
            
            for value in stride(from: 0, to: rect.width, by: 2){
                let x: CGFloat = value
                let sine: CGFloat = sin(Angle(degrees: value + offset).radians)
                let y: CGFloat = progressHeight + (height * sine)
                
                path.addLine(to: CGPoint(x: x,y: y))
            }
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x:0,y:rect.height))

        }
    }
}

