/**
 *  https://github.com/tadija/AEConicalGradient
 *  Copyright (c) Marko Tadić 2015-2018
 *  Licensed under the MIT license. See LICENSE file.
 */

import UIKit
import AEConicalGradient

final class ViewController: UIViewController {

    // MARK: Properties

    let vividColors: [UIColor] = [.red, .green, .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown]
    let grayscaleColors: [UIColor] = [.white, .lightGray, .gray, .darkGray, .black]

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = ConicalGradientView()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(updateColors))
        view.addGestureRecognizer(tapGesture)
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateColors()
    }

    // MARK: Helpers

    @objc
    private func updateColors() {
        if let view = view as? ConicalGradientView {
            if UIDevice.current.orientation.isLandscape {
                view.gradient.colors = randomSelection(from: grayscaleColors)
            } else {
                view.gradient.colors = randomSelection(from: vividColors)
            }
        }
    }

    private func randomSelection(from colors: [UIColor]) -> [UIColor] {
        let randomCount = Int.random(in: 2...colors.count)
        var selectedColors = [UIColor]()
        for _ in 0 ..< randomCount {
            let randomIndex = Int.random(in: 0..<colors.count)
            selectedColors.append(colors[randomIndex])
        }
        return selectedColors
    }

}
