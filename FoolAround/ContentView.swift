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
                TextEditor(text: $inputText)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .padding()
                    .border(Color.gray, width: 1)
                    .onChange(of: inputText) { _, newValue in
                        self.inputText = "Im great"
                    }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
