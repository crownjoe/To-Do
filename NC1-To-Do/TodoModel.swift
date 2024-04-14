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
    var isCompleted: Bool = false
}

class TodoModel: ObservableObject {
    @Published var items: [TodoItem] = []
    
    @Published var oldTodo: String = ""
    
    func addItem(title: String) {
        let newItem = TodoItem(todo: title)
        items.append(newItem)
    }
    
    func completeItem(id: UUID) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].isCompleted.toggle()
        }
    }
}
