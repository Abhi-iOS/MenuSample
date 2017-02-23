//
//  MainVC.swift
//  MenuSample
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: properties
    var menuPage = MenuVC()

    //MARK: outlets
    @IBOutlet weak var menuButton: UIButton!
    
    //MARK: view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false

        // Do any additional setup after loading the view.
        menuButton.addTarget(self, action: #selector(menuButtonAction(_:)), for: .touchUpInside)
        
        menuPage = self.storyboard?.instantiateViewController(withIdentifier: "MenuVCID") as! MenuVC
        self.addChildViewController(menuPage)
        self.view.addSubview(menuPage.view)
        menuPage.didMove(toParentViewController: self)
        menuPage.view.frame = CGRect(x: -(menuPage.view.frame.width),
                                     y: 0,
                                     width: (self.view.frame.width)/2,
                                     height: (self.view.frame.height))

    }

}

extension MainVC{
    
    func menuButtonAction(_ button : UIButton){
        
        menuButton.isSelected = !menuButton.isSelected
        if menuButton.isSelected{
            
            UIView.animate(withDuration: 0.33,
                           delay: 0.0,
                           options: .curveEaseInOut,
                           animations: {
                
                            self.menuPage.view.frame = CGRect(x: 0,
                                             y: 0,
                                             width: (self.view.frame.width)/2,
                                             height: (self.view.frame.height))
            }, completion: nil)
            
        }else{
            
            UIView.animate(withDuration: 0.33,
                           delay: 0.0,
                           options: .curveEaseInOut,
                           animations: {
                            
                            self.menuPage.view.frame = CGRect(x: -(self.menuPage.view.frame.width),
                                                              y: 0,
                                                              width: (self.view.frame.width)/2,
                                                              height: (self.view.frame.height))
            }, completion: nil)

            
        }
    }
    
}
