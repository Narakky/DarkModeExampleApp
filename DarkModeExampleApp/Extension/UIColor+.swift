//
//  UIColor+.swift
//  DarkModeExampleApp
//
//  Created by Naraki on 8/6/19.
//  Copyright © 2019 i-enter. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(hex: String, alpha: CGFloat) {
                let v = Int("000000" + hex, radix: 16) ?? 0
                let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
                let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
                let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
                self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
            }

    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }

    /// ダイナミックカラーを取得する
    /// - Parameter light: ライトモード時の色
    /// - Parameter dark: ダークモード時の色
    public class func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { traitCollection -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return dark
                } else {
                    return light
                }
            }
        }
        return light
    }
}

extension UIColor {

    static var defaultLabelBackground: UIColor {
        return dynamicColor(light: UIColor(hex: "FFFFA6"), dark: UIColor(hex: "FFBD2C"))
    }

    static var defaultLabelForeground: UIColor {
        return dynamicColor(light: UIColor(hex: "333333"), dark: UIColor(hex: "FFFFFF"))
    }

    static var defaultLabelBorder: UIColor {
        return dynamicColor(light: UIColor(hex: "FCC634"), dark: UIColor(hex: "FFFAB3"))
    }

}
