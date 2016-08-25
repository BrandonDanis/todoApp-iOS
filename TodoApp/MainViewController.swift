//
//  MainViewController.swift
//  TodoApp
//
//  Created by Brandon Danis on 2016-08-11.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class MainViewController: UIViewController, UIPopoverPresentationControllerDelegate
{
    
    @IBOutlet var logoutButton : UIButton!
    
    @IBOutlet var dropdownButton : UIButton!
    
    @IBOutlet var newReminderBtn: UIButton!
    
    var blurView : UIVisualEffectView!
    
    var api : TodoAPI = TodoAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting bg
        let bg = UIImageView(image: UIImage(named: "register-bg"))
        bg.frame = self.view.frame
        self.view.insertSubview(bg, atIndex: 0)
        
        // adding dim above bg since it's too bright
        let dim = UIView(frame: self.view.frame)
        dim.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.view.insertSubview(dim, aboveSubview: bg)
        
        // setting up view
        newReminderBtn.layer.cornerRadius = 20
        
        // setting tempUserIcon
        
        logoutButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        logoutButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        logoutButton.backgroundColor = UIColor.clearColor()
        logoutButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        logoutButton.titleLabel?.textColor = UIColor.whiteColor()
        logoutButton.setTitle("\u{f011}", forState: UIControlState.Normal)
        
        dropdownButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        dropdownButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        dropdownButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        dropdownButton.titleLabel?.textColor = UIColor.whiteColor()
        dropdownButton.setTitle("\u{f0c9}", forState: UIControlState.Normal)
        dropdownButton.backgroundColor = UIColor.clearColor()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //uh oh
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "newTodoSegue") {
            
            print("About to show 'new todo' view")
            
        }else if(segue.identifier == "newTodoPopup") {
            
            let popupController = segue.destinationViewController
            popupController.modalPresentationStyle = .OverCurrentContext
            
        }
    }
    
    @IBAction func logout(sender: AnyObject) {
        api.logout({ (responce: JSON) in
            print(responce)
        })
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func newTodoViewCancelled(){
        print("why you cancel view?")
    }
    
}



