//
//  TabBar.swift
//  Hammer
//
//  Created by Антон Шарин on 03.04.2023.
//

import UIKit

class TabBar: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tabBar.tintColor = selectedColorTabBar
        
        
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        
        
        
                let vc1 = HomeViewController()
                let vc2 = EmptyViewController()
                let vc3 = EmptyViewController()
                let vc4 = EmptyViewController()
        
        vc1.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(named: "menu"), tag: 0)
        vc2.tabBarItem = UITabBarItem(title: "Контакты", image: UIImage(named: "contacts"), tag: 1)
        vc3.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 2)
        vc4.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "cart"), tag: 3)

        
        
        setViewControllers([vc1, vc2, vc3,vc4], animated: false)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
