//
//  CheckExtension.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/11/24.
//

import SwiftUI

struct CheckExtension: View {
    @State var finishTodo = false
    
    var body: some View {
        HStack{
            Button(action: {
                finishTodo = !finishTodo
            }, label: {
                if finishTodo == false {
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.customGray)
                } else {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.customGray)
                }
            }).padding(.trailing, 6)
            
            Text("스터디 참가하기")
                .font(.system(size: 16))
                .foregroundColor(.customBlack)
                .padding(.trailing, 200)
        }
        .padding(.vertical, 5)
        .padding(.leading, 10)
    }
}

#Preview {
    CheckExtension()
}
