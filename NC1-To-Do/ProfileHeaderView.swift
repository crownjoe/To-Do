//
//  ProfileHeaderView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/11/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let profileBackground = Color.white
    
    var body: some View {
        ZStack{
            profileBackground
                .frame(height: 100)
            HStack{
                Image("img_profile")
                    .padding(.trailing, 10)
                
                VStack{
                    Text("Kaya")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.customBlack)
                        .frame(width: 100, alignment: .leading)
                        .padding(.bottom, 0.3)
                    Text("포항에서 살아남기")
                        .font(.system(size: 14))
                        .foregroundColor(.customBlack)
                    
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("할 일 추가")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.customGreen)
                        .cornerRadius(5)
                }
                ).padding(.leading, 70)
            }
        }
        
    }
}

#Preview {
    ProfileHeaderView()
}
