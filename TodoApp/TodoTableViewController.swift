//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Rushil Perera on 2016-06-18.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import UIKit
import SWTableViewCell
import SwiftyJSON

class TodoTableViewController: UITableViewController, SWTableViewCellDelegate {
    
    @IBOutlet var tableview: UITableView!
    var api: TodoAPI = TodoAPI()
    var data: [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Table view loaded.")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        api.getTodoList({ (response: JSON) in
            if (response["status"] == 200) {
                let todoList = response["items"]
                for todoObject in todoList {
                    let todoItem = todoObject.1
                    let title : String = todoItem["description"].stringValue
                    let date : String = todoItem["datecreated"].stringValue
                    let todo = Todo(title: title, date: date)
                    self.data.append(todo)
                }
                self.tableview.reloadData()
            } else {
                print("TODO: Add error message in UI")
                print("TodoTableViewController: Error retrieving todo items")
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("Cell \(indexPath.row) loaded")
        let cell = tableView.dequeueReusableCellWithIdentifier("TodoTableViewCell") as! TodoTableViewCell
        cell.delegate = self
        
        // Configure the cell...
        cell.todo = data[indexPath.row]
        cell.leftUtilityButtons = self.getLeftUtilityButtons() as [AnyObject]
        cell.rightUtilityButtons = self.getRightUtilityButtons() as [AnyObject]
        
        return cell
    }
    
    func swipeableTableViewCell(cell: SWTableViewCell!, didTriggerLeftUtilityButtonWithIndex index: Int) {
        if index == 0 {
            print("done button")
        }
        cell.hideUtilityButtonsAnimated(true);
    }
    
    
    func swipeableTableViewCell(cell: SWTableViewCell!, didTriggerRightUtilityButtonWithIndex index: Int) {
        if index == 0 {
            print("view button")
        } else if index == 1 {
            print("edit button")
        } else if index == 2 {
            print("delete button")
        }
        cell.hideUtilityButtonsAnimated(true);
    }
    
    func getLeftUtilityButtons() -> NSMutableArray {
        let utilityButtons: NSMutableArray = NSMutableArray()
        
        utilityButtons.sw_addUtilityButtonWithColor(UIColor.greenColor(), title: NSLocalizedString("Done", comment: ""))
        return utilityButtons
    }
    
    func getRightUtilityButtons() -> NSMutableArray {
        let utilityButtons: NSMutableArray = NSMutableArray()
        
        utilityButtons.sw_addUtilityButtonWithColor(UIColor.grayColor(), title: NSLocalizedString("View", comment: ""))
        utilityButtons.sw_addUtilityButtonWithColor(UIColor.blueColor(), title: NSLocalizedString("Edit", comment: ""))
        utilityButtons.sw_addUtilityButtonWithColor(UIColor.redColor(), title: NSLocalizedString("Delete", comment: ""))
        return utilityButtons
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
