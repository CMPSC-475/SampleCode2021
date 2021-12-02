//
//  ViewController.swift
//  UIKit Examples
//
//  Created by jjh9 on 11/30/21.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    var label : UILabel!
    var turkeys = [UIView]()
    
    var clearButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGestures()
        
        
        // Do any additional setup after loading the view.
        /*
        addTurkey()
        addLabel()
        addButton()
         */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addClearButton()
    }
    
    
    func addGestures() {
        let s : Selector = #selector(tapTurkey(sender:))
        let tapGesture = UITapGestureRecognizer(target: self, action: s)
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func addClearButton() {
        clearButton.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 75, height: 30))
        clearButton.center = CGPoint(x: self.view.center.x, y: self.view.bounds.height - 30)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.tintColor = .red
        clearButton.addTarget(self, action: #selector(clearTurkeys), for: .touchUpInside)
        self.view.addSubview(clearButton)
    }
    
    @objc func clearTurkeys() {
        UIView.animate(withDuration: 1.0) {
            for turkey in self.turkeys {
                turkey.center = CGPoint(x: turkey.center.x, y: self.view.bounds.height + 100)
            }
        } completion: { finished in
            for turkey in self.turkeys {
                turkey.removeFromSuperview()
            }
            self.turkeys.removeAll()
        }

        
    }
    
    @objc func tapTurkey(sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.view)
        
        let image = UIImage(named: "turkey")
        let turkeyView = UIImageView(image: image)
        turkeyView.center = location
        self.view.addSubview(turkeyView)
        turkeyView.isUserInteractionEnabled = true
        
        let moveGesture = UIPanGestureRecognizer(target: self, action: #selector(moveTurkey(sender:)))
        turkeyView.addGestureRecognizer(moveGesture)
        turkeys.append(turkeyView)
    }
    

    
    var origin : CGPoint!  
    @objc func moveTurkey(sender: UIPanGestureRecognizer) {
        let turkey = sender.view!
        let translation = sender.translation(in: self.view)
        switch sender.state {
        case .began:
            origin = turkey.center
        case .changed:
            //uses CGPoint extension
            let newCenter = origin + translation
            //CGPoint(x: origin.x + translation.x, y: origin.y + translation.y)
            turkey.center = newCenter
        default:
            break
        }
        
    }
    
    func addButton() {
        let button = UIButton(type: .system)
        button.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 75, height: 50))
        button.center = CGPoint(x: view.center.x, y: view.center.y+60)
        button.setTitle("Press Me", for: .normal)
        button.addTarget(self, action: #selector(incrementCount), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc
    func incrementCount() {
            counter += 1
        label.text = "Hello \(counter)"
        }
    
    func addLabel() {
        label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 50)))
        label.text = "Hello \(counter)"
        label.backgroundColor = .gray
        label.tintColor = .red
        label.textAlignment = .center
        self.view.addSubview(label)
        
    }
    
    func addTurkey() {
        let image = UIImage(named: "turkey")
        let turkeyView = UIImageView(image: image)
        self.view.addSubview(turkeyView)
        turkeyView.center = self.view.center
    }
    
    func addSquares() {
        for i in 0...10 {
            let frame = CGRect(x: i*20, y: i*20, width: 100, height: 100)
            let square = UIView(frame: frame)
            square.backgroundColor = UIColor.randomColor
            
            self.view.addSubview(square)
        }
    }
    
}

