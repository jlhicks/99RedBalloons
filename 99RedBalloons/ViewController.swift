//
//  ViewController.swift
//  99RedBalloons
//
//  Created by James Hicks on 6/7/15.
//  Copyright (c) 2015 zorch!. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var balloonLabel: UILabel!
  @IBOutlet weak var balloonImage: UIImageView!
  
  var balloons:[Balloon] = []
  let maxBalloons = 99
  var currentBalloon = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    createBalloons()
    balloonLabel.text = "Balloon #\(balloons[currentBalloon].number)"
    balloonImage.image = balloons[currentBalloon].image
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func createBalloons() {
    
    for i in 0..<maxBalloons {
      var balloon = Balloon()
      balloon.number = i + 1
      balloon.image = randomImage()
      balloons.append(balloon)
    }
  }

  func randomImage() -> UIImage? {
    
    let imageNumber = Int(arc4random_uniform(UInt32(4)))
    var image = UIImage(named: "")
    
    switch imageNumber {
    case 0:
      image = UIImage(named: "RedBalloon1.jpg")
    case 1:
      image = UIImage(named: "RedBalloon2.jpg")
    case 2:
      image = UIImage(named: "RedBalloon3.jpg")
    case 3:
      image = UIImage(named: "RedBalloon4.jpg")
    default:
      image = UIImage(named: "BerlinTVTower.jpg")
    }
    
    return image
  }

  @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
    
    currentBalloon = (currentBalloon + 1) % balloons.count
    
    let balloon = balloons[currentBalloon]
    
    UIView.transitionWithView(self.view,
      duration: 2,
      options: UIViewAnimationOptions.TransitionCrossDissolve,
      animations: {
        self.balloonImage.image = balloon.image
        self.balloonLabel.text = "Balloon #\(balloon.number)"
      },
      completion: { (finished:Bool) -> () in })
  }
}

