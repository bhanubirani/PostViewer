//
//  PostListPresenter.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

class PostListPresenter: PostListPresenterProtocol {
    
    var view: PostListViewProtocol?
    var wireframe: PostListWireframeProtocol?
    var interactor: PostListInteractorProtocol?
    
    func viewDidLoad() {
        view?.activityIndicator(enabled: true)
        interactor?.getPostList()
    }
    
    func userDidSelect(post: Post) {
        wireframe?.presentPostDetailModule(withPost: post)
    }
}

// MARK: - PostListInteractorOutputProtocol methods
extension PostListPresenter: PostListInteractorOutputProtocol {
    func getPostListSuccess(_ posts: [Post]) {
        view?.activityIndicator(enabled: false)
        view?.updatePosts(posts: posts)
    }
    
    func getPostListFailure(_ errorMessage: String) {
        view?.activityIndicator(enabled: false)
        view?.showAlertView(message: errorMessage, title: .Error)
    }
}
