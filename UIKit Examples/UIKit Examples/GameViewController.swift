//
//  GameViewController.swift
//  UIKit Examples
//
//  Created by jjh9 on 12/2/21.
//

import UIKit

class GameViewController: UIViewController {

    var rectangles = [UIView]()
    var inProgressRectangle : UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let panGesture =  UIPanGestureRecognizer(target: self, action: #selector(makeRectangle(sender:)))
        self.view.addGestureRecognizer(panGesture)
    }
    
    var origin: CGPoint?
    @objc func makeRectangle(sender:UIPanGestureRecognizer) {
        let location = sender.location(in: self.view)
        
        switch sender.state {
        case .began:
            origin = location
            let frame = CGRect(origin: location, size: CGSize.zero)
            inProgressRectangle = UIView(frame: frame)
            inProgressRectangle?.layer.borderWidth = 2.0
            self.view.addSubview(inProgressRectangle!)
            
        case .changed:
            let size = location - origin!
            let frame = CGRect(origin: origin!, size: size)
            inProgressRectangle!.frame = frame.standardized
            
        case .ended:
            let newRect  = inProgressRectangle!
            newRect.backgroundColor = UIColor.randomColor
            newRect.layer.borderWidth = 0
            rectangles.append(newRect)
            let moveGesture = UIPanGestureRecognizer(target: self, action: #selector(moveRectangle(sender:)))
            newRect.addGestureRecognizer(moveGesture)
        default:
            break
        }
    }
    
    @objc func moveRectangle(sender: UIPanGestureRecognizer) {
        let theRectangle =  sender.view!
        
        switch sender.state {
        case .began:
            self.view.bringSubviewToFront(theRectangle)
        case .changed:
            let location = sender.location(in: self.view)
            theRectangle.center = location
            
        case .ended:
            
            if let containingRectangle = rectangles.first(where: { rect in
                rect != theRectangle  && rect.frame.contains(theRectangle.frame)
            }) {
                UIView.animate(withDuration: 1.0) {
                    containingRectangle.frame.expandBy(size: theRectangle.frame.size)
                    theRectangle.alpha = 0  // fade out
                } completion: { finished  in
                    theRectangle.removeFromSuperview()
                    self.rectangles.removeAll(where: {$0 == theRectangle})
                }

            }
        default:
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
