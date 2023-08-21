import SwiftUI
import HalfASheet
import SwiftUIGIF

struct ContentView_1: View {
    @StateObject var playerViewModel = PlayerViewModel()
    
    func buttonView(_ text: String) -> some View {
        Text(text)
            .bold()
            .frame(width: 190, height: 60, alignment: .center)
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(25)
    }
    
    var body: some View {
                    ZStack {
                        NavigationView {

                ZStack(alignment: .bottom) {
                    
                    
                    
                    
                    ListenNowView(showPlayer: $playerViewModel.showPlayer)
                    
                    HalfASheet(isPresented: $playerViewModel.showGif) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "applewatch.side.right")
                                    .foregroundColor(.black)
                                Text("Use our")
                                    .foregroundColor(.black)
                                + Text(" Apple Watch ")
                                    .bold()
                                    .foregroundColor(Color("Main"))
                                + Text("app")
                                    .foregroundColor(.black)
                            }
                            
                            GIFImage(name: "appleWatchAnimation")
                                .frame(height: 250)
                        }
                    }
                    .closeButtonColor(.white)
                    .height(.proportional(0.4))
                    .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top).background(
                        ZStack{
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
                                            .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
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
                                        Image("Group 6")
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
                                        .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
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
                    ).ignoresSafeArea()
                    
                    DashboardView(namespace: Namespace().wrappedValue)
                        .environmentObject(DashboardViewModel())
                        .environmentObject(PlayerViewModel())
                    
                    
                }
                
                if playerViewModel.showNotificationPickerView || playerViewModel.showSoundPickerView {
                    PickerView()
                }
            }
            //        .onChange(of: playerViewModel.heartRate) { newValue in
            //            playerViewModel.changeMetronomeBPM(newHearRateBPM: newValue)
            //        }
            .onChange(of: playerViewModel.workoutModel) { newValue in
                playerViewModel.myMetronome.setTempo(to: newValue.cadence)
            }
            .environmentObject(playerViewModel)
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct ContentView_1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_1()
    }
}
