//
//  ExploreViewModel.swift
//  InstagramClone
//
//  Created by joel Alcantara on 16/5/21.
//

import UIKit

class ExploreViewModel {
    func getExploreItems() -> [UIImage] {
        var items = (1..<6).compactMap { item in
            UIImage(named: "destination\(item)")
        }
        items.append(UIImage(named: "user1")!)
        return items
    }
}
