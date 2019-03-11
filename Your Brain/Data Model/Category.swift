//
//  Category.swift
//  Your Brain
//
//  Created by Ali Al-khowaiter on 3/11/19.
//  Copyright © 2019 Ali Al-khowaiter. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name : String = ""
    let items = List<Item>()
    
}
