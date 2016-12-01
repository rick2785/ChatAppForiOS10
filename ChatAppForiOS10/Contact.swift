//
//  Contact.swift
//  ChatAppForiOS10
//
//  Created by Rickey Hrabowskie on 11/29/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import Foundation

class Contact {
    
    private var _name = ""
    private var _id = ""
    
    init(id:String, name:String) {
        _id = id
        _name = name 
    }
    
    var name:String {
        get {
            return _name
        }
    }
    
    var id:String {
        return _id
    }
}
