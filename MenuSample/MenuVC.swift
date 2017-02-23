//
//  MenuVC.swift
//  MenuSample
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    //variables
    let menuItems = ["Red","Green","Blue"]

    //outlets
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        let menuCellNib = UINib(nibName: "RowCell", bundle: nil)
        menuTableView.register(menuCellNib, forCellReuseIdentifier: "RowCellID")
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        menuTableView.allowsSelection = true
    }

}

//MARK:  UITableViewDelegate, UITableViewDataSource
extension MenuVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return menuItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        guard let menuCell = tableView.dequeueReusableCell(withIdentifier: "RowCellID", for: indexPath) as? RowCell else{ fatalError("Cell Not Found")
        }
        
        menuCell.menuLabel.text = menuItems[indexPath.row]
        
        return menuCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0: let displayPage = self.storyboard?.instantiateViewController(withIdentifier: "RedVCID") as! RedVC
                let parent = self.parent as! MainVC
                parent.changeDisplayPage(displayPage)
        
        case 1: let displayPage = self.storyboard?.instantiateViewController(withIdentifier: "GreenVCID") as! GreenVC
                let parent = self.parent as! MainVC
                parent.changeDisplayPage(displayPage)
            
        case 2: let displayPage = self.storyboard?.instantiateViewController(withIdentifier: "BlueVCID") as! BlueVC
                let parent = self.parent as! MainVC
                parent.changeDisplayPage(displayPage)
            
        default: print("default")
        }
        
    }
    
}
