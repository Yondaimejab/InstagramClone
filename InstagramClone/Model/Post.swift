//
//  Post.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import Foundation

enum HomeCollectionViewRepresentable: Hashable {
    case story(Story)
    case post(Post)
}

struct Post: Codable, Hashable {
    private let id: String = UUID().uuidString
    var user: User
    var postImageAddress: String
    var datePosted: Date
    var likesCount: Int
    var postComment: String

    var postImageURL: URL? {
        return URL(string: postImageAddress)
    }


    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
