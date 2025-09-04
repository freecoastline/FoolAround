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
                        self.inputText = self.inputText + printLine(number)
                        number += 1
                    }
                
            }
        }
    }
    
    func printLine(_ lineNumber: Int) -> String {
        let fileName = "normalMan"
        guard let file = Bundle.main.url(forResource: fileName, withExtension: "txt") else {
            print("Not find the txt")
            return ""
        }
        
        var readLine = ""
        
        do {
            let contents = try String(contentsOf: file, encoding: .ascii)
            let lines = contents.split(separator: "\n")
            print("\(lines.count)")
            readLine = String(lines[lineNumber])
        } catch {
            return (error.localizedDescription)
        }
        
        return readLine
                
    }
    
}

#Preview {
    ContentView()
}
