//
//  Protocols.swift
//  Hammer
//
//  Created by Антон Шарин on 05.04.2023.
//

import Foundation



protocol HomePresenterToMenuView : AnyObject {
    func update()
}

protocol HomePresenterToViewController : AnyObject {
    func notifyLoaded()
    func scrollTo(value : CGFloat)
}

protocol HomePresenterToCategories : AnyObject {
    func tapCategory()
}
