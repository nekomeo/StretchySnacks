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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
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
        UIView.animate(withDuration: 0.4, animations: {
            if (self.plusButton.transform == CGAffineTransform(rotationAngle: -CGFloat.pi/4))
            {
                self.plusButton.transform = CGAffineTransform(rotationAngle: 0)
            }
            else if (self.plusButton.transform == CGAffineTransform(rotationAngle: 0))
            {
                self.plusButton.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/4)
            }
        })
    }


    @IBAction func addButton(_ sender: UIButton) {
        navBarAutoLayoutConstraints()
        plusButtonRotation()
    }
}

