//
//  extendedViewController.swift
//  Parse_Chat
//
//  Created by Jacob Frick on 10/3/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

extension UIViewController {
    func buildEmptyFieldAlertController()->UIAlertController{
        let alertController = UIAlertController(title: "Error:", message: "Please fill all fields to proceed", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {(action) in}
        alertController.addAction(OKAction)
        return alertController
    }
}

