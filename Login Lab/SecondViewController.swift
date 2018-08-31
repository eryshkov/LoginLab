//
//  SecondViewController.swift
//  Login Lab
//
//  Created by Evgeniy Ryshkov on 31.08.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var textToDisplay: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = textToDisplay
    }

}
