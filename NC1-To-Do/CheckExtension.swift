//
//  CheckExtension.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/11/24.
//

import SwiftUI

struct CheckExtension: View {
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .fill(Color.customGray)
                    .frame(width: 20, height: 20)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 16, height: 16)
            }
            Text("스터디 참가하기")
                .font(.system(size: 16))
                .foregroundColor(.customBlack)
        }
    }
}

#Preview {
    CheckExtension()
}
