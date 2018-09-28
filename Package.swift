// swift-tools-version:4.2

/**
 *  https://github.com/tadija/AEConicalGradient
 *  Copyright (c) Marko Tadić 2015-2018
 *  Licensed under the MIT license. See LICENSE file.
 */

import PackageDescription

let package = Package(
    name: "AEConicalGradient",
    products: [
        .library(name: "AEConicalGradient", targets: ["AEConicalGradient"])
    ],
    targets: [
        .target(
            name: "AEConicalGradient"
        )
    ]
)
