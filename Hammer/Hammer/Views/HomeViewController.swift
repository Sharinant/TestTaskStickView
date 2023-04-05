//
//  ViewController.swift
//  Hammer
//
//  Created by Антон Шарин on 02.04.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let presenter = HomePresenter()
    
    private var activityView: UIActivityIndicatorView?
       
    private let scrollView: UIScrollView = {
            let view = UIScrollView()
            view.backgroundColor = backgroundGrayColor
            view.showsVerticalScrollIndicator = false
            return view
        }()
    
    private let bannersView = BannersView()
    private let categoriesView = CategoriesView()
    private let menuTableView = MenuTableView()
    private let navBarView = NavBarView()
    
    private func setupViews() {
        
        presenter.mainVcDelegate = self

        menuTableView.presenter = presenter
        menuTableView.setup()

        
        bannersView.presenter = presenter
        bannersView.setup()
        bannersView.backgroundColor = backgroundGrayColor

    
        navBarView.setup()
        
        categoriesView.presenter = presenter
        categoriesView.backgroundColor = backgroundGrayColor
        categoriesView.setup()

        
        scrollView.delegate = self

    }
    
    private func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.scrollView.addSubview(activityView!)
        activityView?.startAnimating()
    }
    
    private func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            showActivityIndicator()
            setupViews()
            
            view.backgroundColor = backgroundGrayColor
        
            [bannersView,menuTableView,navBarView,categoriesView].forEach { view in
                scrollView.addSubview(view)
            }

            view.addSubview(scrollView)
            
            [menuTableView, bannersView, scrollView,navBarView,categoriesView].forEach { view in
                view.translatesAutoresizingMaskIntoConstraints = false
            }
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let safeArea = view.safeAreaLayoutGuide
        
        let contentArea = scrollView.contentLayoutGuide
        let frameArea = scrollView.frameLayoutGuide

        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            navBarView.topAnchor.constraint(equalTo: frameArea.topAnchor),
            navBarView.leadingAnchor.constraint(equalTo: frameArea.leadingAnchor),
            navBarView.trailingAnchor.constraint(equalTo: frameArea.trailingAnchor),
            navBarView.heightAnchor.constraint(equalToConstant: 60),
            
            
            bannersView.leadingAnchor.constraint(equalTo: frameArea.leadingAnchor),
            bannersView.trailingAnchor.constraint(equalTo: frameArea.trailingAnchor),
            bannersView.heightAnchor.constraint(equalToConstant: 150),
            bannersView.topAnchor.constraint(equalTo: navBarView.bottomAnchor),

            categoriesView.leadingAnchor.constraint(equalTo: frameArea.leadingAnchor),
            categoriesView.trailingAnchor.constraint(equalTo: frameArea.trailingAnchor),
            categoriesView.heightAnchor.constraint(equalToConstant: 75),
            categoriesView.topAnchor.constraint(greaterThanOrEqualTo: navBarView.bottomAnchor),

          
            menuTableView.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: contentArea.bottomAnchor),
            menuTableView.widthAnchor.constraint(equalTo: frameArea.widthAnchor),
            
            
        ])

        var topConstraint: NSLayoutConstraint!
        
        topConstraint = menuTableView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor)
        topConstraint.priority = .defaultHigh
        topConstraint.isActive = true
        
        topConstraint = menuTableView.topAnchor.constraint(equalTo: contentArea.topAnchor, constant: 260)
        topConstraint.isActive = true
        
        menuTableView.layer.masksToBounds = true
        menuTableView.layer.cornerRadius = 20
        
    }
    
    
    
    
       
       
   }



extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        bannersView.alpha = (100.0 - min(200, scrollView.contentOffset.y)) / 100.0
    }
}



extension HomeViewController : HomePresenterToViewController{
    func scrollTo(value: CGFloat) {
        let point = CGPoint(x: 0, y: value)
        scrollView.setContentOffset(point, animated: true)
    }
    
    func notifyLoaded() {
        DispatchQueue.main.async {
            self.hideActivityIndicator()

        }
    }
    
    
}
