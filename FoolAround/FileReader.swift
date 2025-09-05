//
//  FileReader.swift
//  FoolAround
//
//  Created by ken on 2025/9/5.
//

import Foundation

class FileReader {
    let fileName:String?
    
    init(fileName: String?) {
        self.fileName = fileName
    }
    
    func printLine(_ lineNumber: Int) -> String {
        let fileName = "normalMan"
        var readLine = ""
        guard let file = Bundle.main.url(forResource: fileName, withExtension: "txt") else {
            assertionFailure("construct file fail")
            return ""
        }

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
