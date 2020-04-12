//
//  ViewController.swift
//  SmarthomeSlider
//
//  Created by Christophe Hoste on 10.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let slider = Slider(primaryText: "Living Room", subText: "Reading Lamp")
    let slider1 = Slider(primaryText: "Bath Room", subText: "Shower")
    let slider2 = Slider(primaryText: "Kitchen", subText: "All")
    let slider3 = Slider(primaryText: "Garage", subText: "Workbench")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSlider()
    }

    private func setupSlider() {
        slider.addTarget(self, action: #selector(handleValueChanged(_:)), for: .valueChanged)
        slider.constrainHeight(constant: 70)
        slider1.addTarget(self, action: #selector(handleValueChanged(_:)), for: .valueChanged)
        slider1.constrainHeight(constant: 80)
        slider2.addTarget(self, action: #selector(handleValueChanged(_:)), for: .valueChanged)
        slider2.constrainHeight(constant: 90)
        slider3.constrainHeight(constant: 100)

        let stackView = UIStackView(arrangedSubviews: [slider, slider1, slider2, slider3])
        stackView.axis = .vertical
        stackView.spacing = 16

        view.addSubview(stackView)
        stackView.anchor(top: nil,
                      leading: view.leadingAnchor,
                      bottom: nil,
                      trailing: view.trailingAnchor,
                      padding: .init(top: 0, left: 32, bottom: 0, right: 32))
        stackView.centerInSuperview()
    }

    @objc func handleValueChanged(_ sender: Slider) {
        // Do Somthing with Value sender.value
    }
}
