//
//  BannersView.swift
//  Hammer
//
//  Created by Антон Шарин on 03.04.2023.
//

import UIKit

class BannersView: UIView {
    
    var presenter : HomePresenter?
        
    private let collectionCarousel : SelfSizedCollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        
        let collection = SelfSizedCollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = backgroundGrayColor
        collection.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    
    func setup() {
        addSubview(collectionCarousel)
        
        collectionCarousel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionCarousel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionCarousel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionCarousel.topAnchor.constraint(equalTo: self.topAnchor),
            collectionCarousel.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        collectionCarousel.delegate = self
        collectionCarousel.dataSource = self
        
        collectionCarousel.reloadData()
    }
    

}



extension BannersView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionCarousel.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as? BannerCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(with: (presenter?.images[indexPath.row])!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width - 30, height: 110)
    }
}
