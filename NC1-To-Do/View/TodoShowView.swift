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
    //@Binding var imageName: String
    
    var body: some View {
        VStack {
            ForEach($model.items) { item in
                HStack {
                    Button(action: {
                        model.completeItem(id: item.id)
                        model.setImageName()
                        
                    }, label: {
                        Image(systemName: item.wrappedValue.isCompleted ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.customCheckGray)
                    }).padding(.trailing, 6)
                    
                    Text(item.wrappedValue.todo)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .strikethrough(item.wrappedValue.isCompleted, color: .customCheckGray)
                    
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
