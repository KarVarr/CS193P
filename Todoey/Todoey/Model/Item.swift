//
//  Item.swift
//  Todoey
//
//  Created by Karen Vardanian on 15.09.2023.
//

import Foundation
import RealmSwift

class Item: Object {
    @Persisted var title: String = ""
    @Persisted var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
