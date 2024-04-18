//
//  ProfileView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/10/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var showingImagePicker = false
    
    @Binding var name: String
    @Binding var plan: String
    
    let Background = Color.customBackGray
    
    var body: some View {
        ZStack {
            Background
            VStack{
                Image("img_profile_back")
                    .padding(.bottom, 20)
                
                TextField("이름을 적어주세요!", text: $name)
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .foregroundColor(.customFontBlack)
                    .frame(width: 100, height: 50, alignment: .center)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.center)
                
                TextField("한줄소개를 적어주세요!", text: $plan)
                    .fontWeight(.regular)
                    .font(.system(size: 20))
                    .foregroundColor(.customFontBlack)
                    .frame(width: 200, alignment: .center)
                    .padding(.bottom, 80)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    
                    
                },label: {
                    Text("저장하기")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
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

//#Preview {
//    ProfileView()
//}
