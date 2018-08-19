//
//  PostListView.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

class PostListView: BaseView {

    // MARK: - Constants
    
    private var TableViewCellIdentifier = "PostTableViewCellIdentifier"
    
    // MARK: - Instance variables
    
    fileprivate var posts: [Post] = []
    
    var presenter: PostListPresenterProtocol?
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        // Tableview configs
        tableView.isHidden = true
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

// MARK: - PostListViewProtocol Methods
extension PostListView: PostListViewProtocol {
    
    func activityIndicator(enabled: Bool) {
        enabled ? activityView.startAnimating() : activityView.stopAnimating()
    }
    
    func updatePosts(posts: [Post]) {
        self.posts = posts
        tableView.reloadData()
        tableView.isHidden = false
    }
}

// MARK: - UITableViewDelegate/UITableViewDataSource Methods
extension PostListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier, for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.userDidSelect(post: posts[indexPath.row])
    }
}
