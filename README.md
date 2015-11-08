# AEConicalGradient

**Conical (angular) gradient in Swift**

> You'll never think about a conical gradient written in Swift until you need one. I hope that somebody will find this useful. And nice. 

**AEConicalGradient** is a [minion](http://tadija.net/public/minion.png) which consists of two objects:  

- [AEConicalGradientLayer](Source/AEConicalGradientLayer.swift)  
Subclass of `CALayer` which performs drawing of conical gradient. You can set colors and locations for the gradient. If no colors are set, default colors will be used. If no locations are set, colors will be equally distributed.  

- [AEConicalGradientView](Source/AEConicalGradientView.swift)  
Subclass of `UIView` which uses `AEConicalGradientLayer` as the view’s Core Animation layer. You can configure conical gradient options with `gradientLayer` property.

![AEAccordion](http://tadija.net/projects/AEConicalGradient/AEConicalGradient.png)

## Requirements
- Xcode 7.0+
- Swift 2.0+
- iOS 8.0+

## Installation

- Using [CocoaPods](http://cocoapods.org/):

  ```ruby
  use_frameworks!
  pod 'AEConicalGradient'
  ```

- Manually:

  Just drag *AEConicalGradientLayer.swift* and *AEConicalGradientView.swift* into your project and that's it.

## License
AEConicalGradient is released under the MIT license. See [LICENSE](LICENSE) for details.
