//
//  LoginInformation.swift
//  capstone
//
//  Created by 최병욱 on 11/2/23.
//

import Foundation

struct LoginInformation: Codable {
    let info: [Info]
    let result: String
    
    enum CodingKeys: String, CodingKey{
        case info
        case result
    }
}

struct Info: Codable{
    let id: String
    let password: String
    let name: String
    let nickname: String
}
