//
//  PostDetailView.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

class PostDetailView: BaseView, PostDetailViewProtocol {
    
    // MARK: - Dependecy
    
    var presenter: PostDetailPresenterProtocol?
    
    // MARK: - Variables
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Instance methods
    
    func updateView(fromPost post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
}
