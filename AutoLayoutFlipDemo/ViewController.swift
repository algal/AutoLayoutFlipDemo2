//
//  ViewController.swift
//  AutoLayoutFlipDemo
//
//  Created by Alexis Gallagher on 2014-10-21.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var viewA: UILabel!

  weak var viewB: UILabel!

  @IBAction func handleTap(sender: AnyObject) {
    
    let destinationView = UILabel(frame: self.viewA.frame)
    destinationView.font = self.viewA.font
    destinationView.text = "B"
    
    UIView.transitionFromView(self.viewA,
      toView: destinationView,
      duration: NSTimeInterval(0.6),
      options: .TransitionFlipFromLeft,
      completion: { (success:Bool) -> () in
        NSLog("self.view.subviews=%@", self.view.subviews)
        self.viewB = destinationView
        self.view.addConstraint(NSLayoutConstraint(item: destinationView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: destinationView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1, constant: 0))
      }
    )
    
    NSLog("self.view.subviews=%@", self.view.subviews)
    
  }
}

