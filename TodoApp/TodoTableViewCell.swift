//
//  TodoCellTableViewCell.swift
//  TodoApp
//
//  Created by Rushil Perera on 2016-06-18.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import UIKit
import SWTableViewCell

class TodoTableViewCell: SWTableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var todo : Todo? {
        didSet {
            if let todoModel = todo {
                titleLabel.text = todoModel.title
                dateLabel.text = todoModel.date
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
