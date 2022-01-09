//
//  Person.swift
//  LoginScreen
//
//  Created by User on 09.01.2022.
//

import Foundation
import UIKit

enum dateUser: String {
    case userName = "User"
    case password = "1234"
}

struct Person {
    let name: String
    let surname: String
    let hobby: Hobby
    let family: Family
    let work: Work
}

struct Hobby {
    let description: String
    let hobbyImage: UIImage
}

struct Family {
    let wife: String
    let wifeImage: UIImage
    let children: [String : UIImage]
    let pets: String
    let petsImage: UIImage
    let familyImage: UIImage
}

struct Work {
    let description: String
    let workImage: UIImage
}
