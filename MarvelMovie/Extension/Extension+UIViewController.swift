//
//  Extension+UIViewController.swift
//  MarvelMovie
//
//  Created by Mehu on 17/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import Foundation
import UIKit


var activityView: UIActivityIndicatorView?

extension UIViewController {
    
    // Show Acitvity Indicator
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .gray)
        activityView?.center = self.view.center
        view.addSubview(activityView ?? UIView())
        activityView?.startAnimating()
    }
    
    // Hide Activity Indicator
    func hideActivityIndicator(){
        if let spinnerView = activityView {
            spinnerView.stopAnimating()
        }
    }
    
    // Hide keyboard
    func hideKeyboardWhenTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
