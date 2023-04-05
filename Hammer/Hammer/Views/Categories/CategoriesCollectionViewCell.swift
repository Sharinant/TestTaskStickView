//
//  CategoriesCollectionViewCell.swift
//  Hammer
//
//  Created by Антон Шарин on 03.04.2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoriesCollectionViewCell"

        private let category : UILabel = {
        let category = UILabel()
        category.textAlignment = .center
        category.layer.borderWidth = 0.5
        category.layer.borderColor = UIColor.blue.cgColor
        category.layer.cornerRadius = 15
            
            category.clipsToBounds = true
        return category
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = backgroundGrayColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setDefault() {
        category.textColor = pinkColorText40
        category.font = UIFont.systemFont(ofSize: 13, weight: .regular)

        category.layer.borderColor = pinkColorText40.cgColor
        category.backgroundColor = backgroundGrayColor
        category.layer.borderWidth = 0.5

    }
    
    func setSelected() {
        category.textColor = pinkColorText
        category.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        category.backgroundColor = pinkColorText.withAlphaComponent(0.2)
        category.layer.borderWidth = 0
    }
    
    
    func setup(name : String) {
        contentView.addSubview(category)
        contentView.backgroundColor = backgroundGrayColor
        category.frame = contentView.bounds
        category.text = name
    
    }
}
