//
//  TodoModel.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/12/24.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var todo: String
}
