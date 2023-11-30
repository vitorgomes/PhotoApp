//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Vitor Gomes on 11/10/23.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
