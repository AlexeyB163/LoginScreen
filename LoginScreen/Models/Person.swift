//
//  Person.swift
//  LoginScreen
//
//  Created by User on 09.01.2022.
//

import Foundation


struct Person {
    let name: String
    let surname: String
    let hobby: Hobby
    let family: Family
    let work: Work
}

struct Hobby {
    let description: String
    let hobbyImage: String
}

struct Family {
    let iImage: String
    let wife: String
    let wifeImage: String
    let childrenOne: String
    let childrenOneImage: String
    let childrenTwo: String
    let childrenTwoImage: String
    let pets: String
    let petsImage: String
    let familyImage: String
}

struct Work {
    let description: String
    let workImage: String
}
