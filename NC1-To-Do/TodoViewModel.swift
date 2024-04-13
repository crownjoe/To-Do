//
//  ToDoViewModel.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/11/24.
//
import Foundation
import Combine

class TodoViewModel: ObservableObject {
    @Published var items: [TodoItem] = []
    @Published var olditems: [TodoItem] = []
    
    @Published var newToDo: String = ""
    @Published var oldToDo: String = ""
    
    func addItem() {
        let newItem = TodoItem(todo: newToDo)
        items.append(newItem)
        newToDo = ""
    }
    
    func completeItem(){
        let oldItem = TodoItem(todo: oldToDo)
        olditems.append(oldItem)
        oldToDo = ""
    }
}
