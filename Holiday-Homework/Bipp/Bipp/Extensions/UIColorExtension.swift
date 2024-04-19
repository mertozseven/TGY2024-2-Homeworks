//
//  UIColorExtensions.swift
//  Bipp
//
//  Created by Mert Ozseven on 18.04.2024.
//

import UIKit

extension UIColor {
    
    // MARK: - Custom Dynamic Colors
    static let componentBackground: UIColor = dynamicColor(light: UIColor(hex: "#FFFFFF", alpha: 1.0)!,
                                                           dark: UIColor(hex: "#121212", alpha: 1.0)!)
    
    static let customSystemBackground: UIColor = dynamicColor(light: UIColor(hex: "#F2F2F2", alpha: 1.0)!,
                                                              dark: UIColor(hex: "#2C2C2E", alpha: 1.0)!)
    
    static let customButtonBackground: UIColor = dynamicColor(light: UIColor(hex: "#DFEFFC", alpha: 1.0)!,
                                                              dark: UIColor(hex: "#2C2C2E", alpha: 1.0)!)
    
    static let customTitleColor: UIColor = dynamicColor(light: UIColor(hex: "#383838", alpha: 1.0)!,
                                                        dark: UIColor(hex: "#979797", alpha: 1.0)!)
    
    // MARK: - UIColor HEX Code Extension
    public convenience init?(hex: String, alpha: Double = 1.0) {
        var pureString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (pureString.hasPrefix("#")) {
            pureString.remove(at: pureString.startIndex)
        }
        if ((pureString.count) != 6) {
            return nil
        }
        let scanner = Scanner(string: pureString)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            self.init(
                red: CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(hexNumber & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0))
            return
        }
        return nil
    }
    
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return light }
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
    
}
