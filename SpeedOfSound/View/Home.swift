//
//  home.swift
//  water
//
//  Created by 許桓菘 on 2023/4/8.
//

import Foundation
import SwiftUI
import HealthKit


struct Home: View {
    
    @State var progress: CGFloat = 0.2
    @State var startAnimeation: CGFloat = 0
    @State var change: Int = 0
    @State private var showWater = false
    @State var selectedButton: Int? = nil // 初始值為nil
    @State private var stepCount: Int = 0
    private let healthStore = HKHealthStore()


    
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
                        
                        
                        Text("今日步数")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        HStack(alignment: .bottom){
                            Text("\(stepCount)").font(.system(size: 80))
                                .foregroundColor(.black)
                            
                            Text("步").font(.system(size: 40))
                                .foregroundColor(.black)
                        }
                        
                        
                        Spacer()
                        
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



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

