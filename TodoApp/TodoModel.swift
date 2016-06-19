//
//  TodoModel.swift
//  TodoApp
//
//  Created by Rushil Perera on 2016-06-19.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation

class Todo {
    var title : String
    var date : String
    
    init(title : String, date : String) {
        self.title = title
        self.date = date
    }
}
