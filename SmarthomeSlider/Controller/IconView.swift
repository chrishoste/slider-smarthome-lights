//
//  IconView.swift
//  SmarthomeSlider
//
//  Created by Christophe Hoste on 10.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//
// swiftlint:disable line_length

import UIKit

class IconView: UIView {

    override var intrinsicContentSize: CGSize {
        return .init(width: frame.height, height: frame.height)
    }

    private let label = UILabel(text: "Off", font: .systemFont(ofSize: 16, weight: .heavy))
    private var iconName: String!
    private var selectedIconName: String!
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    init(iconName: String, selectedIconName: String) {
        self.iconName = iconName
        self.selectedIconName = selectedIconName

        super.init(frame: .zero)

        setupStackView()
        updateSwitch()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        invalidateIntrinsicContentSize()
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 12

        addSubview(stackView)
        stackView.centerYInSuperview()
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    }

    func updateSwitch(isOn: Bool = false) {
        imageView.image = UIImage(systemName: isOn ? iconName : selectedIconName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold))
    }

    func updateText(_ text: String) {
        label.text = text
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
