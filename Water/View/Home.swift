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
                GeometryReader{ proxy in
                    VStack(alignment: .center){
                        Color.white
                            .opacity(0)
                            .frame(width: 50, height:proxy.size.height*0.1)
                            .cornerRadius(10)
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
                        
                        Spacer()
                        
                        ScrollView(.horizontal) {
                            HStack(spacing:10) {
                                Image("") // 圖片的名稱
                                        .resizable()
                                        .frame(width: proxy.size.width*0.3, height: 50)
                                ForEach(0..<10) { index in
                                    Button(action: {
                                        print("Button \(index) tapped")
                                    }) {
                                        VStack{
                                            Image("glass-of-water") // 圖片的名稱
                                                    .resizable()
                                                    .frame(width: 50, height: 50) // 設置圖片大小
                                            Text("100")
                                        }
                                    }
                                    Spacer()
                                }
                                
                            }
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


