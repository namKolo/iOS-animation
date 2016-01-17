//
//  ViewController.swift
//  animation
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func triggerAnimate(sender: AnyObject) {
    for _ in 0...10 {
      let size : CGFloat = CGFloat( arc4random_uniform(20)) + 10
      let delay = NSTimeInterval(900 + arc4random_uniform(200)) / 1000
      
      let yPosition : CGFloat = CGFloat( arc4random_uniform(300))+20
      
      let coloredSquare = UIView()
      coloredSquare.backgroundColor = UIColor.blueColor()
      coloredSquare.frame = CGRect(x: 0 - size, y: yPosition, width: size, height: size)
      self.view.addSubview(coloredSquare)
      
      
      UIView.animateWithDuration(0.5, delay: delay, options: [ .CurveEaseOut ], animations: {
        coloredSquare.backgroundColor = UIColor.redColor()
        coloredSquare.frame = CGRect(x: 320, y: yPosition, width: size, height: size)
        
        }, completion: { animationFinished in
          coloredSquare.removeFromSuperview()
          
      })
    }
  }
  
}

