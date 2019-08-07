//
//  ViewController.swift
//  DarkModeExampleApp
//
//  Created by Naraki on 8/6/19.
//  Copyright © 2019 i-enter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Constants

    private let defaultCornerRadius: CGFloat = 5
    private let defaultBorderWidth: CGFloat = 2
    private let defaultBorderColor: UIColor = UIColor.dynamicColor(light: UIColor(hex: "FCC634"),
                                                                   dark: UIColor(hex: "FFFAB3"))

    // MARK: - IBOutlet
    
    @IBOutlet private weak var currentUserInterfaceStyleLabel: UILabel!
    @IBOutlet private weak var fromAssetLabel: UILabel! {
        didSet {
            fromAssetLabel.layer.cornerRadius = defaultCornerRadius
            fromAssetLabel.layer.borderWidth = defaultBorderWidth
            // cgColorはダイナミックに変化しない？
            fromAssetLabel.layer.borderColor = defaultBorderColor.cgColor
            fromAssetLabel.clipsToBounds = true
        }
    }
    @IBOutlet private weak var fromCodeLabel: UILabel! {
        didSet {
            fromCodeLabel.layer.cornerRadius = defaultCornerRadius
            fromCodeLabel.layer.borderWidth = defaultBorderWidth
            fromCodeLabel.layer.borderColor = defaultBorderColor.cgColor
            fromCodeLabel.clipsToBounds = true
            // dynamic color
            fromCodeLabel.backgroundColor = UIColor.defaultLabelBackground
            fromCodeLabel.textColor = UIColor.defaultLabelForeground
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentUserInterfaceStyle(style: nil)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        // モードが変わったときにdynamicColorを再代入する
        fromAssetLabel.layer.borderColor = defaultBorderColor.cgColor
        fromCodeLabel.layer.borderColor = defaultBorderColor.cgColor
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
