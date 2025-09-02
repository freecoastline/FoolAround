//
//  DateFormatter.swift
//  FoolAround
//
//  Created by ken on 2025/9/2.
//

import Foundation

struct DateFormat {
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "y年M月d日 HH:mm"
        return formatter.string(from: date)
    }
}
