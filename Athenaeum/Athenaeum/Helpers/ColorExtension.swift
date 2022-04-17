//
//  ColorExtension.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 16.04.2022.
//

import SwiftUI

extension Color {
    
    static let cyan_color = Color(UIColor(red: 144/255, green: 241/255, blue: 239/255, alpha: 1.0))
    static let pink_color = Color(UIColor(red: 246/255, green: 231/255, blue: 227/255, alpha: 1.0))
    static let pink_dark_color = Color(UIColor(red: 253/255, green: 206/255, blue: 210/255, alpha: 1.0))
    static let pink_darkest_color = Color(UIColor(red: 203/255, green: 122/255, blue: 129/255, alpha: 1.0))
    static let yellow_color = Color(UIColor(red: 255/255, green: 239/255, blue: 159/255, alpha: 1.0))
    static let yellow_light_color = Color(UIColor(red: 254/255, green: 243/255, blue: 213/255, alpha: 1.0))
    static let green_light_color = Color(UIColor(red: 214/255, green: 243/255, blue: 238/255, alpha: 1.0))
    static let green_color = Color(UIColor(red: 15/255, green: 168/255, blue: 150/255, alpha: 1.0))
    static let white_color = Color(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0))
    static let placeholder_color = Color(UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1.0))
    static let text_color = Color(UIColor(red: 41/255, green: 4/255, blue: 0/255, alpha: 0.8))
    
    static let red_color = Color(UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1.0))
    static let blue_color = Color(UIColor(red: 0/255, green: 106/255, blue: 246/255, alpha: 1.0))
    
    static let red_color_trans = Color(UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.1))
    static let blue_color_trans = Color(UIColor(red: 0/255, green: 106/255, blue: 246/255, alpha: 0.1))
    
    init(hex: String, alpha: Double = 1) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) }
        
        let scanner = Scanner(string: cString)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(.sRGB, red: Double(r) / 0xff, green: Double(g) / 0xff, blue:  Double(b) / 0xff, opacity: alpha)
    }
}
