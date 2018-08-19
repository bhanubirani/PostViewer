//
//  PostListViewMock.swift
//  PostViewerTests
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import XCTest

class PostListViewMock: PostListViewProtocol {
    var presenter: PostListPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    func activityIndicator(enabled: Bool) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func updatePosts(posts: [Post]) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    

}
