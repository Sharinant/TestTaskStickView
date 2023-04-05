//
//  BannerCollectionViewCell.swift
//  Hammer
//
//  Created by Антон Шарин on 03.04.2023.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    static let identifier = "BannerCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = backgroundGrayColor
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(with image : UIImage) {
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 5),
            imageView.heightAnchor.constraint(equalToConstant: 110)

        ])
        
        imageView.image = image
        

        
    }
    
    
    
    
}
