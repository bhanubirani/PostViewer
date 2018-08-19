//
//  PostDetailPresenterTest.swift
//  PostViewerTests
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import XCTest
@testable import PostViewer

class PostDetailPresenterTest: XCTestCase {
    var viewMock: PostDetailViewMock?
    var wireframeMock: PostDetailWireframeMock?
    var testPresenter = PostDetailPresenter()
    
    override func setUp() {
        super.setUp()
        
        viewMock = PostDetailViewMock()
        testPresenter.view = viewMock
        
        wireframeMock = PostDetailWireframeMock()
        testPresenter.wireframe = wireframeMock
    }
    
    func testViewDidLoad() {
        guard let viewMock = viewMock else {
            XCTFail()
            return
        }
        
        viewMock.expectations.append(expectation(description: "updateView(fromPost:)"))
        testPresenter.post = Post(withDict: ["key" : "value" as AnyObject])
        testPresenter.viewDidLoad()
        wait(for: viewMock.expectations, timeout: 5.0)
    }
}
