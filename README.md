[![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://swift.org)
[![Platforms iOS](https://img.shields.io/badge/Platforms-iOS-lightgray.svg?style=flat)](http://www.apple.com)
[![CocoaPods](https://img.shields.io/cocoapods/v/AEConicalGradient.svg?style=flat)](https://cocoapods.org/pods/AEConicalGradient)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat)](LICENSE)

# AEConicalGradient
**Conical (angular) gradient in Swift**

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

`done for fun`
