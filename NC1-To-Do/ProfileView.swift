//
//  ProfileView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/10/24.
//

import SwiftUI

struct ProfileView: View {
    let Background = Color.customBackGray
    
    var body: some View {
        ZStack {
            Background
            VStack{
                Image("img_profile_back")
                    .padding(.bottom, 10)
                Text("Kaya")
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .foregroundColor(.customFontBlack)
                    .frame(width: 100, alignment: .center)
                    .padding(.bottom, 10)
                
                Text("포항에서 살아남기")
                    .fontWeight(.regular)
                    .font(.system(size: 20))
                    .foregroundColor(.customFontBlack)
                    .frame(width: 200, alignment: .center)
                    .padding(.bottom, 80)
                
                Button(action: {
                },label: {
                    Text("저장하기")
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.customGreen)
                        .cornerRadius(20)
                    }
                )
            }
        }.ignoresSafeArea(.all)
        
    }
}

#Preview {
    ProfileView()
}
