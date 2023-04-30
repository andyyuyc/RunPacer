import SwiftUI

struct Setting: View {
    @State var progress: CGFloat = 0.1
    @State var startAnimeation: CGFloat = 0
    @State private var toggleIsOn = false
    let dataImages = ["person.fill", "list.bullet.clipboard.fill", "bolt.fill"]
      let dataTexts = ["性別", "體重", "運動量", "男", "56", " 正常"]
      
      let columns: [GridItem] = [
          GridItem(.flexible()),
          GridItem(.flexible()),
          GridItem(.flexible())
      ]

    var body: some View {
        ZStack{
            Color.white
            VStack(alignment: .center){
                Color.white
                    .opacity(0)
                    .frame(width: 50, height:UIScreen.main.bounds.height*0.05)
                    .cornerRadius(10)
                List{
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
                        .frame(width: proxy.size.width)
                            .background(Color.white)
                            
                            .position(x: proxy.size.width / 2,y:70)

                    }.frame(height: 120)
                    Section("提醒"){
                        NavigationLink(destination: Water()) {
                            Label("每日目標", systemImage: "target")
                        }
                        Toggle("日常喝水提醒",isOn: $toggleIsOn).toggleStyle(SwitchToggleStyle(tint: .cyan))
                        Toggle("運動喝水提醒",isOn: $toggleIsOn).toggleStyle(SwitchToggleStyle(tint: .cyan))
                        
                    }
                    Section("運動"){
                        NavigationLink(destination: Water()) {
                            Label("裝置配對", systemImage: "target").foregroundColor(Color.black)
                        }
                        NavigationLink(destination: Water()) {
                            Label("水杯", systemImage: "target").foregroundColor(Color.black)
                        }
                        NavigationLink(destination: Water()) {
                            Label("含水量", systemImage: "target").foregroundColor(Color.black)
                        }
                    }
                    Section("飲料"){
                        NavigationLink(destination: Water()) {
                            Label("排序自訂", systemImage: "target").foregroundColor(Color.black)
                        }
                        NavigationLink(destination: Water()) {
                            Label("水杯", systemImage: "target").foregroundColor(Color.black)
                        }
                        NavigationLink(destination: Water()) {
                            Label("含水量", systemImage: "target").foregroundColor(Color.black)
                        }
                    }
                    
                }.frame(height: UIScreen.main.bounds.height*0.88)
                Spacer()
               
            }
            
        }.onAppear{
            withAnimation(.linear(duration: 5)
                .repeatForever(autoreverses:false)){
                    startAnimeation = UIScreen.main.bounds.width}
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top).background(Color("BG"))
        
    }
}
struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
