//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Elle Ti on 2017-08-31.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    enum buttonTags:String {
        case Oreos = "Oreos"
        case PizzaPockets = "Pizza Pockets"
        case PopTarts = "Pop Tarts"
        case Popsicle = "Popsicle"
        case Ramen = "Ramen"
    }
    
    //MARK: - Outlets
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var stackView = UIStackView()
    var addSnackArray: [String] = []
    var snackStack = [#imageLiteral(resourceName: "oreos"),
                      #imageLiteral(resourceName: "pizza_pockets"),
                      #imageLiteral(resourceName: "pop_tarts"),
                      #imageLiteral(resourceName: "popsicle"),
                      #imageLiteral(resourceName: "ramen")]
    
    let snackLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        horizonalStackView()
        titleLabel()
        stackView.isHidden = true
        
    }
    
    //MARK: - Navigation Controller Stuff
    func navBarAutoLayoutConstraints() {
        
        UIView.animate(withDuration: 1.25,
                        delay: 0,
                        usingSpringWithDamping: 0.3,
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
                self.snackLabel.text = "SNACKS"
                isOpen = false
            }
            else if (self.plusButton.transform == CGAffineTransform(rotationAngle: 0))
            {
                self.plusButton.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/4)
                self.snackLabel.text = "Add a snack"
                isOpen = true
            }
        })
        
        stackView.isHidden = !isOpen
//        stackView.isHidden = (isOpen == false) // Alternate way to hide stackView
    }


    @IBAction func addButton(_ sender: UIButton) {
        navBarAutoLayoutConstraints()
        plusButtonRotation()
    }
    
    func titleLabel()
    {
        snackLabel.text = "SNACKS"
        snackLabel.textAlignment = .center
        self.navBarView.addSubview(snackLabel)
        
        snackLabel.translatesAutoresizingMaskIntoConstraints = false
        
        snackLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        
        let labelConstraint = NSLayoutConstraint(item: snackLabel,
                                                 attribute: .centerY,
                                                 relatedBy: .equal,
                                                 toItem: navBarView,
                                                 attribute: .centerY,
                                                 multiplier: 1.0,
                                                 constant: 0.0)
        labelConstraint.isActive = true
    }
    
    //MARK: - Stackview
    func horizonalStackView() {
        
        snackButtons()

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        navBarView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.navBarView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.navBarView.trailingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.navBarView.bottomAnchor, constant: 0).isActive = true
    }
    
    //MARK: - TableView Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return addSnackArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = addSnackArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - Add Snacks
    func snackButtons()
    {
        for snack in snackStack
        {
            let snackButton = UIButton()
            snackButton.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(snackButton)
            
            snackButton.heightAnchor.constraint(equalTo: snackButton.widthAnchor).isActive = true
           // snackButton.widthAnchor.constraint(equalToConstant: self.navBarView.frame.size.width).isActive = true
            
            snackButton.setImage(snack, for: .normal)
            snackButton.tag = snackStack.index(of: snack)!
            snackButton.addTarget(self, action: #selector(addSnackToList(sender:)), for: .touchUpInside)
        }
    }
    
    func addSnackToList(sender: UIButton)
    {
        switch sender.tag {
        case buttonTags.Oreos.hashValue:
            addSnackArray.append(buttonTags.Oreos.rawValue)
            break
        case buttonTags.PizzaPockets.hashValue:
            addSnackArray.append(buttonTags.PizzaPockets.rawValue)
            break
        case buttonTags.PopTarts.hashValue:
            addSnackArray.append(buttonTags.PopTarts.rawValue)
            break
        case buttonTags.Popsicle.hashValue:
            addSnackArray.append(buttonTags.Popsicle.rawValue)
            break
        case buttonTags.Ramen.hashValue:
            addSnackArray.append(buttonTags.Ramen.rawValue)
            break
        default:
            break
        }
        tableView.reloadData()
    }
}


