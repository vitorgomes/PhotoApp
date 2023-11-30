//
//  SignupConstants.swift
//  PhotoApp
//
//  Created by Vitor Gomes on 11/09/23.
//

import Foundation

struct SignupConstants {
    static let firstNameMinLenght = 2
    static let firstNameMaxLenght = 10
    static let lastNameMinLenght = 2
    static let lastNameMaxLenght = 12
    static let passwordMinLenght = 8
    static let passwordMaxLenght = 16
    static let signupURLString = "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users"
    
    
    //To test testSignupWebService_WhenReceiveDifferentJSONResponse_ErrorTookPlace() please use http://appsdeveloperblog.com:8080/signup-mock-service/users URL. Course instructor has two URL used in the project, https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users is the new one, and http://appsdeveloperblog.com:8080/signup-mock-service/users is the old.

}
