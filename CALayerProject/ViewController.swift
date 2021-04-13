//
//  ViewController.swift
//  CALayerProject
//
//  Created by Sergei Isaikin on 13.04.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
            imageView.layer.masksToBounds = true
            let borderColor = UIColor.white
            imageView.layer.borderColor = borderColor.cgColor
            imageView.layer.borderWidth = 10
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.shadowOpacity = 1
            button.layer.shadowRadius = 5
            let shadowColor = UIColor.black
            button.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

