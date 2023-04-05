//
//  CategoriesView.swift
//  Hammer
//
//  Created by Антон Шарин on 03.04.2023.
//

import UIKit

class CategoriesView: UIView {
    
    var presenter : HomePresenter?

    private var selectedButton = 0
    private var names = ["Пицца","Комбо","Десерты","Напитки"]
    
    private let categoryCollection : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 2)
        
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        collection.backgroundColor = backgroundGrayColor
        collection.showsHorizontalScrollIndicator = false

        return collection
    }()
    
    func setup() {
        addSubview(categoryCollection)
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        
        categoryCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            categoryCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
            categoryCollection.topAnchor.constraint(equalTo: self.topAnchor),
            categoryCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}


extension CategoriesView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(name : names[indexPath.row])
        
        if selectedButton == indexPath.row {
            cell.setSelected()
        } else {
            cell.setDefault()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedButton = indexPath.row
        categoryCollection.reloadData()        
        presenter?.tapCategory(index: indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width/3.5, height: 35)
    }
}
    
    

