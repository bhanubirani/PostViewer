//
//  PostListPresenterTest.swift
//  PostViewerTests
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import XCTest

class PostListPresenterTest: XCTestCase {

    var viewMock: PostListViewMock?
    var wireframeMock: PostListWireframeMock?
    var interactor: PostListInteractorMock?
    var testPresenter = PostListPresenter()
    
    override func setUp() {
        super.setUp()
        
        viewMock = PostListViewMock()
        testPresenter.view = viewMock
        
        wireframeMock = PostListWireframeMock()
        testPresenter.wireframe = wireframeMock
        
        interactor = PostListInteractorMock()
        testPresenter.interactor = interactor
    }
    
    func testViewDidLoad() {
        guard let viewMock = viewMock else {
            XCTFail()
            return
        }
        
        viewMock.expectations.append(expectation(description: "activityIndicator(enabled:)"))
        testPresenter.viewDidLoad()
        wait(for: viewMock.expectations, timeout: 5.0)
    }
    
    func testUserDidSelect() {
        guard let wireframeMock = wireframeMock else {
            XCTFail()
            return
        }
        
        wireframeMock.expectations.append(expectation(description: "presentPostDetailModule(withPost:)"))
        testPresenter.userDidSelect(post: Post(withDict: ["key" : "value" as AnyObject]))
        wait(for: wireframeMock.expectations, timeout: 5.0)
    }
    
    func testGetPostListSuccess() {
        guard let viewMock = viewMock else {
            XCTFail()
            return
        }
        viewMock.expectations.append(expectation(description: "activityIndicator(enabled:)"))
        viewMock.expectations.append(expectation(description: "updatePosts(posts:)"))
        testPresenter.getPostListSuccess([Post(withDict: ["key" : "value" as AnyObject])])
        wait(for: viewMock.expectations, timeout: 5.0)
    }
    
    func testGetPostListFailure() {
        guard let viewMock = viewMock else {
            XCTFail()
            return
        }
        viewMock.expectations.append(expectation(description: "activityIndicator(enabled:)"))
        testPresenter.getPostListFailure("errorMessage")
        wait(for: viewMock.expectations, timeout: 5.0)
    }
}
