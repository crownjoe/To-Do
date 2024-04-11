//
//  StrokeView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/11/24.
//

import SwiftUI

struct StrokeView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 20, y: 0))
            path.addLine(to: CGPoint(x: 375, y: 0))
        }
        .stroke(style: StrokeStyle(lineWidth: 1.5, lineCap: .round, dash: [7]))
        .foregroundColor(.customGray)
        .frame(height: 30)
        .background(Color.red)
    }
}

#Preview {
    StrokeView()
}
