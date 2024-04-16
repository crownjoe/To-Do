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
    var todoDate: Date = Date()
}

class TodoModel: ObservableObject {
    @Published var originals: [TodoItem] = []
    @Published var items: [TodoItem] = []
    
    func addItem(title: String, todoDate: Date) {
        let newItem = TodoItem(todo: title, isCompleted: false, todoDate: todoDate)
        originals.append(newItem)
    }
    
    func completeItem(id: UUID) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].isCompleted.toggle()
        }
    }
    
    func filterDate(date: Date) {
        items = originals.filter { item in
            return item.todoDate.dateFormat("yyyyMMdd") == date.dateFormat("yyyyMMdd")
        }
        print("filterDate:",items)
    }
}

    


