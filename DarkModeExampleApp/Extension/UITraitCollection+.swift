//
//  UITraitCollection+.swift
//  DarkModeExampleApp
//
//  Created by Naraki on 8/6/19.
//  Copyright © 2019 i-enter. All rights reserved.
//

import UIKit

extension UITraitCollection {
    public static var isDarkMode: Bool {
        if #available(iOS 13, *), current.userInterfaceStyle == .dark {
            return true
        }
        return false
    }
}
