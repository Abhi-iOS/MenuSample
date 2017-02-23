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
    var displayPage = UIViewController()
    

    //MARK: outlets
    @IBOutlet weak var menuButton: UIButton!
    
    //MARK: view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        menuButton.addTarget(self, action: #selector(menuButtonAction(_:)), for: .touchUpInside)
        
        
        menuPage = self.storyboard?.instantiateViewController(withIdentifier: "MenuVCID") as! MenuVC

        displayPage = self.storyboard?.instantiateViewController(withIdentifier: "RedVCID") as! RedVC

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.addChildViewController(displayPage)
        self.view.addSubview(displayPage.view)
        
        displayPage.view.frame = CGRect(x: 0,
                                        y: 70,
                                        width: self.view.frame.width,
                                        height: self.view.frame.height)
        self.menuButton.isSelected = false
        
        self.addChildViewController(menuPage)
        self.view.addSubview(menuPage.view)
        menuPage.didMove(toParentViewController: self)
        menuPage.view.frame = CGRect(x: -(menuPage.view.frame.width),
                                     y: 70,
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
                                             y: 70,
                                             width: (self.view.frame.width)/2,
                                             height: (self.view.frame.height))
            }, completion: nil)
            
        }else{
            
            UIView.animate(withDuration: 0.33,
                           delay: 0.0,
                           options: .curveEaseInOut,
                           animations: {
                            
                            self.menuPage.view.frame = CGRect(x: -(self.menuPage.view.frame.width),
                                                              y: 70,
                                                              width: (self.view.frame.width)/2,
                                                              height: (self.view.frame.height))
            }, completion: nil)

            
        }
    }
    
    
    func changeDisplayPage(_ newPage: UIViewController){

        displayPage.removeFromParentViewController()
        self.displayPage = newPage
        viewWillLayoutSubviews()
        
    }
    
}
