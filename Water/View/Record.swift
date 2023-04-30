//
//  Record.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/29.
//

import SwiftUI

struct Record: View {
    enum ViewType: String, CaseIterable, Identifiable {
        case view1="喝水紀錄", view2="運動紀錄"
        
        var id: String { self.rawValue }
        
        var view: AnyView {
            switch self {
            case .view1:
                return AnyView(Record_Water())
            case .view2:
                return AnyView(Text("View 2"))
                
            }
        }
    }
    
    @State private var selectedViewType = ViewType.view1
    
    var body: some View {
        ZStack{
            Color("BG")
                .ignoresSafeArea()

            VStack {
                Color.white
                    .opacity(0)
                    .frame(width: 100, height: 50)
                    .cornerRadius(10)
                Picker(selection: $selectedViewType, label: Text("Select a view")) {
                    ForEach(ViewType.allCases) { viewType in
                        Text(viewType.rawValue.capitalized).tag(viewType)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                selectedViewType.view
            }
            
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top).background(Color("BG"))
    }
}

struct Record_Previews: PreviewProvider {
    static var previews: some View {
        return Record()
    }
}
