//
//  SideMenuTransitionManager.swift
//  TodoApp
//
//  Created by Brandon Danis on 2016-08-26.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import UIKit

class SideMenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate  {
    
    private var presenting = false
    
    // MARK: UIViewControllerAnimatedTransitioning protocol methods
    
    // animate a change from one viewcontroller to another
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // get reference to our fromView, toView and the container view that we should perform the transition in
        let container = transitionContext.containerView()!
        
        // create a tuple of our screens
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        // assign references to our menu view controller and the 'bottom' view controller from the tuple
        // remember that our menuViewController will alternate between the from and to view controller depending if we're presenting or dismissing
        let menuViewController = !self.presenting ? screens.from as! SideMenuViewController : screens.to as! SideMenuViewController
        let bottomViewController = !self.presenting ? screens.to as! MainViewController : screens.from as! MainViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        // prepare menu items to slide in
        if (self.presenting){
            self.offStageMenuController(menuViewController, subviewController: bottomViewController)
        }
        
        // add the both views to our view controller
        container.addSubview(menuView)
        container.addSubview(bottomView)
        
        let duration = self.transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration, animations: {
            
            if (self.presenting){
                self.onStageMenuController(menuViewController, subviewController: bottomViewController) // onstage items: slide in
            }
            else {
                self.offStageMenuController(menuViewController, subviewController: bottomViewController) // offstage items: slide out
            }
            
        }, completion: { finished in
            
            // tell our transitionContext object that we've finished animating
            transitionContext.completeTransition(true)
            
            // bug: we have to manually add our 'to view' back http://openradar.appspot.com/radar?id=5320103646199808
            UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
            
            
        })
        
    }
    
    func offStage(amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(amount, 0)
    }
    
    func offStageMenuController(menuViewController: SideMenuViewController, subviewController: UIViewController){
        
        subviewController.view.transform = CGAffineTransformMakeTranslation(0, 0)
        
    }
    
    func onStageMenuController(menuViewController: SideMenuViewController, subviewController: UIViewController){
        
        let sideBarWidth = menuViewController.bgView.frame.width
        
        subviewController.view.transform = CGAffineTransformMakeTranslation(sideBarWidth, 0)
        
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    // MARK: UIViewControllerTransitioningDelegate protocol methods
    
    // return the animataor when presenting a viewcontroller
    // rememeber that an animator (or animation controller) is any object that aheres to the UIViewControllerAnimatedTransitioning protocol
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
}
