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
    @State var selectedButton: Int? = nil // 初始值為nil

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
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        HStack(alignment: .bottom){
                            Text("1000").font(.system(size: 80))
                            Text("ml").font(.system(size: 50))
                        }
                        
                        Spacer()
                        ZStack{
                            
                            Rectangle()
                                .foregroundColor(Color.white).opacity(0.8)
                                .frame(width: proxy.size.width, height: 120)
                                .cornerRadius(20)
                                
                   
                            ScrollView(.horizontal) {
                                
                                HStack(spacing:10) {
                                    Image("") // 圖片的名稱
                                        .resizable()
                                        .frame(width: proxy.size.width*0.3, height: 50)
                                    ForEach(drinks) { drink in
                                        Button(action: {
                                
                                            self.showWater = true
                                        }) {
                                            VStack{
                                                Image(drink.image)// 圖片的名稱
                                                    .resizable()
                                                    .frame(width: 50, height: 50) // 設置圖片大小
                                                Text(drink.name)
                                                    .foregroundColor(Color.blue)
                                                
                                            }
                                            
                                        }
                                        .padding() // 加上一些間距
                                    }
                                    
                                }
                            }
                        }

                    }
                }.padding()
                
                
                Spacer()
               
                Color.white
                    .opacity(0)
                    .frame(width: 100, height: 90)
                    .cornerRadius(10)
            }
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

