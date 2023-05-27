//
//  ChooseRangeView.swift
//  SpeedOfSound WatchKit Extension
//
//  Created by Andy Yu
//

import SwiftUI

struct ChooseRangeView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var feedback: Feedbackstyle
    let heartRange = Array(stride(from: 40, to: 200, by: 1))
    let ageRange = Array(stride(from: 18, to: 80, by: 1))
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Text("年齡:")
                    Spacer()
                    Picker("", selection: $workoutManager.workoutModel.age) {
                        ForEach(ageRange, id: \.self) {
                            Text("\($0)")
                                .tag($0)
                                .foregroundColor(Color("MainHighlight"))
                        }
                    }
                    .pickerStyle(.wheel)
                    .compositingGroup()
                    .frame(width: 40, height: 60)
                    .clipped(antialiased: true)
                    .offset(y: -10)
                }
//                HStack {
//                    Text("Rest heart rate:")
//                    Spacer()
//                    Picker("", selection: $workoutManager.workoutModel.restingHeartRate) {
//                        ForEach(heartRange, id: \.self) {
//                            Text("\($0)")
//                                .tag($0)
//                                .foregroundColor(Color("MainHighlight"))
//                        }
//                    }
//                    .pickerStyle(.wheel)
//                    .compositingGroup()
//                    .frame(width: 40, height: 60)
//                    .clipped(antialiased: true)
//                    .offset(y: -10)
//                }
                VStack(alignment: .leading) {
                    Text("心率範圍:")
                    HStack {
                        Picker("", selection: $workoutManager.workoutModel.lowBPM) {
                            ForEach(heartRange, id: \.self) {
                                Text("\($0)")
                                    .tag($0)
                                    .foregroundColor(Color("MainHighlight"))
                            }
                        }
                        .pickerStyle(.wheel)
                        .compositingGroup()
                        .frame(height: 60)
                        .clipped(antialiased: true)

                        Picker("", selection: $workoutManager.workoutModel.highBPM) {
                            ForEach(heartRange, id: \.self) {
                                Text("\($0)")
                                    .foregroundColor(Color("MainHighlight"))
                            }
                        }
                        .pickerStyle(.wheel)
                        .compositingGroup()
                        .frame(height: 60)
                        .clipped(antialiased: true)
                    }
                    .offset(y: -10)
                }
                NavigationLink(destination: CadenceView()) {
                    HStack {
                        Text("下一步")
                            .bold()
                            .foregroundColor(Color("Green"))
                    }
                }
            }
        }
        .padding([.leading, .trailing])
        .navigationBarTitle("計算區間")
        .onAppear() {
            workoutManager.workoutModel.feedback = feedback
        }
    }
}

struct ChooseRangeView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseRangeView(feedback: .notification)
    }
}
