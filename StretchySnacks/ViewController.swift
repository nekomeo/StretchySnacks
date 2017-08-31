//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Elle Ti on 2017-08-31.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var plusButton: UIButton!
    
    var stackView: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        horizonalStackView()
        stackView.isHidden = true
    }
    
    //MARK: Navigation Controller
    func navBarAutoLayoutConstraints() {
        
        UIView.animate(withDuration: 1.25,
                        delay: 0,
                        usingSpringWithDamping: 0.4,
                        initialSpringVelocity: 0,
                        options: .beginFromCurrentState,
                        animations: {
                            switch self.heightConstraint.constant {
                            case 200:
                                self.heightConstraint.constant = 64
                                
                                break
                            case 64:
                                self.heightConstraint.constant = 200
                                
                                break
                            default:
                                break
                            }
                            self.view.layoutIfNeeded()
        },
                        completion: nil)
    }
    
    func plusButtonRotation()
    {
        var isOpen = Bool()
        UIView.animate(withDuration: 0.4, animations: {
            if (self.plusButton.transform == CGAffineTransform(rotationAngle: -CGFloat.pi/4))
            {
                self.plusButton.transform = CGAffineTransform(rotationAngle: 0)
                isOpen = false
            }
            else if (self.plusButton.transform == CGAffineTransform(rotationAngle: 0))
            {
                self.plusButton.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/4)
                isOpen = true
            }
        })
        
        if isOpen {
            stackView.isHidden = false
        } else {
            stackView.isHidden = true
        }
    }


    @IBAction func addButton(_ sender: UIButton) {
        navBarAutoLayoutConstraints()
        plusButtonRotation()
    }
    
    //MARK: - Stackview
    func horizonalStackView() {
        let oreoView = UIImageView(image: #imageLiteral(resourceName: "oreos"))
        let pizzaView = UIImageView(image: #imageLiteral(resourceName: "pizza_pockets"))
        let poptartView = UIImageView(image: #imageLiteral(resourceName: "pop_tarts"))
        let popsicleView = UIImageView(image: #imageLiteral(resourceName: "popsicle"))
        let ramenView = UIImageView(image: #imageLiteral(resourceName: "ramen"))
        
        // set an aspect ratio
        let oreoAspectRatio = NSLayoutConstraint(item: oreoView,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: oreoView,
                                                 attribute: .width,
                                                 multiplier: 1,
                                                 constant: 0)
        oreoView.addConstraint(oreoAspectRatio)
        
        stackView = UIStackView(arrangedSubviews: [oreoView, pizzaView, poptartView, popsicleView, ramenView])

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        navBarView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.navBarView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.navBarView.trailingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.navBarView.bottomAnchor, constant: 0).isActive = true
    }
}

