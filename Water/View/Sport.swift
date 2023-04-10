//
//  SPORT.swift
//  Water
//
//  Created by Andy Yu on 2023/4/10.
//

import Foundation
import SwiftUI
import HealthKit

struct Sport: View {
    @State var progress: CGFloat = 0.2
    @State var startAnimeation: CGFloat = 0
    @State var change: Int = 0
    @State private var showWater = false
    @State private var stepCount: Int = 0
    private let healthStore = HKHealthStore()
    
    var body: some View {
        ZStack{
            WaterWave(progress: progress, waveHelight: 0.025 , offset: startAnimeation)
                .fill(Color("SportColor"))
            VStack{
                Color.white
                    .opacity(0)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                GeometryReader{ proxy in
                    let size = proxy.size
                    VStack(alignment: .center){
                        Text("今日步数")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.leading, -20)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        HStack(alignment: .bottom){
                            Text("\(stepCount)").font(.system(size: 80))
                                .foregroundColor(.white)
                            Text("步").font(.system(size: 40))
                                .foregroundColor(.white)
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
                    SportWater()
                }
        }
        .onAppear{
            authorizeHealthKit()
            withAnimation(.linear(duration: 5)
                .repeatForever(autoreverses:false)){
                    startAnimeation = UIScreen.main.bounds.width}
            getTodaysSteps()
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top).background(Color("BG_Dark"))
    }
    
    private func authorizeHealthKit() {
        let typesToShare = Set([
            HKObjectType.workoutType()
        ])
        let typesToRead = Set([
            HKObjectType.quantityType(forIdentifier: .stepCount)!
        ])
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            if !success {
                print("Error: \(String(describing: error))")
            }
        }
    }
    
    private func getTodaysSteps() {
        let type = HKObjectType.quantityType(forIdentifier: .stepCount)!
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let startDate = calendar.date(from: components)!
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate,
                                      options: [.cumulativeSum]) { (query, statistics, error) in
            guard let statistics = statistics else {
                print("Error getting statistics: (String(describing: error))")
                return
            }
            DispatchQueue.main.async {
                if let sum = statistics.sumQuantity() {
                    self.stepCount = Int(sum.doubleValue(for: HKUnit.count()))
                }
            }
        }
        healthStore.execute(query)
    }
}

struct Sport_Previews: PreviewProvider {
    static var previews: some View {
        Sport()
    }
}
