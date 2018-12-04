//
//  ViewController.swift
//  IconButton
//
//  Created by Luigi Aiello on 12/04/2018.
//  Copyright (c) 2018 Luigi Aiello. All rights reserved.
//

import UIKit
import IconButton

class ViewController: UIViewController {

    // Mark - Outlets
    @IBOutlet weak var iconButton: IconButton!
    
    // Mark - Override
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Mark - Actions
    @IBAction func iconDidTap(_ sender: Any) {
        print("Clicked")
    }
}

