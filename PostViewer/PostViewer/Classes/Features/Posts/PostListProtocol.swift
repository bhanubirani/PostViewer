//
//  PostListProtocol.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

protocol PostListWireframeProtocol: class {
    var presenter: PostListPresenterProtocol? { get set }
    
    static func presentSplashScreenModule(inWindow window: UIWindow)
    func presentPostDetailModule(withPost post: Post)
}

protocol PostListViewProtocol: class {
    var presenter: PostListPresenterProtocol? { get set }
    
    func activityIndicator(enabled: Bool)
    func updatePosts(posts: [Post])
    func showAlertView(message: String, title: GSMType)
}

protocol PostListPresenterProtocol: class {
    var view: PostListViewProtocol? { get set }
    var wireframe: PostListWireframeProtocol? { get set }
    var interactor: PostListInteractorProtocol? { get set }
    
    func viewDidLoad()
    func userDidSelect(post: Post)
}

protocol PostListInteractorProtocol: class {
    var presenter: PostListInteractorOutputProtocol? { get set }
    
    func getPostList()
}

protocol PostListInteractorOutputProtocol: class {
    func getPostListSuccess(_ posts: [Post])
    func getPostListFailure(_ errorMessage: String)
}
