//
//  ContentView.swift
//  FoolAround
//
//  Created by ken on 2025/9/1.
//

import SwiftUI

struct ContentView: View {
    var timeLabel = DateFormat().formatDate(Date())
    @State var inputText = ""
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                Text(timeLabel)
                    .font(.footnote)
                Spacer()
                TextField("", text: $inputText)
            }
        }
    }
}

#Preview {
    ContentView()
}
