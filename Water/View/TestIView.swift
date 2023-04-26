//
//  TestIView.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/15.
//

import SwiftUI

struct TestView: View {
    @State private var isPressed = false
    @State private var isShowingCancel = false
    let dataImages = ["person.fill", "list.bullet.clipboard.fill", "bolt.fill"]
      let dataTexts = ["性別", "體重", "運動量", "男", "56", " 正常"]
      
      let columns: [GridItem] = [
          GridItem(.flexible()),
          GridItem(.flexible()),
          GridItem(.flexible())
      ]
    var body: some View {
        ZStack{
            WaterWave(progress: 0.2, waveHelight: 0.025 , offset: 0)
                .fill(Color.cyan)
            VStack{
                GeometryReader{ proxy in
                    Rectangle().overlay(
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(0..<6) { index in
                                if index < 3 {
                                    HStack{
                                        Image(systemName:dataImages[index])
                                            .foregroundColor(Color.blue)
                                            .frame(height: 30)
                                        Text(dataTexts[index])
                                    }
                                } else {
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(height: 50)
                                        .overlay(
                                            Text(dataTexts[index])
                                                .foregroundColor(.black)
                                        )
                                }
                            }
                        }
                        .padding(.all, 20.0)
                        .background(Color.white)
                    )
                    .frame(width: proxy.size.width*0.9, height: 120)
                        .background(Color.white)
                        .cornerRadius(20)
                        .position(x: proxy.size.width / 2)

                }.frame(height: 120)
                List{
                    Section("test"){
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        
                    }
                    Section("test"){
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        
                    }
                    Section("test"){
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        
                    }
                    Section("test"){
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: Water()) {
                            Label("General", systemImage: "target").foregroundColor(Color.gray)
                        }
                        
                    }
                }
                
            }
        }
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
