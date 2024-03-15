//
//  User.swift
//  Appetizers
//
//  Created by João Azevedo on 14.03.24.
//

import Foundation

struct User: Codable {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var frequentRefills = false
}
