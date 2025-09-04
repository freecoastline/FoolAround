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
    var novel = ["I", "am", "great"]
    @State var number = 0
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                Text(timeLabel)
                    .font(.footnote)
                Spacer()
                TextEditor(text: $inputText)
                    .font(.system(size: 30))
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                    .padding()
                    .border(Color.gray, width: 1)
                    .onChange(of: inputText) { _, newValue in
                        self.inputText += "good"
                    }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
