//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Alex Karacaoglu on 1/20/19.
//  Copyright © 2019 Alex Karacaoglu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    // PROPERTIES
    @IBOutlet weak var imageToBip: UIImageView!
    
    var soundPlayer = AVAudioPlayer()
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // FUNCTIONS
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        imageToBip.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }
            catch {
                print("ERROR: data in sound file \(soundName) was not able to be played")
            }
        }
        else {
            print("ERROR file \(soundName) didn't load")
        }
    }
    
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
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            alert(title: "No Camera Availible",
                  message: "There is no camera availible for this device :/")
        }
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        print("BIP BIP!")
        animate()
        playSound(soundName: "punchSound", audioPlayer: &soundPlayer)
    }
}
