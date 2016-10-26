# AEConicalGradient
**Conical (angular) gradient in Swift**

[![Language Swift 3.0](https://img.shields.io/badge/Language-Swift%203.0-orange.svg?style=flat)](https://swift.org)
[![Platforms iOS](https://img.shields.io/badge/Platforms-iOS-lightgray.svg?style=flat)](http://www.apple.com)
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat)](https://github.com/tadija/AEConicalGradient/blob/master/LICENSE)

[![CocoaPods Version](https://img.shields.io/cocoapods/v/AEConicalGradient.svg?style=flat)](https://cocoapods.org/pods/AEConicalGradient)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

> I hope that somebody will find this useful. And nice. 

![AEConicalGradient](http://tadija.net/projects/AEConicalGradient/AEConicalGradient.png)

## Usage

**AEConicalGradient** is a [minion](http://tadija.net/public/minion.png) which consists of two objects:  

- [ConicalGradientLayer](Sources/ConicalGradientLayer.swift)  
Subclass of `CALayer` which performs drawing of conical gradient. You can set colors, locations, start/end angle for the gradient. 
If no colors are set, default colors will be used. If no locations are set, colors will be equally distributed.  

- [ConicalGradientView](Sources/ConicalGradientView.swift)  
Subclass of `UIView` which uses `ConicalGradientLayer` as the view’s Core Animation layer. 
You can configure conical gradient options with `gradient` property.

## Requirements
- Xcode 8.0+
- iOS 8.0+

## Installation

- [Swift Package Manager](https://swift.org/package-manager/):

    ```
    .Package(url: "https://github.com/tadija/AEConicalGradient.git", majorVersion: 2)
    ```

- [Carthage](https://github.com/Carthage/Carthage):

    ```ogdl
    github "tadija/AEConicalGradient"
    ```

- [CocoaPods](http://cocoapods.org/):

    ```ruby
    pod 'AEConicalGradient'
    ```

## License
AEConicalGradient is released under the MIT license. See [LICENSE](LICENSE) for details.
