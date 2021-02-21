//
//  User.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 21/2/21.
//

import Foundation

struct User: Codable, Hashable {
    var userName: String
    var userImageAddres: String

    var userImageURL: URL? {
        return URL(string: userImageAddres)
    }
}
