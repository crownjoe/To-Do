//
//  ContentView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/10/24.
//

import SwiftUI

struct MainView: View {
    let background = Color.customBackGray
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                VStack {
                    ProfileHeaderView()
                    
                    CalenderView(month: Date())
                    
                    CheckExtension()
                    CheckExtension()
                    CheckExtension()
                    
                    Spacer()


                }
            }.edgesIgnoringSafeArea(.bottom) //아래쪽만 ignore
        }
    }
}

#Preview {
    MainView()
}


