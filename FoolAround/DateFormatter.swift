//
//  DateFormatter.swift
//  FoolAround
//
//  Created by ken on 2025/9/2.
//

import Foundation

struct DateFormat {
    // 使用静态属性缓存DateFormatter实例，避免重复创建
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "y年M月d日 HH:mm"
        formatter.locale = Locale(identifier: "zh_CN")
        return formatter
    }()
    
    /// 格式化日期为字符串
    /// - Parameter date: 需要格式化的日期
    /// - Returns: 格式化后的日期字符串
    func formatDate(_ date: Date) -> String {
        return DateFormat.formatter.string(from: date)
    }
    
    /// 获取当前时间的格式化字符串
    func currentFormattedDate() -> String {
        return formatDate(Date())
    }
}
