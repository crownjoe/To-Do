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
    @State var clickedCurrentMonthDates: Date = Date()
    
    @Binding var name: String
    @Binding var plan: String
    
    var body: some View {
        
        ZStack {
            background
            ScrollView{
                VStack {
                    
                    ProfileHeaderView(clickedCurrentMonthDates: $clickedCurrentMonthDates, name: $name, plan: $plan).environmentObject(model)
                    
                    CalenderView(clickedCurrentMonthDates: $clickedCurrentMonthDates).environmentObject(model)
                    
                    TodoShowView(clickedCurrentMonthDates: $clickedCurrentMonthDates).environmentObject(model)
                    
                    Spacer()
                }
            }
        }.edgesIgnoringSafeArea(.bottom) //아래만 ignore
    }
}

//#Preview {
//    MainView()
//}


