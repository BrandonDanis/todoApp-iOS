//
//  NewTodoPopupView.swift
//  TodoApp
//
//  Created by Brandon Danis on 2016-08-15.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit

class NewTodoPopupView: UIViewController {
    
    
    @IBOutlet var popupView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clearColor()
        
        popupView.layer.cornerRadius = 10
        popupView.layer.borderWidth = 0.25
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}