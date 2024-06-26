//
//  ProfileHeaderView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/11/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showTodoPad = false
    
    @Binding var clickedCurrentMonthDates: Date
    
    @Binding var name: String
    @Binding var plan: String
    
    @EnvironmentObject var model: TodoModel
    
    let profileBackground = Color.white
    
    var body: some View {
        ZStack{
            profileBackground
                .frame(height: 100)
            HStack{
                Image("img_profile_kaya")
                    .padding(.trailing, 10)
                
                VStack{
                    Text(name)
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.customBlack)
                        .frame(width: 100, alignment: .leading)
                        .padding(.bottom, 0.3)
                        .padding(.leading, -4)
                        .multilineTextAlignment(.leading)
                    
                    Text(plan)
                        .font(.system(size: 14))
                        .foregroundColor(.customBlack)
                        .multilineTextAlignment(.leading)
                    
                }
                Button(action: {
                    self.showTodoPad = true
                },label: {
                    Text("할 일 추가")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.customGreen)
                        .cornerRadius(5)}
        
                ).padding(.leading, 70)
            }.sheet(isPresented: $showTodoPad) {
                TodoPadView(clickedCurrentMonthDates: clickedCurrentMonthDates, model: model)
                    .presentationDetents([.height(300)])
            }
        }
    }
}

//#Preview {
//    ProfileHeaderView(clickedCurrentMonthDates: Date(), model: TodoModel())
//}
