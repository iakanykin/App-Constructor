//
//  Item.swift
//  App Constructor
//
//  Created by Student on 02/04/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

enum Item {
    case text(String)
    case image(UIImage)
    case container(name: String, items: [Int])
}

typealias Items = [Item]

extension Items {

    /// Deletes an item at index
    ///
    /// - Parameter index: index of item to delete
    mutating func delete(at deletedIndex: Int) {
        remove(at: deletedIndex)
        
        for (index, item) in self.enumerated {
            if case .container(let name, var items) = item {
                items = items.filter { $0 == deletedIndex }
                items = items.map { $0 < deletedIndex ? $0 : $0 - 1 }
                self[index] = container(name: name, items: items)
            }
        }
    }
    static func loadSample() -> Items{
        return [
        .container(name: "goroda", items: [1]),
        .container(name: "Moscow", items: [2, 3]),
        .image(UIImage()),
        .text("Naselenie - 12m ppl")
        ]
    }
}
