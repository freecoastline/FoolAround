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
    var reader = FileReader(fileName: "normalMan")
    @State var number = 0
    var body: some View {
        VStack {
            NavigationStack {
                Text("Your Content Here")
                    .navigationTitle("My App Title")
                    .navigationBarTitleDisplayMode(.inline) // Ensures title is inline
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Settings") {
                                // Action for settings button
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Action for add button
                            }) {
                                Image(systemName: "plus.circle.fill")
                            }
                        }
                        // Example of placing a custom view in the principal area
                        ToolbarItem(placement: .principal) {
                            Text("Custom Title View")
                                .font(.headline)
                        }
                    }
            }
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
                        self.inputText = self.inputText + self.reader.printLine(number)
                        number += 1
                    }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
