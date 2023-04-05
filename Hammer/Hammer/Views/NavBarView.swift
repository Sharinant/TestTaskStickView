//
//  NavBarView.swift
//  Hammer
//
//  Created by Антон Шарин on 04.04.2023.
//

import UIKit

class NavBarView: UIView {

    private let label : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.text = "Москва ᐯ"
        label.textColor = .black
        return label
    }()

    func setup() {
        addSubview(label)
        backgroundColor = backgroundGrayColor
        label.frame = CGRect(x: 10, y: 10, width: 100, height: 30)
    }
}
