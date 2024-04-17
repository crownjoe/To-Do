//
//  CheckExtension.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/11/24.
//

import SwiftUI

struct TodoShowView: View {
    @EnvironmentObject var model: TodoModel
    @Binding var clickedCurrentMonthDates: Date
    
    var body: some View {
        VStack {
            ForEach(model.items) { item in
                HStack {
                    Button(action: {
                        //model.updateDayAchievement(id: item.id)
                        model.completeItem(id: item.id)
                        model.updateDayAchievement(id: item.id)
                    }, label: {
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.customCheckGray)
                    }).padding(.trailing, 6)
                    
                    Text(item.todo)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .strikethrough(item.isCompleted, color: .customCheckGray)
                    
                    Spacer()
                }
                .padding(.vertical, 5)
                .padding(.leading, 28)
            }
            
        }
    }
}

//#Preview {
//    TodoShowView(model: TodoModel())
//}
