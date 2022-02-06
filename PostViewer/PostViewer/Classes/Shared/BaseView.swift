//
//  BaseView.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

enum GSMType: String {
    case Error
    case Warning
    case Success
}

class BaseView: UIViewController {

    // MARK: - Private vars
    
    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityView.center = view.center
        activityView.hidesWhenStopped = true
        view.addSubview(activityView)
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearance.backgroundColor = .white
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }

    func showAlertView(message: String, title: GSMType = .Success) {
        let alert = UIAlertController(title: title.rawValue, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
