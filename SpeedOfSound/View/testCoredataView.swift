//
//  testCoredataView.swift
//  AquaPulse
//
//  Created by 許桓菘 on 2023/6/17.
//

import SwiftUI

struct testCoredata: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var drink_test: FetchedResults<CDdrink_item>

        
    var body: some View {
        VStack{
            List(drink_test){drink in
                Text(String(drinks[Int(drink.drink_num)].name) )
            }
            Button("Add"){
                let testCD = CDdrink_item(context: moc)
                testCD.id = UUID()
                testCD.drink_num = 100
                testCD.ml = 100
                
                try? moc.save()
            }
        }
    }
    
}

struct testCoredata_Previews: PreviewProvider {
    static var previews: some View {
        testCoredata()
    }
}
