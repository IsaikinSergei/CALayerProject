//
//  SecondViewController.swift
//  CALayerProject
//
//  Created by Sergei Isaikin on 14.04.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 10
            shapeLayer.lineCap = .round
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 10
            overShapeLayer.lineCap = .round
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            let color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
            overShapeLayer.strokeColor = color
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 1, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
            gradientLayer.locations = [0.2, 0.8]
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
            imageView.layer.masksToBounds = true
//            let borderColor = UIColor.yellow
//            imageView.layer.borderColor = borderColor.cgColor
//            imageView.layer.borderWidth = 10
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
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2), radius: imageView.frame.height / 2, startAngle: self.view.frame.width / 2 - 100, endAngle: self.view.frame.width / 2, clockwise: true)
//        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
//        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
        shapeLayer.path = path.cgPath
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 20
        
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
//        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false
        
//        animation.delegate = self
        
        overShapeLayer.add(animation, forKey: nil)
    }
    
}
