//
//  XCTestExpectation+Convenience.swift
//  PostViewerTests
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import XCTest

extension XCTestExpectation {
    
    static func fulfill(with fulfilledDescription: String, from expectations: [XCTestExpectation]) {
        for testExpectation in expectations {
            if testExpectation.expectationDescription == fulfilledDescription {
                testExpectation.fulfill()
            }
        }
    }
}
