//
//  MenuVC.swift
//  MenuSample
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        let menuCellNib = UINib(nibName: "RowCell", bundle: nil)
        menuTableView.register(menuCellNib, forCellReuseIdentifier: "RowCellID")
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }

}

//MARK: 
extension MenuVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 6
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        guard let menuCell = tableView.dequeueReusableCell(withIdentifier: "RowCellID", for: indexPath) as? RowCell else{ fatalError("Cell Not Found")
        }
        
        return menuCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
}
