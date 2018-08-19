//
//  PostDetailViewMock.swift
//  PostViewerTests
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import XCTest
@testable import PostViewer

class PostDetailViewMock: PostDetailViewProtocol {
    var presenter: PostDetailPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    func updateView(fromPost post: Post) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
