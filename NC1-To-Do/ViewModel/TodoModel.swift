//
//  TodoModel.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/12/24.
//


import Foundation
import SwiftData


struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var todo: String
    var isCompleted: Bool = false
    var todoDate: Date = Date()
}

class TodoModel: ObservableObject {
    @Published var originals: [TodoItem] = []
    @Published var items: [TodoItem] = []
    @Published var imageIndex: Int = 0
    
    @Published var imageNamesBefore = Array(repeating: "", count: 31)
    @Published var imageNames = Array(repeating: "img_before_todo", count: 31)
    
    @Published var achievement: String = ""
    @Published var month: Date = Date()
    
    
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
    
    
    func getMonthAchievement(date: Date) -> String {
        let filteredOriginals = originals.filter { $0.todoDate.dateFormat("YYYYMM") == date.dateFormat("YYYYMM") }
        let completedCount = filteredOriginals.filter { $0.isCompleted }.count
        
        let totalCount = filteredOriginals.count
        guard totalCount > 0 else { return "0%" }
        let achievementPercentage = Double(completedCount) / Double(totalCount)
        return String(format: "%.0f%%", achievementPercentage * 100)
        
    }
    
    func filterDate(date: Date) {
        items = originals.filter { item in
            return item.todoDate.dateFormat("yyyyMMdd") == date.dateFormat("yyyyMMdd")
        }
    }
    
    func newimageName(date: Date) {
        if date.dateFormat("YYYYMM") == month.dateFormat("YYYYMM"){
            if let clickedDay = Int(date.dateFormat("dd")){
                let achievementImageName = calculateAchievement()
                imageNames[clickedDay - 1] = achievementImageName
            } else {
                print("날짜 변환 오류")
            }
        }
    }
    
    
    
    
    func copyBeforeMonth() {
        imageNamesBefore = imageNames
        imageNames = Array(repeating: "img_before_todo", count: 31)
    }
    
    func copyAfterMonth() {
        imageNames = imageNamesBefore
        imageNamesBefore = Array(repeating: "img_before_todo", count: 31)
    }
    
    func calculateAchievement() -> String {
        let completedCount = items.filter { $0.isCompleted }.count
        let totalCount = items.count
        let achievement = (Double(completedCount) / Double(totalCount)) * 1000
        
        switch achievement {
        case 1..<125:
            return "img_1"
        case 125..<250:
            return "img_2"
        case 250..<375:
            return "img_3"
        case 375..<500:
            return "img_4"
        case 500..<625:
            return "img_5"
        case 625..<750:
            return "img_6"
        case 750..<875:
            return "img_7"
        case 875...1000:
            
            return "img_8"
        default:
            return "img_before_todo"
        }
        
    }
}

