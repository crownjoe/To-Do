//
//  DateExtension.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/16/24.
//

import Foundation

extension Date {
    func dateFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ko-KR")
        
        return formatter.string(from: self)
    }
}
