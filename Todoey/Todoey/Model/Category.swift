//
//  Category.swift
//  Todoey
//
//  Created by Karen Vardanian on 15.09.2023.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var name: String = ""
    let items = List<Item>()
}
