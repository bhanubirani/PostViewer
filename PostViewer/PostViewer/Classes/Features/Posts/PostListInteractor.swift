//
//  PostListInteractor.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit
import CoreData

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
            if let posts = fetchCachedPosts(), posts.isEmpty == false {
                postDataToPresenter(posts: posts)
            } else {
                postErrorToPresenter(errorMessage: ErrorMessage.NetworkUnavailable)
            }
        } else {
            makeAPICall()
        }
    }
    
    private func makeAPICall() {
        PostServices.getPosts { [weak self] (jsonObject, error) in
            if let array = jsonObject as? [[String: AnyObject]], array.isEmpty == false {
                self?.clearData()
                self?.saveInCoreDataWith(array: array)
                if let posts = self?.fetchCachedPosts() {
                    self?.postDataToPresenter(posts: posts)
                }
            } else {
                self?.postErrorToPresenter(errorMessage: error?.localizedDescription ?? ErrorMessage.GenericErrorMessage)
            }
        }
    }
    
    // MARK: - CoreData Methods
    
    private func createPhotoEntityFrom(dictionary: [String: AnyObject]) -> NSManagedObject? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        if let postEntity = NSEntityDescription.insertNewObject(forEntityName: "PostEntity", into: context) as? PostEntity {
            postEntity.title = dictionary["title"] as? String
            postEntity.body = dictionary["body"] as? String
            return postEntity
        }
        return nil
    }
    
    private func saveInCoreDataWith(array: [[String: AnyObject]]) {
        _ = array.map{ self.createPhotoEntityFrom(dictionary: $0) }
        do {
            try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
        } catch let error {
            print(error)
        }
    }
    
    private func fetchCachedPosts() -> [Post]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PostEntity")
        request.returnsObjectsAsFaults = false
        
        do {
            let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
            let result = try context.fetch(request)
            if let result = result as? [NSManagedObject] {
                var posts: [Post] = []
                for data in result {
                    let post = Post()
                    post.title = data.value(forKey: "title") as? String ?? ""
                    post.body = data.value(forKey: "body") as? String ?? ""
                    posts.append(post)
                }
                return posts
            }
        } catch {
            print("Failed")
        }
        return nil
    }
    
    private func clearData() {
        do {
            let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: PostEntity.self))
            do {
                let objects  = try context.fetch(fetchRequest) as? [NSManagedObject]
                _ = objects.map{$0.map{context.delete($0)}}
                CoreDataStack.sharedInstance.saveContext()
            } catch let error {
                print("ERROR DELETING : \(error)")
            }
        }
    }

    // MARK: - Helper method
    
    private func postDataToPresenter(posts: [Post]) {
        DispatchQueue.main.async {
            self.presenter?.getPostListSuccess(posts)
        }
    }
    
    private func postErrorToPresenter(errorMessage: String) {
        DispatchQueue.main.async {
            self.presenter?.getPostListFailure(errorMessage)
        }
    }
}
