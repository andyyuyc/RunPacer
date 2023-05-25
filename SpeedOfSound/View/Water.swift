//
//  home.swift
//  water
//
//  Created by 許桓菘 on 2023/4/2.
//

import SwiftUI

struct Water: View {
    @State var progress: CGFloat = 0.1
    @State var startAnimeation: CGFloat = 0
    @State var change: Int = 0
    
    @State private var location: CGPoint = .zero

    @State private var lastprogress: CGFloat = 0.1

    
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
                    WaterWave(progress: progress, waveHelight: 0.05 , offset: startAnimeation)
                        .fill(Color("Blue"))
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
                            Image("glass-of-water")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .padding(20)
                                
                        }
                    Image("empty_glass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .scaleEffect(x:1.1,y: 1)
                        .offset(y: 0)
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                            .onChanged { value in
                                let translation = value.translation.height/proxy.size.height
                                progress = lastprogress - translation
                            }
                            .onEnded { value in
                                lastprogress = progress
                            })
                }.frame(width: size.width,height: size.height,alignment:.center)
                    .onAppear{
                        withAnimation(.linear(duration: 10)
                            .repeatForever(autoreverses:false)){
                            startAnimeation = size.width*40}
                    }
                
                
            }
            Text("200 ml")
                .font(.largeTitle).padding()
            HStack{
                Button(action: {
                    // 在這裡添加按鈕被點擊時的操作
                }) {
                   
                        
                }
                Button(action: {
                    change = change == 0  ? 1 : 0
                }) {
                    Text("喝水")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(100)
                }.padding()
            }
            

            
        }.padding().frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top).background(Color("BG"))
    }
}

struct Water_Previews: PreviewProvider {
    static var previews: some View {
        Water()
    }
}

struct WaterWave: Shape{
    
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

