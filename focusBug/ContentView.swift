//
//  ContentView.swift
//  focusBug
//
//  Created by Darrell Root on 3/9/20.
//  Copyright © 2020 net.networkmom. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var inFocus = false
    let windowCount: Int
    var body: some View {
        VStack {
            Text("Focus Window \(windowCount)").focusable()
            inFocus ? Text("This window thinks it is in focus") : Text("This window does not think it is in focus")
        }.padding(50).focusable() { newFocus in
            debugPrint("onFocusChange: \(newFocus)")
            self.inFocus = newFocus
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(windowCount: 1)
    }
}
