//
//  ContentView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/10/24.
//

import SwiftUI

struct MainView: View {
    let background = Color.customBackGray
    @StateObject var viewModel : TodoViewModel
    
    var body: some View {
        
        ZStack {
            background
            ScrollView{
                VStack {
                    ProfileHeaderView()
                    
                    CalenderView(month: Date())
                       
                    CheckExtension()
                    
                    Spacer()
                }
            }
        }.edgesIgnoringSafeArea(.bottom) //아래쪽만 ignore
    }
}

#Preview {
    MainView(viewModel: TodoViewModel())
}


