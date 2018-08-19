//
//  PostDetailPresenter.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

class PostDetailPresenter: PostDetailPresenterProtocol {
    
    // MARK: - Dependecy
    var view: PostDetailViewProtocol?
    var wireframe: PostDetailWireframeProtocol?
    var post: Post?
    
    // MARK: - Instance methods
    
    func viewDidLoad() {
        guard let post = post else {
            return
        }
        view?.updateView(fromPost: post)
    }
}
