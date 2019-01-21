//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Alex Karacaoglu on 1/20/19.
//  Copyright © 2019 Alex Karacaoglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageToBip: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        print("BIP BIP!")
    }
}

