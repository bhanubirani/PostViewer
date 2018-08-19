//
//  PostListWireframeMock.swift
//  PostViewerTests
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import XCTest
@testable import PostViewer

class PostListWireframeMock: PostListWireframeProtocol {
    
    var presenter: PostListPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    static func presentSplashScreenModule(inWindow window: UIWindow) {
    }
    
    func presentPostDetailModule(withPost post: Post) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
