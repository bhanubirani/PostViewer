//
//  PostListInteractor.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

struct ErrorMessage {
    static let GenericErrorMessage = "Something went wrong. We'll correct it pretty soon, please try again later!"
    static let NetworkUnavailable = "Oops! Looks like we don't have network at the moment. And sadly we don't have anything cached as well :("
}

class PostListInteractor: PostListInteractorProtocol {
    
    // MARK: - Dependencies
    
    var presenter: PostListInteractorOutputProtocol?
    
    // MARK: - Methods
    
    func getPostList() {
        if ReachabilityManager.shared.isNetworkAvailable == false {
            DispatchQueue.main.async {
                self.presenter?.getPostListFailure(ErrorMessage.NetworkUnavailable)
            }
        } else {
            makeAPICall()
        }
    }
    
    private func makeAPICall() {
        PostServices.getPosts { [weak self] (jsonObject, error) in
            if let error = error {
                DispatchQueue.main.async {
                    self?.presenter?.getPostListFailure(error.localizedDescription)
                }
            } else if let array = jsonObject as? [[String: AnyObject]], array.isEmpty == false {
                var posts = [Post]()
                for object in array {
                    posts.append(Post(withDict: object))
                }
                DispatchQueue.main.async {
                    self?.presenter?.getPostListSuccess(posts)
                }
            } else {
                DispatchQueue.main.async {
                    self?.presenter?.getPostListFailure(ErrorMessage.GenericErrorMessage)
                }
            }
        }
    }
}
