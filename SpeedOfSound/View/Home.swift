//
//  home.swift
//  water
//
//  Created by 許桓菘 on 2023/4/8.
//

import Foundation
import SwiftUI
import HealthKit
import CoreData

struct Home: View {
    @Environment(\.managedObjectContext) var moc
    @State var progress: CGFloat = 0.2
    @State var startAnimeation: CGFloat = 0
    @State var change: Int = 0
    @State private var showWater = false
    @State var selectedButton: Int = 0 // 初始值為nil
    @State private var stepCount: Int = 0
    @State var result = 0
    private let healthStore = HKHealthStore()
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    

    
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
                        
                        Text("今天")
                            .font(.largeTitle)
                            .font(.footnote)
                            
                        HStack{
                            VStack{
                                Text("目標補水量:")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                HStack(alignment: .bottom){
                                    Spacer()
                                    Text("\(result)ml／2000 ml").font(.system(size: 15))
                                                                    }
                            }
                            Divider()
                                .padding(.leading)
                                .padding(.trailing)
                                .frame(height: 100.0)
                            
                            VStack{
                                Text("目標步数")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                HStack(alignment: .bottom){
                                    Spacer()
                                    Text("\(stepCount) 步／8000步").font(.system(size: 15))
                                        .foregroundColor(.black)
                                
                                }
                            }
                        }.padding()
                        
                        
                        Spacer()
                        ZStack{
                            
                            Rectangle()
                                .foregroundColor(Color.white).opacity(0.8)
                                .frame(width: proxy.size.width, height: 120)
                                .cornerRadius(20)
                                
                            
                            ScrollView(.horizontal) {
                                
                                HStack(spacing:10) {
                                    ForEach(Array(drinks.enumerated()), id: \.offset) { index, drink in
                                        Button(action: {
                                            self.showWater = true
                                            selectedButton = index
                                        }) {
                                            VStack{
                                                Image(drink.image)// 圖片的名稱
                                                    .resizable()
                                                    .frame(width: 50, height: 50)// 設置圖片大小
                                                Text(drink.name)
                                                    .foregroundColor(Color.black)
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
            
            .onAppear {
                getTodaysSteps()
                
                result = checkCondition()
                if result == 0 {
                    progress = 0.2
                } else {
                    progress = 0.2 + CGFloat(result)/2000*0.8
                }
                        
                print(progress)
            }
            .sheet(isPresented: $showWater, onDismiss: {
                // 在 sheet 關閉時執行的動作
                print("Sheet Dismissed")
                result = checkCondition()
                // 可以在這裡更新頁面上的其他狀態或執行其他需要的操作
            }) {
                Water(selectedNumber: selectedButton)
                
            }
            
            
            
        }.onReceive(timer) { _ in
            if progress <  0.2 + CGFloat(result)/2000.0*0.8 {
                progress = progress+0.003
                print(progress)
            }
        }
        .onAppear{
            withAnimation(.linear(duration: 15)
                .repeatForever(autoreverses:false)){
                    startAnimeation = UIScreen.main.bounds.width*10}
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top).background()
        
        
        
        
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
        
        
        
        let sharedDefaults = UserDefaults(suiteName: "group.com.andyyuyc.iAquaPulse")
        sharedDefaults?.set(stepCount, forKey: "StepCountKey")
        sharedDefaults?.synchronize()
        
        
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
    func checkCondition() -> Int {
        // 在此處添加您的條件檢查邏輯
        let predicate = NSPredicate(format: "float == 0")
        let fetchRequest: NSFetchRequest<CDDrinkMetaData> = CDDrinkMetaData.fetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.fetchLimit = 1

        do {
            let results = try moc.fetch(fetchRequest)
            var sum = 0
            if let firstObject = results.first {
                // 在此處使用符合條件的第一個物件
                print("Found first object: \(firstObject)")
                if let drinkItems = firstObject.relationship_drinkitem?.allObjects as? [CDdrink_item] {
                    for drinkItem in drinkItems {
                        sum += Int(drinkItem.ml)
                    }
                }
                result = sum
                return sum
            } else {
                print("No objects found.")
                return 0
            }
        } catch {
            print("Failed to fetch objects: \(error)")
        }
        return 0
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

