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
            ZStack(alignment: .bottom) {
                
                    NavigationView {
                        DashboardView(namespace: Namespace().wrappedValue)
                            .environmentObject(DashboardViewModel())
                            .environmentObject(PlayerViewModel())
                    }
                    
                
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
                .backgroundColor(.white)
                .closeButtonColor(.white)
                .height(.proportional(0.4))
                
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

struct ContentView_1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_1()
    }
}
