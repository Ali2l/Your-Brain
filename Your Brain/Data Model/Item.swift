//
//  Item.swift
//  Your Brain
//
//  Created by Ali Al-khowaiter on 3/11/19.
//  Copyright © 2019 Ali Al-khowaiter. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
