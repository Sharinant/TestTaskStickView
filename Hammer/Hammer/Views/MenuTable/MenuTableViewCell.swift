//
//  MenuTableViewCell.swift
//  Hammer
//
//  Created by Антон Шарин on 03.04.2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let identifier = "MenuTableViewCell"
    
    private let presenter = ""
    
    private let foodImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private let descriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        

        return label
    }()
    
    private let priceButton : UIButton = {
        let button = UIButton()
        button.setTitle("test", for: .normal)
        button.setTitleColor(pinkColorText, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        
        button.layer.borderColor = pinkColorText.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        
        
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with model: MenuTableViewModel) {
        
        [foodImageView,titleLabel,descriptionLabel,priceButton].forEach { view in
            contentView.addSubview(view)
        }
        contentView.backgroundColor = .white
        foodImageView.downloaded(from: model.image)
        priceButton.setTitle("от \(model.price) р", for: .normal)
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        
        
        setupCons()
    }

    private func setupCons() {
        
        [foodImageView,titleLabel,descriptionLabel,priceButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            foodImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            foodImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width/2.5),


            priceButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -25),
            priceButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15),
            priceButton.heightAnchor.constraint(equalToConstant: 30),
            priceButton.widthAnchor.constraint(equalToConstant: 85),
            
            titleLabel.topAnchor.constraint(equalTo: foodImageView.topAnchor,constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor,constant: 35),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -25),
            descriptionLabel.bottomAnchor.constraint(equalTo: priceButton.topAnchor,constant: -30)
        
        ])
    }
    
    
}
