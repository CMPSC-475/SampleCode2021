//
//  ViewController.swift
//  We Are UIKit
//
//  Created by jjh9 on 12/2/21.
//

import UIKit

class ViewController: UIViewController {
    var cheerModel = CheerModel()
    
    @IBOutlet weak var lionImageView: UIImageView!
    
    @IBOutlet weak var weAreLabell: UILabel!
    
    @IBOutlet weak var pennStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pennStateLabel.isHidden = true
        weAreLabell.isHidden = true
    }

    @IBAction func cheer(_ sender: UIButton) {
        cheerModel.incrementCheer()
        lionImageView.image = UIImage(named: cheerModel.mascotImageName)
        weAreLabell.text = cheerModel.weAreText
        weAreLabell.isHidden  =  cheerModel.isEvenCheerCount || cheerModel.isResetting
        
        pennStateLabel.text = cheerModel.pennStateText
        pennStateLabel.isHidden = !cheerModel.isEvenCheerCount || cheerModel.isResetting
    }
    
}

