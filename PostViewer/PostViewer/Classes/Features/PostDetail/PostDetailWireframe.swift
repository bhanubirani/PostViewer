//
//  PostDetailWireframe.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

class PostDetailWireframe: PostDetailWireframeProtocol {
    var presenter: PostDetailPresenterProtocol?
    
    static func presentPostDetailModule(fromView viewController: UIViewController, with postDetails: Post) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let wireframe: PostDetailWireframeProtocol = PostDetailWireframe()
        let presenter: PostDetailPresenterProtocol = PostDetailPresenter()
        let view = storyboard.instantiateViewController(withIdentifier: "PostDetailView") as! PostDetailView
        
        // Depedency injection
        wireframe.presenter = presenter
        view.presenter = presenter
        
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.post = postDetails
        
        viewController.navigationController?.pushViewController(view, animated: true)
    }
}
