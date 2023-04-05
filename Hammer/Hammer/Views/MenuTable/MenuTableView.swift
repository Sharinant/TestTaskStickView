//
//  MenuTableView.swift
//  Hammer
//
//  Created by Антон Шарин on 04.04.2023.
//

import UIKit



class MenuTableView: UIView {
    
    var presenter : HomePresenter?
    
    private let menuTable : SelfSizedTableView = {
        let table = SelfSizedTableView(frame: .zero)
        table.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    func setup() {
        addSubview(menuTable)
        presenter?.getData()
        presenter?.presenterToMenuViewDelegate = self
        self.backgroundColor = .red
        menuTable.backgroundColor = .white
        
        menuTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuTable.topAnchor.constraint(equalTo: self.topAnchor),
            menuTable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuTable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            menuTable.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        menuTable.delegate = self
        menuTable.dataSource = self
                
        menuTable.reloadData()
        
       
        
    }
    

}


extension MenuTableView : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.menuViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = menuTable.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell else {return UITableViewCell()}
        cell.setup(with: (presenter?.menuViewModels[indexPath.row])!)
        return cell
    }
    
    
    
    
    
}


extension MenuTableView : HomePresenterToMenuView {
    func update() {
        DispatchQueue.main.async {
            self.menuTable.reloadData()

        }
    }
    
    
}
