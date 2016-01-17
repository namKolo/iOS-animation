//
//  ViewFlip.swift
//  animation
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//

import Foundation
import UIKit

class ViewFlipController: UIViewController {
  let container = UIView()
  let calendarView = UIView()
  var months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  var indexMonth = 0
  let monthLabel = UILabel()
  
  @IBAction func animateView(sender: AnyObject) {
    var views : (frontView: UIView, backView: UIView)
    indexMonth = indexMonth + 1
    monthLabel.text = "\(months[indexMonth])"
    monthLabel.sizeToFit()
    monthLabel.frame = CGRect(x: calendarView.bounds.width / 2 - monthLabel.bounds.width / 2, y: 10, width: monthLabel.frame.width, height: monthLabel.frame.height)

    views = (frontView: self.calendarView, backView: self.calendarView)
    
    
    let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
    
    UIView.transitionWithView(self.container, duration: 1.0, options: transitionOptions, animations: {
      views.frontView.removeFromSuperview()
      self.container.addSubview(views.backView)
      
      }, completion: { finished in

    })

  }
  override func viewDidLoad() {
    super.viewDidLoad()
    monthLabel.textColor = UIColor.whiteColor()
    monthLabel.text = "\(months[indexMonth])"
    monthLabel.sizeToFit()

    container.frame = CGRect(x: 60, y: 60, width: 200, height: 200)
    view.addSubview(container)

    calendarView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    calendarView.backgroundColor = UIColor(hex: 0x3F51B5, alpha: 1.0)

    
    monthLabel.frame = CGRect(x: calendarView.bounds.width / 2 - monthLabel.bounds.width / 2, y: 10, width: monthLabel.frame.width, height: monthLabel.frame.height)
    monthLabel.textAlignment = .Center
    
    calendarView.addSubview(monthLabel)
    calendarView.layer.cornerRadius = 4.0
    
    self.container.addSubview(self.calendarView)
  }
}