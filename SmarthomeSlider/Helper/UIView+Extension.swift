//
//  UIView+Extension.swift
//  SmarthomeSlider
//
//  Created by Christophe Hoste on 10.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//

import UIKit

extension UIView {

    convenience init(centerYSubview: UIView) {
        self.init()
        addSubview(centerYSubview)
        centerYSubview.centerYInSuperview()
        centerYSubview.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    }
}
