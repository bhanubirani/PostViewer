//
//  PostDetailProtocol.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

protocol PostDetailWireframeProtocol: class {
    var presenter: PostDetailPresenterProtocol? { get set }
    
    static func presentPostDetailModule(fromView viewController: UIViewController, with postDetails: Post)
}

protocol PostDetailViewProtocol: class {
    var presenter: PostDetailPresenterProtocol? { get set }
    
    func updateView(fromPost post: Post)
}

protocol PostDetailPresenterProtocol: class {
    var view: PostDetailViewProtocol? { get set }
    var wireframe: PostDetailWireframeProtocol? { get set }
    var post: Post? { get set }
    
    func viewDidLoad()
}
