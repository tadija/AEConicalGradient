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
    
    let vividColors: [UIColor] = [.red, .green, .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown]
    let grayscaleColors: [UIColor] = [.white, .lightGray, .gray, .darkGray, .black]
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = AEConicalGradient.View()
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if let view = view as? AEConicalGradient.View {
            if UIDevice.current.orientation.isLandscape {
                view.gradient.colors = randomSelection(from: grayscaleColors)
            } else {
                view.gradient.colors = randomSelection(from: vividColors)
            }
        }
    }
    
    // MARK: - Helpers
    
    func randomSelection(from colors: [UIColor]) -> [UIColor] {
        let randomCount = Int.random(min: 2, max: colors.count)
        var selectedColors = [UIColor]()
        for _ in 0 ..< randomCount {
            let randomIndex = Int.random(min: 0, max: colors.count - 1)
            selectedColors.append(colors[randomIndex])
        }
        return selectedColors
    }

}

// MARK: - Random

extension Int {
    static func random(min: Int = 0, max: Int = Int.max) -> Int {
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
}
