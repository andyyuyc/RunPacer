//
//  home.swift
//  water
//
//  Created by 許桓菘 on 2023/4/8.
//

import SwiftUI


struct Home: View {
    @State var progress: CGFloat = 0.2
    @State var startAnimeation: CGFloat = 0
    @State var change: Int = 0
    @State private var showWater = false
    var body: some View {
        ZStack{
            WaterWave(progress: progress, waveHelight: 0.025 , offset: startAnimeation)
                .fill(Color.blue)
            VStack{
                Color.white
                    .opacity(0)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                GeometryReader{ proxy in
                    let size = proxy.size
                    VStack(alignment: .center){
                            Text("今日補水量")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.leading, -20)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                            HStack(alignment: .bottom){
                                Text("1000").font(.system(size: 80))
                                Text("ml").font(.system(size: 50))
                            }
                            
                    }.padding()
                }.padding()
                
                
                
                
                Spacer()
                Button(action: {
                    change = change == 0  ? 1 : 0
                    self.showWater = true
                }) {
                    Text("喝水")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.black)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(100)
                }.padding()
                Color.white
                    .opacity(0)
                    .frame(width: 100, height: 90)
                    .cornerRadius(10)
            }.padding()
                .sheet(isPresented: $showWater) {
                    Water()
                }
            
            
        }
        .onAppear{
            withAnimation(.linear(duration: 5)
                .repeatForever(autoreverses:false)){
                    startAnimeation = UIScreen.main.bounds.width}
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top).background(Color("BG"))
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

