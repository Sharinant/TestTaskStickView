//
//  MenuTablePresenter.swift
//  Hammer
//
//  Created by Антон Шарин on 04.04.2023.
//

import Foundation
import UIKit



final class HomePresenter {
    
    private let netService = NetworkService()
    
    
    //MARK - Banners Functionality
    
    let images : [UIImage] = [UIImage(named: "banner1")!,UIImage(named: "banner2")!,UIImage(named: "banner1")!]
    

    
    //MARK - Home VC Functionality

    weak var mainVcDelegate : HomePresenterToViewController?
    
    func stopAnimatingActivityIndicator() {
        mainVcDelegate?.notifyLoaded()
    }
    
    //MARK - Categories Functionality

    weak var categoriesDelegate : HomePresenterToCategories?
    
    func tapCategory(index : Int) {
        let value = CGFloat(2)*CGFloat(index) * 150
        mainVcDelegate?.scrollTo(value: value)
    }
    
    
    //MARK - Menu Table Functionality
    
    var menuViewModels : [MenuTableViewModel] = []
    
    weak var presenterToMenuViewDelegate : HomePresenterToMenuView?
    
    func getData() {
        menuViewModels = []
        netService.homePageCall { result in
            switch result {
            case .success(let models):
                self.menuViewModels.append(contentsOf: models.food.map({ return MenuTableViewModel(
                    title: $0.name,
                    image: $0.image,
                    description: $0.description,
                    price: $0.price)
                    
                }))
            self.presenterToMenuViewDelegate?.update()
                self.stopAnimatingActivityIndicator()

            case .failure(let error):
                print(error)
            }
        }
    }
    
}
