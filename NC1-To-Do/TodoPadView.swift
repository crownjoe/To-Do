//
//  ToDoPadView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/11/24.
//

import SwiftUI
import Foundation


struct TodoPadView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var model: TodoModel
    @State private var newTodo = ""
    
    var body: some View {
        VStack{
            Text("Kaya,\n할 일을 입력해주세요!")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.trailing, 120)
                .padding(.bottom, 20)
                .padding(.top, 20)
            
            TextField("새로운 할 일을 입력해주세요 👀", text: $newTodo, onCommit: {
                model.addItem(title: newTodo)
                newTodo = ""
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .border(Color.customGray)
            .padding(.horizontal, 50)
            
            Button(action: {
                model.addItem(title: newTodo)
                newTodo = ""

                self.presentationMode.wrappedValue.dismiss()
               
            },label: {
                Text("저장하기")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.horizontal, 120)
                    .padding(.vertical, 10)
                    .background(Color.customGreen)
                    .cornerRadius(5)}
            )
            .padding(.top, 40)
        }
    }
}

#Preview {
    TodoPadView(model: TodoModel())
}

