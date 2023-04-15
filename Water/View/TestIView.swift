//
//  TestIView.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/15.
//

import SwiftUI

struct TestView: View {
    @State private var position: CGSize = .zero
     @State private var lastOffset: CGSize = .zero
     
     var body: some View {
         let dragGesture = DragGesture(minimumDistance: 0, coordinateSpace: .global)
             .onChanged { value in
                 let translation = CGSize(width: value.translation.width + self.lastOffset.width, height: value.translation.height + self.lastOffset.height)
                 print(translation.height)
                 print(value.translation.height)
                 self.position = translation
             }
             .onEnded { value in
                 self.lastOffset = self.position
             }
         
         Image("Empty_Glass")
             .resizable()
             .scaledToFit()
             .frame(width: 300, height: 300)
             .offset(x: position.width, y: position.height)
             .gesture(dragGesture)
     }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
