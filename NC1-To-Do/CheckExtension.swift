//
//  CheckExtension.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/11/24.
//

import SwiftUI

struct CheckExtension: View {
    @ObservedObject var model: TodoModel
    
    var body: some View {
        VStack {
            ForEach(model.items) { item in
                HStack {
                    Button(action: {
                        model.completeItem(id: item.id)
                    }, label: {
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.customGray)
                    }).padding(.trailing, 6)
                    
                    Text(item.todo)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .strikethrough(item.isCompleted, color: .customGray)
                    
                    Spacer()
                }
                .padding(.vertical, 5)
                .padding(.leading, 28)
            }
            
        }
    }
}

#Preview {
    CheckExtension(model: TodoModel())
}
