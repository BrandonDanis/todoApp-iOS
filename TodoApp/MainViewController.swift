//
//  MainViewController.swift
//  TodoApp
//
//  Created by Brandon Danis on 2016-08-11.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController
{
    
    @IBOutlet var tempUserIcon : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting bg
        let bg = UIImageView(image: UIImage(named: "login-bg"))
        bg.frame = self.view.frame
        self.view.insertSubview(bg, atIndex: 0)
        
        // setting tempUserIcon
        tempUserIcon.font = UIFont(name: "FontAwesome", size: 110)
        tempUserIcon.textColor = UIColor.whiteColor()
        tempUserIcon.text = "\u{f21b}"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //uh oh
    }
    
    
    
}