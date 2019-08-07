//
//  UIColor+.swift
//  DarkModeExampleApp
//
//  Created by Naraki on 8/6/19.
//  Copyright © 2019 i-enter. All rights reserved.
//

import UIKit

extension UIColor {

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
