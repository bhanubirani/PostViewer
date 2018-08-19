//
//  PostListWireframe.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

class PostListWireframe: PostListWireframeProtocol {
    var presenter: PostListPresenterProtocol?
    
    static func presentSplashScreenModule(inWindow window: UIWindow) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let wireframe: PostListWireframeProtocol = PostListWireframe()
        let presenter: PostListPresenterProtocol & PostListInteractorOutputProtocol = PostListPresenter()
        let interactor: PostListInteractorProtocol = PostListInteractor()
        let view: PostListViewProtocol = storyboard.instantiateViewController(withIdentifier: "PostListView") as! PostListView
        
        // Depedency injection
        wireframe.presenter = presenter
        view.presenter = presenter
        
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        // Get rootNavigationController for window
        let rootNavigationController = storyboard.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
        let postListView = view as! PostListView
        rootNavigationController.viewControllers = [postListView]
        
        // Set root view controller in window
        window.rootViewController = rootNavigationController
    }

    func presentPostDetailModule(withPost post: Post) {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        PostDetailWireframe.presentPostDetailModule(fromView: view, with: post)
    }
}
