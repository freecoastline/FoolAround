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
            Text(timeLabel)
                .font(.footnote)
            Spacer()
            TextField("", text: $inputText)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
