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
    @IBOutlet weak var conicalGradientView: ConicalGradientView!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: - Properties
    
    let vividColors: [UIColor] = [.red, .green, .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown]
    let grayscaleColors: [UIColor] = [.white, .lightGray, .gray, .darkGray, .black]
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapAction(self)
        conicalGradientView.gradient.displayIfNeeded()
    }
    
    // MARK: - Actions
    
    @IBAction func tapAction(_ sender: Any) {
        if UIDevice.current.orientation.isLandscape {
            conicalGradientView.gradient.colors = randomSelection(from: grayscaleColors)
        } else {
            conicalGradientView.gradient.colors = randomSelection(from: vividColors)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        tapAction(self)
    }
    
    // MARK: - Helpers
    
    func randomSelection(from colors: [UIColor]) -> [UIColor] {
        let randomCount = Int.random(min: 2, max: colors.count)
        var selectedColors = [UIColor]()
        for _ in 0 ..< randomCount {
            let randomIndex = Int.random(min: 0, max: colors.count - 1)
            selectedColors.append(colors[randomIndex])
        }
        // Make start and end color equal.
        selectedColors.append(selectedColors[0])
        return selectedColors
    }

}

// MARK: - Random

extension Int {
    static func random(min: Int = 0, max: Int = Int.max) -> Int {
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
}
