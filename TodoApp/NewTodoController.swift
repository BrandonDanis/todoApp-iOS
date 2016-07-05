//
//  NewTodoController.swift
//  TodoApp
//
//  Created by Brandon Danis on 2016-07-04.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit

class NewTodoController: UIViewController {
    
    @IBOutlet var todoDescTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitButtonClicked(sender: AnyObject) {
        
    }
    
}