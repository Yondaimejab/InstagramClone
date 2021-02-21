//
//  Story.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import Foundation

struct Story: Codable, Hashable {
    var id: String = UUID().uuidString
    var imageAddress: String
    var user: User

    var imageURL: URL? {
        return URL(string: imageAddress)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
