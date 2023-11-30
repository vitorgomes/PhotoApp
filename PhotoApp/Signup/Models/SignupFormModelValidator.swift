//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Vitor Gomes on 11/09/23.
//

import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLenght || firstName.count > SignupConstants.firstNameMaxLenght {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        
        var returnValue = true
        
        if lastName.count < SignupConstants.lastNameMinLenght || lastName.count > SignupConstants.lastNameMaxLenght {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isEmailValid(email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        
        var returnValue = true
        
        if password.count < SignupConstants.passwordMinLenght || password.count > SignupConstants.passwordMaxLenght {
            returnValue = false
        }
        
        return returnValue
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
