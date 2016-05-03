//
//  ViewController.swift
//  AEConicalGradient
//
//  Created by Marko Tadic on 11/8/15.
//  Copyright © 2015 AE. All rights reserved.
//

import UIKit
import AEConicalGradient

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let vividColors = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.cyanColor(), UIColor.yellowColor(), UIColor.magentaColor(), UIColor.orangeColor(), UIColor.purpleColor(), UIColor.brownColor()]
    let grayscaleColors = [UIColor.whiteColor(), UIColor.lightGrayColor(), UIColor.grayColor(), UIColor.darkGrayColor(), UIColor.blackColor()]
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = AEConicalGradientView()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        if let gradientView = view as? AEConicalGradientView {
            if UIDevice.currentDevice().orientation.isLandscape {
                gradientView.gradientLayer.colors = randomSelectionFromColors(grayscaleColors)
            } else {
                gradientView.gradientLayer.colors = randomSelectionFromColors(vividColors)
            }
        }
    }
    
    // MARK: - Helpers
    
    func randomSelectionFromColors(sourceColors: [UIColor]) -> [UIColor] {
        let randomCount = Int.random(2, max: sourceColors.count)
        var colors = [UIColor]()
        for _ in 0 ..< randomCount {
            let randomIndex = Int.random(0, max: sourceColors.count - 1)
            colors.append(sourceColors[randomIndex])
        }
        return colors
    }

}

// MARK: - Random

extension Int {
    static func random(min: Int = 0, max: Int = Int.max) -> Int {
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
}
