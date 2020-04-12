//
//  UILabel+Extension.swift
//  SmarthomeSlider
//
//  Created by Christophe Hoste on 10.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, color: UIColor = .systemBlue) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = color
    }
}
