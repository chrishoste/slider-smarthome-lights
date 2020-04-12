//
//  Slider.swift
//  SmarthomeSlider
//
//  Created by Christophe Hoste on 10.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//
// swiftlint:disable line_length

import UIKit

class Slider: UIControl {

    private let iconView: IconView!

    private let slidingBackground = UIView()
    private var rightWidthAnchor = NSLayoutConstraint()
    private var currentWidth: CGFloat = 0

    private let primaryLabel = UILabel(text: "Living Room", font: .systemFont(ofSize: 16, weight: .heavy))
    private let subLabel = UILabel(text: "Subtext", font: .systemFont(ofSize: 14))
    var value: Int = 0

    private let lightSwitch: UISwitch = {
        let lightSwitch = UISwitch()
        lightSwitch.onTintColor = .systemBlue
        lightSwitch.addTarget(self, action: #selector(handleSwitch(_:)), for: .valueChanged)
        return lightSwitch
    }()

    init(primaryText: String, subText: String, iconName: String = "lightbulb", selectedIconName: String = "lightbulb.slash") {
        primaryLabel.text = primaryText
        subLabel.text = subText
        iconView = IconView(iconName: iconName, selectedIconName: selectedIconName)
        super.init(frame: .zero)

        clipsToBounds = true
        primaryLabel.alpha = 0.5
        subLabel.alpha = 0.5
        iconView.alpha = 0.5
        setupBackground()
        setupStackView(iconName: iconName, selectedIconName: selectedIconName)
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:))))
    }

    private func setupBackground() {
        slidingBackground.backgroundColor = .systemGray6
        slidingBackground.layer.cornerRadius = 10
        addSubview(slidingBackground)
        slidingBackground.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil)

        rightWidthAnchor = slidingBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        rightWidthAnchor.isActive = true
    }

    private func setupStackView(iconName: String, selectedIconName: String) {
        let labelStackView = UIStackView(arrangedSubviews: [primaryLabel, subLabel])
        labelStackView.axis = .vertical

        let stackView = UIStackView(arrangedSubviews: [iconView, UIView(centerYSubview: labelStackView), UIView(), UIView(centerYSubview: lightSwitch)])
        stackView.spacing = 12
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 26))
    }

    @objc
    private func handleSwitch(_ sender: UISwitch) {
        iconView.updateSwitch(isOn: sender.isOn)
        iconView.updateText(sender.isOn ? "0%" : "Off")
        primaryLabel.alpha = sender.isOn ? 1 : 0.5
        subLabel.alpha = sender.isOn ? 1 : 0.5
        iconView.alpha = sender.isOn ? 1 : 0.5
        rightWidthAnchor.constant = sender.isOn ? -(frame.width - frame.height) : 0

        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }

    @objc
    private func handlePan(_ sender: UIPanGestureRecognizer) {
        if lightSwitch.isOn {
            var newWidth = -(frame.width - sender.location(in: self).x)
            newWidth = max(-(frame.width - frame.height), newWidth)
            newWidth = min(0, newWidth)
            rightWidthAnchor.constant = newWidth
            iconView.updateText("\(calcPercentage(width: newWidth)) %")
        }
    }

    private func calcPercentage(width: CGFloat) -> Int {
        sendActions(for: .valueChanged)
        value = Int(abs(width / -(frame.width - frame.height) - 1) * 100)
        return value
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
