//
//  ContentView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/10/24.
//

import SwiftUI

struct MainView: View {
    let background = Color.customBackGray
    @StateObject var model = TodoModel()
    
    var body: some View {
        
        ZStack {
            background
            ScrollView{
                VStack {
                    
                    ProfileHeaderView(model: model)
                    
                    CalenderView(month: Date())
                       
                    CheckExtension(model: model)
                    
                    Spacer()
                }
            }
        }.edgesIgnoringSafeArea(.bottom) //아래만 ignore
    }
}

#Preview {
    MainView()
}


