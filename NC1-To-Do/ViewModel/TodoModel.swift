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
    
    @Published var imageName: String = "img_before_todo"
    @Published var imageIndex: Int = 0
    
    func addItem(title: String, todoDate: Date) {
        let newItem = TodoItem(todo: title, isCompleted: false, todoDate: todoDate)
        originals.append(newItem)
    }
    
    func completeItem(id: UUID) {
        if let itemsIndex = items.firstIndex(where: { $0.id == id }) {
            items[itemsIndex].isCompleted.toggle()
        }
        
        if let originalsIndex = originals.firstIndex(where: { $0.id == id }) {
            originals[originalsIndex].isCompleted.toggle()
        }
    }
    
    func setImageName(){
        let completedCount = items.filter { $0.isCompleted }.count
        let totalCount = items.count
        let achievement = (Double(completedCount) / Double(totalCount)) * 1000
        
        switch achievement {
        case 1..<125:
            imageName = "img_1"
        case 125..<250:
            imageName = "img_2"
        case 250..<375:
            imageName = "img_3"
        case 375..<500:
            imageName = "img_4"
        case 500..<625:
            imageName = "img_5"
        case 625..<750:
            imageName = "img_6"
        case 750..<875:
            imageName = "img_7"
        case 875...1000:
            imageName = "img_8"
        default:
            imageName = "img_before_todo"
        }
    }
    
    func getMonthAchievement() -> String {
        let completedCount = originals.filter { $0.isCompleted }.count
        let totalCount = originals.count
        guard totalCount > 0 else { return "0%" }
        let achievementPercentage = Double(completedCount) / Double(totalCount)
        return String(format: "%.0f%%", achievementPercentage * 100)
    }
    
    
    
    func filterDate(date: Date) {
        items = originals.filter { item in
            return item.todoDate.dateFormat("yyyyMMdd") == date.dateFormat("yyyyMMdd")
        }
    }
}





