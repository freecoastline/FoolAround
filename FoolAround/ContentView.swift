//
//  ContentView.swift
//  FoolAround
//
//  Created by ken on 2025/9/1.
//

import SwiftUI

struct ContentView: View {
    // 使用懒加载避免每次视图刷新都创建新的日期格式化器
    private let dateFormatter = DateFormat()
    @State private var inputText = ""
    @State private var number = 0
    private let reader = FileReader(fileName: "normalMan")
    
    // 计算属性，只在需要时更新日期
    private var timeLabel: String {
        dateFormatter.formatDate(Date())
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(timeLabel)
                    .font(.footnote)
                    .padding(.top)
                
                TextEditor(text: $inputText)
                    .font(.system(size: 20))
                    .padding()
                    .border(Color.gray, width: 1)
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 400)
                
                Button("添加文本") {
                    // 安全地添加文本，避免无限循环
                    let newLine = reader.printLine(number)
                    if !newLine.isEmpty {
                        inputText += newLine
                        number += 1
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Spacer()
            }
            .padding()
            .navigationTitle("笔记应用")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("设置") {
                        // 设置按钮的操作
                        print("打开设置")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // 清空文本
                        inputText = ""
                        number = 0
                    }) {
                        Image(systemName: "trash")
                    }
                }
            }
        }
}

#Preview {
    ContentView()
}
