//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Alex Karacaoglu on 1/20/19.
//  Copyright © 2019 Alex Karacaoglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // PROPERTIES
    @IBOutlet weak var imageToBip: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // FUNCTIONS
    func animate() {
        let originalBounds = self.imageToBip.bounds
        
        let shrinkage = CGFloat(60)
        
        self.imageToBip.bounds = CGRect(x: self.imageToBip.bounds.origin.x + shrinkage,
                                        y: self.imageToBip.bounds.origin.y + shrinkage,
                                        width: self.imageToBip.bounds.width - shrinkage,
                                        height: self.imageToBip.bounds.height - shrinkage)
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: [],
                       animations: {
                        self.imageToBip.bounds = originalBounds },
                       completion: nil
        )
    }
    
    
    // ACTIONS
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        print("BIP BIP!")
        animate()
    }
}

