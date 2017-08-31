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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func autoLayoutConstraints() {
        
        UIView .animate(withDuration: 2.0,
                        delay: 0,
                        usingSpringWithDamping: 0.4,
                        initialSpringVelocity: 0,
                        options: .beginFromCurrentState,
                        animations: { 
                            self.heightConstraint.constant = 200
                            self.view.layoutIfNeeded()
        },
                        completion: nil)
    }


    @IBAction func addButton(_ sender: UIButton) {
        autoLayoutConstraints()
    }
}

