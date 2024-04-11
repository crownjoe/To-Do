// ColorExtentsion.swift

import SwiftUI


extension Color{
    static let customGreen = Color(hex: "7B926C")
    static let customGray = Color(hex: "D2D4DF")
    static let customBlack = Color(hex: "1D1F29")
    static let customBackGray = Color(hex: "F7F7FA")
}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
