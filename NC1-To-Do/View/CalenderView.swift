//
//  CalenderView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/11/24.
//

import SwiftUI

struct CalenderView: View {
    @EnvironmentObject var model: TodoModel
    @Binding var clickedCurrentMonthDates: Date
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    
    var body: some View {
        VStack {
            VStack {
                headerView
                calendarGridView.environmentObject(TodoModel())
            }
            
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            
            Path { path in
                path.move(to: CGPoint(x: 20, y: 0))
                path.addLine(to: CGPoint(x: 375, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1.5, lineCap: .round, dash: [7]))
            .foregroundColor(.customGray)
            .frame(height: 10)
            
        }
    }
    
    
    // MARK: - 년 월, 성취도, 요일 헤더 뷰
    private var headerView: some View {
        VStack {
            HStack {
                yearMonthView
                
                Spacer()
                
                Button(
                    action: {
                        model.achievement = model.getMonthAchievement(date: model.month)
                        
                        if model.achievement == "0%" {
                            alertMessage = "이번 달 성취도가 0%이에요 맨! 다음 달은 더 노력해봅시다! 💪"
                        } else if model.achievement == "100%" {
                            alertMessage = "이번 달 성취도 100% 달성! 완벽티비 🎉👍"
                        } else {
                            alertMessage = "이번 달 성취도는 \(model.achievement)입니다. 좋은 성과네요, 킵고잉!🏃🏻‍➡️"
                        }
                        self.showingAlert = true
                    },
                    label: {
                        Image("img_achievement")
                            .frame(width: 50, height: 50)
                            .overlay(Text(String(model.getMonthAchievement(date: model.month)))
                                .fontWeight(.bold)
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                                    
                            )
                    }
                )
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertMessage), dismissButton: .default(Text("확인")))
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 15)
            
            HStack { //요일
                ForEach(Self.weekdaySymbols.indices, id: \.self) { symbol in
                    Text(Self.weekdaySymbols[symbol].uppercased())
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
        }
    }
    
    // MARK: - 년 월, 이전 달, 다음 달
    private var yearMonthView: some View {
        HStack(alignment: .center, spacing: 12) {
            Button(
                action: {
                    changeMonth(by: -1)
                    model.copyBeforeMonth()
                    model.achievement = model.getMonthAchievement(date: model.month)
                },
                label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(canMoveToPreviousMonth() ? .customBlack : . gray)
                }
            )
            .disabled(!canMoveToPreviousMonth())
            
            Text(model.month.dateFormat("YYYY.MM"))
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(.customBlack)
            
            Button(
                action: {
                    changeMonth(by: 1)
                    model.copyAfterMonth()
                    model.achievement = model.getMonthAchievement(date: model.month)
                },
                label: {
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .foregroundColor(canMoveToNextMonth() ? .customBlack : .gray)
                }
            )
            .disabled(!canMoveToNextMonth())
        }
    }
    
    private var calendarGridView: some View {
        
        let daysInMonth: Int = numberOfDays(in: model.month)
        let firstWeekday: Int = firstWeekdayOfMonth(in: model.month) - 1
        let lastDayOfMonthBefore = numberOfDays(in: previousMonth())
        let numberOfRows = Int(ceil(Double(daysInMonth + firstWeekday) / 7.0))
        let visibleDaysOfNextMonth = numberOfRows * 7 - (daysInMonth + firstWeekday)
        
        return LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
            ForEach(-firstWeekday ..< daysInMonth + visibleDaysOfNextMonth, id: \.self) { index in
                Group {
                    if index > -1 && index < daysInMonth {
                        let date = getDate(for: index)
                        let clicked = clickedCurrentMonthDates == date
                        let isToday = date.formattedCalendarDayDate == today.formattedCalendarDayDate
                        
                        CellView(date: date, clicked: clicked, isToday: isToday)
                            .environmentObject(model)
                            .font(.system(size: 12))
                        
                    } else if let prevMonthDate = Calendar.current.date(
                        byAdding: .day,
                        value: index + lastDayOfMonthBefore,
                        to: previousMonth()
                    ) {
                        VStack{
                            Spacer()
                                .frame(height: 8)
                            Image("img_before_todo")
                        }
                    }
                }
                .onAppear {
                    if getDate(for: index).formattedCalendarDayDate == today.formattedCalendarDayDate {
                        let date = getDate(for: index)
                        clickedCurrentMonthDates = date
                        model.achievement = model.getMonthAchievement(date: model.month)
                        model.filterDate(date: clickedCurrentMonthDates)
                        
                        model.newimageName(date: clickedCurrentMonthDates)
                    }
                }
                .onTapGesture {
                    if 0 <= index && index < daysInMonth {
                        model.imageIndex = index
                        let date = getDate(for: index)
                        clickedCurrentMonthDates = date
                        model.filterDate(date: clickedCurrentMonthDates)
                        model.newimageName(date: clickedCurrentMonthDates)
                    }
                }
            }
            
        }
    }
}

// MARK: - 일자 셀 뷰
                
private struct CellView: View {
    @EnvironmentObject var model: TodoModel
    var date: Date
    var day: String{ date.dateFormat("dd") }
    private var clicked: Bool
    private var isToday: Bool
    private var isCurrentMonthDay: Bool
    
    private var textColor: Color {
        if clicked {
            return Color.customGreen
        }
        else if isCurrentMonthDay {
            return Color.customBlack
            
        } else {
            return Color.customGray
        }
    }
    
    fileprivate init(
        date: Date,
        clicked: Bool = false,
        isToday: Bool = false,
        isCurrentMonthDay: Bool = true
    ) {
        self.date = date
        self.clicked = clicked
        self.isToday = isToday
        self.isCurrentMonthDay = isCurrentMonthDay
    }
    var body: some View {
        VStack {
            if clicked {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.customYellow)
                    .frame(width: 6, height: 6)
                    .padding(.bottom, -6)
                
                
                Image("\(model.imageNames[Int(day)! - 1])")
                    .overlay(Text(String(day)))
                    .foregroundColor(.customYellow)
                
                
            } else {
                Spacer()
                    .frame(height: 8)
                
                Image("\(model.imageNames[Int(day)! - 1])")
                    .overlay(Text(String(day)))
                    .foregroundColor(textColor)
            }
        }
        .frame(height: 50)
        
    }
}


// MARK: - CalendarView Static 프로퍼티
private extension CalenderView {
    var today: Date {
        let now = Date()
        let components = Calendar.current.dateComponents([.year, .month, .day], from: now)
        return Calendar.current.date(from: components)!
    }
    static let weekdaySymbols: [String] = Calendar.current.shortWeekdaySymbols
}

// MARK: - 내부 로직 메서드
private extension CalenderView {
    /// 특정 해당 날짜
    func getDate(for index: Int) -> Date {
        let calendar = Calendar.current
        guard let firstDayOfMonth = calendar.date(
            from: DateComponents(
                year: calendar.component(.year, from: model.month),
                month: calendar.component(.month, from: model.month),
                day: 1
            )
        ) else {
            return Date()
        }
        
        var dateComponents = DateComponents()
        dateComponents.day = index
        
        let timeZone = TimeZone.current
        let offset = Double(timeZone.secondsFromGMT(for: firstDayOfMonth))
        dateComponents.second = Int(offset)
        
        let date = calendar.date(byAdding: dateComponents, to: firstDayOfMonth) ?? Date()
        return date
    }
    
    /// 해당 월에 존재하는 일자 수
    func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    /// 이전 월 마지막 일자
    func previousMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: model.month)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: firstDayOfMonth)!
        
        return previousMonth
    }
    
    /// 월 변경
    func changeMonth(by value: Int) {
        self.model.month = adjustedMonth(by: value)
    }
    
    /// 이전 월로 이동 가능한지 확인
    func canMoveToPreviousMonth() -> Bool {
        let currentDate = Date()
        let calendar = Calendar.current
        let targetDate = calendar.date(byAdding: .month, value: -100, to: currentDate) ?? currentDate
        
        if adjustedMonth(by: -1) < targetDate {
            return false
        }
        return true
    }
    
    /// 다음 월로 이동 가능한지 확인
    func canMoveToNextMonth() -> Bool {
        let currentDate = Date()
        let calendar = Calendar.current
        let targetDate = calendar.date(byAdding: .month, value: 100, to: currentDate) ?? currentDate
        
        if adjustedMonth(by: 1) > targetDate {
            return false
        }
        return true
    }
    
    /// 변경하려는 월 반환
    func adjustedMonth(by value: Int) -> Date {
        if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: model.month) {
            return newMonth
        }
        return model.month
    }
}

// MARK: - Date 익스텐션
extension Date {
    static let calendarDayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy dd"
        return formatter
    }()
    
    var formattedCalendarDayDate: String {
        return Date.calendarDayDateFormatter.string(from: self)
    }
}



