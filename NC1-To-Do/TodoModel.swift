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
    var date : Date = Date()
}

class TodoModel: ObservableObject {
    @Published var originals: [TodoItem] = []
    @Published var items: [TodoItem] = []
    
    
    func addItem(title: String) {
        let newItem = TodoItem(todo: title)
        originals.append(newItem)
    }
    
    func completeItem(id: UUID) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].isCompleted.toggle()
        }
    }
    
    func selectDate() {
        //items = originals.filter({ $0. })
    }
}
