//
//  TestIView.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/15.
//

import SwiftUI

struct TestView: View {
    @State private var isPressed = false
    @State private var isShowingCancel = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isPressed.toggle()
            }, label: {
                Text("長按我")
                    .padding()
                    .foregroundColor(.white)
                    .background(isPressed ? Color.red : Color.blue)
                    .cornerRadius(10)
            })
            .simultaneousGesture(
                LongPressGesture(minimumDuration: 1)
                    .onChanged({ _ in
                        self.isShowingCancel = true
                    })
                    .onEnded({ _ in
                        self.isShowingCancel = false
                        self.isPressed = false
                    })
            )
            
            if isShowingCancel {
                HStack {
                    Spacer()
                    Button(action: {
                        self.isShowingCancel = false
                        self.isPressed = false
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 25))
                    })
                    .padding(.trailing, 20)
                }
            }
        }
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
