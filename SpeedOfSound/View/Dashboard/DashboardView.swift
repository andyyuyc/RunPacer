import SwiftUI
import HealthKit
import PermissionsSwiftUIHealth
import SwiftUICharts

struct DashboardView: View {
    @StateObject var dashboardViewModel = DashboardViewModel()
    @State private var heartRateMode = true
    @State var showAllRunning = false
    @State var showAllWalking = false
    @EnvironmentObject var playerViewModel: PlayerViewModel
    let namespace: Namespace.ID
    @State private var animationAmount: CGFloat = 1
    
    @Namespace var animation
    
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack{
                    ListenNowView(showPlayer: $playerViewModel.showPlayer)
                    HStack {
                        Image(systemName: "music.note")
                        Picker("Effect", selection: $playerViewModel.effectIndex) {
                            ForEach(0 ..< playerViewModel.effect.count, id:\.self) { index in
                                Text(playerViewModel.effect[index]).tag(index)
                                    .foregroundColor(playerViewModel.mode == .running ? Color("Main") : .black)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .onChange(of: playerViewModel.effectIndex) { _ in
                            playerViewModel.runRestart()
                        }
                    }
                    .padding()
                    if playerViewModel.mode == .running {
                        HStack {
                            Text("\(playerViewModel.workoutModel.lowBPM) - \(playerViewModel.workoutModel.highBPM)")
                                .foregroundColor(Color("Main"))
                                .bold()
                                .font(.title)
                        }
                        .padding()
                    }
                    
                    Label(playerViewModel.speedString, systemImage: "metronome.fill")
                        .foregroundColor(playerViewModel.mode == .running ? Color("MainHighlight") : .black)
                    
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                playerViewModel.clickOnPlusButton()
                            }, label: {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(playerViewModel.mode == .running ? Color("Green") : .black)
                                    .font(Font.title.weight(.light))
                            })
                            Button(action: {
                                playerViewModel.clickOnMinusButton()
                            }, label: {
                                Image(systemName: "minus.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(playerViewModel.mode == .running ? Color("Green") : .black)
                                    .font(Font.title.weight(.light))
                            })
                        }
                        
                        Button(action: {
                            playerViewModel.clickOnBPM()
                        }, label: {
                            VStack {
                                Text("\(Int(playerViewModel.BPM))")
                                    .font(.largeTitle)
                                    .foregroundColor(playerViewModel.mode == .running ? Color("Green") : .black)
                                    .fontWeight(.bold)
                                Text("BPM")
                                    .font(.footnote)
                                    .foregroundColor(playerViewModel.mode == .running ? Color("Green") : .black)
                            }
                            .foregroundColor(.white)
                        })
                        .matchedGeometryEffect(id: "BPM", in: namespace)
                        
                        Image(systemName: "poweron")
                            .font(.largeTitle)
                            .foregroundColor(playerViewModel.mode == .running ? Color("MainHighlight") : .black)
                        VStack {
                            Text("\(playerViewModel.heartRate)")
                                .font(.largeTitle)
                                .foregroundColor(playerViewModel.mode == .running ? Color("Main") : .black)
                                .fontWeight(.bold)
                            Text("Heart Rate")
                                .font(.footnote)
                                .foregroundColor(playerViewModel.mode == .running ? Color("Main") : .black)
                        }
                        .foregroundColor(.white)
                        if playerViewModel.mode == .running {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.red)
                                .scaleEffect(animationAmount)
                                .animation(
                                    .linear(duration: 0.1)
                                    .delay(0.2)
                                    .repeatForever(autoreverses: true),
                                    value: animationAmount)
                                .onAppear {
                                    animationAmount = 1.2
                                }
                        } else {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.red)
                        }
                        Spacer()
                    }
                    Spacer()
                    Button(action: {
                        playerViewModel.tapOnStartButton()
                    }, label: {
                        Image(systemName: playerViewModel.mode == .stopped ? "play.circle.fill" : "pause.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(playerViewModel.mode == .running ? Color("Green") : .black)
                            .font(.largeTitle)
                        
                    })
                    .matchedGeometryEffect(id: "PlayButton", in: namespace)
                    
                    .padding()
                    .padding()
                    
                    DashboardRowView(workouts: dashboardViewModel.walkingWorkouts, type: .walking, animation: animation)
                        .padding(.horizontal)
                        .listStyle(PlainListStyle())
                    
                }
            }
            .JMAlert(showModal: $dashboardViewModel.isNotReady, for: [.health(categories: .init(readAndWrite: dashboardViewModel.getPermission))])
            .task {
                await dashboardViewModel.checkPermission()
                await dashboardViewModel.loadWorkoutData() // ??
            }
            .refreshable {
                await dashboardViewModel.loadWorkoutData()
            }
            .onAppear() {
                dashboardViewModel.checkCurrentAuthorizationSetting()
            }
            .navigationTitle("脈衝")
            .navigationBarTitleTextColor(.black)
            .navigationBarTitleDisplayMode(.automatic)
        }
        
    }
    
    
}



struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(namespace: Namespace().wrappedValue)
            .environmentObject(DashboardViewModel())
            .environmentObject(PlayerViewModel())
    }
}
