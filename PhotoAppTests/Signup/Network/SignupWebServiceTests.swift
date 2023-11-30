//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Vitor Gomes on 11/10/23.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {
    
    var sut:SignupWebService!
    var signFormRequestModel:SignupFormRequestModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        signFormRequestModel = SignupFormRequestModel(firstName: "Vitor", lastName: "Silva", email: "test@test.com", password: "123456")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }
    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceiveDifferentJSONResponse_ErrorTookPlace() {
        
        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testSignupWebservice_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = SignupWebService(urlString: "")
        
        // Act
        
        sut.signup(withForm: signFormRequestModel) { signupResponseModel, error in
            
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for and invalidRequestURLString error")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLStringError takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }

}
