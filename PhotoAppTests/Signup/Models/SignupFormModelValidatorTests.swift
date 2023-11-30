//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Vitor Gomes on 11/09/23.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // sut = System Under Test
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Vitor")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but RETURNED false")
    }

    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        //Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "V")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLenght) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "VitorVitorVitor")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLenght) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "Silva")
        
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but RETURNED false")
        
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "S")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for last name that is shorter than \(SignupConstants.firstNameMinLenght) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "VitorVitorVitor")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for last name that is longer than \(SignupConstants.lastNameMaxLenght) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        
        // Arrange
        
        // Act
        let isEmailValid = sut.isEmailValid(email: "test@test.com")
        
        // Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for valid email but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenInvalidEmailProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isEmailValid = sut.isEmailValid(email: "test@test")
        
        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for invalid email but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShoulReturnTrue() {
        
        // Arrange
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password but returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should return FALSE for a password shorter than \(SignupConstants.passwordMinLenght) characters but returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678901234567")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should return FALSE for a password bigger than \(SignupConstants.passwordMaxLenght) characters but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordProvided_ShouldReturnTrue() {
        
        // Arrange
        
        // Act
        let doPasswordMatch = sut.doPasswordMatch(password: "12345678", repeatPassword: "12345678")
        
        // Assert
        XCTAssertTrue(doPasswordMatch, "The doPasswordMatch should return TRUE for matching passwords but returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenNotMatchingPasswordProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let doPasswordMatch = sut.doPasswordMatch(password: "12345678", repeatPassword: "12345789")
        
        // Assert
        XCTAssertFalse(doPasswordMatch, "The doPasswordMatch should return FALSE for not matching passwords but returned TRUE")
        
    }
}
