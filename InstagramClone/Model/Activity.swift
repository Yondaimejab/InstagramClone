//
//  Activity.swift
//  InstagramClone
//
//  Created by joel Alcantara on 21/5/21.
//

import Foundation
import UIKit

struct Activity {
    var id: String = UUID().uuidString
    var userImage: UIImage
    var details: String
}


var followingActivities: [Activity] = [
    Activity(userImage: UIImage(named: "user2")!, details: "asdlasdkljaldshk"),
    Activity(userImage: UIImage(named: "user2")!, details: "asddddddd"),
    Activity(userImage: UIImage(named: "user2")!, details: "asdlasdkljasdasdasdadsasdaldshk"),
    Activity(userImage: UIImage(named: "user2")!, details: "asdlasdkasddasdasljaldshk")
]

var yourActivities: [Activity] = [
    Activity(userImage: UIImage(named: "user1")!, details: "asdlasdkljaldshk"),
    Activity(userImage: UIImage(named: "user1")!, details: "asddddddd"),
    Activity(userImage: UIImage(named: "user1")!, details: "asdlasdkljasdasdasdadsasdaldshk"),
    Activity(userImage: UIImage(named: "user1")!, details: "asdlasdkasddasdasljaldshk")
]

