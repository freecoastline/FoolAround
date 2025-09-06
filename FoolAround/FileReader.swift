//
//  FileReader.swift
//  FoolAround
//
//  Created by ken on 2025/9/5.
//

import Foundation

class FileReader {
    private let fileName: String
    private var cachedLines: [String]? = nil
    
    init(fileName: String?) {
        self.fileName = fileName ?? "normalMan"
        // 初始化时加载文件内容
        _ = loadFileContents()
    }
    
    /// 加载文件内容并缓存
    private func loadFileContents() -> [String] {
        if let cachedLines = cachedLines {
            return cachedLines
        }
        
        guard let file = Bundle.main.url(forResource: fileName, withExtension: "txt") else {
            print("无法找到文件: \(fileName).txt")
            return []
        }

        do {
            let contents = try String(contentsOf: file, encoding: .utf8)
            let lines = contents.split(separator: "\n").map { String($0) }
            self.cachedLines = lines
            return lines
        } catch {
            print("读取文件错误: \(error.localizedDescription)")
            return []
        }
    }
    
    /// 读取指定行的内容，带有边界检查
    func printLine(_ lineNumber: Int) -> String {
        let lines = loadFileContents()
        
        // 边界检查
        guard !lines.isEmpty else { return "" }
        guard lineNumber >= 0 && lineNumber < lines.count else {
            return ""
        }
        
        return lines[lineNumber]
    }
}
