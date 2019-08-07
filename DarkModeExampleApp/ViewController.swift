//
//  ViewController.swift
//  DarkModeExampleApp
//
//  Created by Naraki on 8/6/19.
//  Copyright © 2019 i-enter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var currentUserInterfaceStyleLabel: UILabel!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentUserInterfaceStyle(style: nil)
    }

    // MARK: - IBAction

    @IBAction private func changeModeButtonTapped(_ sender: UIButton) {
        // overrideUserInterfaceStyleの設定値と反対のスタイルをセットする
        let nextStyle: UIUserInterfaceStyle = overrideUserInterfaceStyle == .dark ? .light : .dark
        setCurrentUserInterfaceStyle(style: nextStyle)
    }
}

private extension ViewController {
    func setCurrentUserInterfaceStyle(style: UIUserInterfaceStyle?) {
        overrideUserInterfaceStyle = style ?? .unspecified

        // overrideUserInterfaceStyleが未設定の場合、UITraitCollectionに設定されている値を代入
        if style == .unspecified || style == nil {
            overrideUserInterfaceStyle = UITraitCollection.isDarkMode ? .dark : .light
        }

        // 現在のUserInterfaceStyleの設定値からラベルに反映する
        currentUserInterfaceStyleLabel.text = overrideUserInterfaceStyle == .dark ? "現在ダークモードで表示中です" : "現在ライトモードで表示中です"
    }
}
