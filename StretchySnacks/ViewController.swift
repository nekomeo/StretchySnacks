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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func autoLayoutConstraints() {
        UIView .animate(withDuration: 0.5, animations: {
            self.navBarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
        })
    }


    @IBAction func addButton(_ sender: UIButton) {
        print("Print icon pressed")
        autoLayoutConstraints()
    }
}

