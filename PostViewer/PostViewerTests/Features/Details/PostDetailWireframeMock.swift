//
//  PostDetailWireframeMock.swift
//  PostViewerTests
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit
@testable import PostViewer

class PostDetailWireframeMock: PostDetailWireframeProtocol {
    var presenter: PostDetailPresenterProtocol?
    
    static func presentPostDetailModule(fromView viewController: UIViewController, with postDetails: Post) {
        
    }
}
