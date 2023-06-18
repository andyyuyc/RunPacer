//
//  testCoredataView.swift
//  AquaPulse
//
//  Created by 許桓菘 on 2023/6/17.
//

import SwiftUI
import CoreData

struct testCoredata: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var drink_test: FetchedResults<CDdrink_item>

        
    var body: some View {
        VStack{
            List(drink_test){drink in
                Text(String(drinks[Int(drink.drink_num)].name) )
            }
            HStack{
                Button("Add CDDrinkMetaData"){
                    let testCD = CDDrinkMetaData(context: moc)
                    testCD.float = 0
                    
                    try? moc.save()
                }.padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                
                Button("Search+add"){
                    let predicate = NSPredicate(format: "float == 0")
                    let fetchRequest: NSFetchRequest<CDDrinkMetaData> = CDDrinkMetaData.fetchRequest()
                    fetchRequest.predicate = predicate
                    
                    do {
                        let results = try moc.fetch(fetchRequest)
                        
                        if let drinkMetaData = results.first {
                            // 在此處新增車輛到找到的 CDDrinkMetaData 物件
                            let testCD = CDdrink_item(context: moc)
                            testCD.id = UUID()
                            testCD.drink_num = 0
                            testCD.ml = 500
                            
                            drinkMetaData.addToRelationship_drinkitem(testCD)
                            
                            try moc.save()
                            
                            print("Drink added to CDDrinkMetaData successfully.")
                            let dataController = DataController()
                            let count = dataController.getDrinkMetaDataCount()
                            print("Number of CDDrinkMetaData records: \(count)")
                            let drinkItemCount = dataController.getDrinkItemCount(for: drinkMetaData)
                            print("Number of CDDrinkItem records in drinkMetaData: \(drinkItemCount)")
                        } else {
                            print("CDDrinkMetaData not found.")
                        }
                    } catch {
                        print("Failed to search CDDrinkMetaData: \(error)")
                    }
                }.padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
    
}

struct testCoredata_Previews: PreviewProvider {
    static var previews: some View {
        testCoredata()
    }
}


