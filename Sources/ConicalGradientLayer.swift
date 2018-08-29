//
// ConicalGradientLayer.swift
//
// Copyright (c) 2015-2017 Marko Tadić <tadija@me.com> http://tadija.net
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit

/**
    Subclass of `CALayer` which draws a conical gradient over its background color,
    filling the shape of the layer (i.e. including rounded corners).
 
    You can set colors and locations for the gradient.

    If no colors are set, default colors will be used.
    If no locations are set, colors will be equally distributed.
*/
open class ConicalGradientLayer: CALayer {
    
    // MARK: - Types
    
    private struct Constants {
        static let MaxAngle: Double = 2 * .pi
        static let MaxHue = 255.0
    }
    
    private struct Transition {
        
        let fromLocation: Double
        let toLocation: Double
        
        let fromColor: UIColor
        let toColor: UIColor
        
        func color(forPercent percent: Double) -> UIColor {
            let normalizedPercent = percent.convert(fromMin: fromLocation, max: toLocation, toMin: 0.0, max: 1.0)
            return UIColor.lerp(from: fromColor.rgba, to: toColor.rgba, percent: CGFloat(normalizedPercent))
        }
        
    }
    
    // MARK: - Properties
    
    /// The array of UIColor objects defining the color of each gradient stop.
    /// Defaults to empty array. Animatable.
    open var colors = [UIColor]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The array of Double values defining the location of each gradient stop as a value in the range [0,1].
    /// The values must be monotonically increasing.
    /// If empty array is given, the stops are assumed to spread uniformly across the [0,1] range.
    /// Defaults to nil. Animatable.
    open var locations = [Double]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// Start angle in radians. Defaults to 0.0.
    open var startAngle: Double = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// End angle in radians. Defaults to 2 * M_PI.
    open var endAngle: Double = Constants.MaxAngle {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var transitions = [Transition]()
    
    // MARK: - Lifecycle
    
    /// This method is doing actual drawing of the conical gradient.
    open override func draw(in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        draw(in: ctx.boundingBoxOfClipPath)
        UIGraphicsPopContext()
    }
    
    // MARK: - Helpers
    
    private func draw(in rect: CGRect) {
        loadTransitions()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let longerSide = max(rect.width, rect.height)
        let radius = Double(longerSide) * 2.squareRoot()
        let step = (.pi / 2) / radius
        var angle = startAngle
        
        while angle <= endAngle {
            let pointX = radius * cos(angle) + Double(center.x)
            let pointY = radius * sin(angle) + Double(center.y)
            let startPoint = CGPoint(x: pointX, y: pointY)
            
            let line = UIBezierPath()
            line.move(to: startPoint)
            line.addLine(to: center)
            
            color(forAngle: angle).setStroke()
            line.stroke()
            
            angle += step
        }
    }
    
    private func color(forAngle angle: Double) -> UIColor {
        let percent = angle.convert(fromMin:startAngle, max:endAngle, toMin:0.0, max:1.0)
        
        guard let transition = transition(forPercent: percent)
        else { return spectrumColor(forAngle: angle) }
        
        let transitionPercent = percent.convert(fromMin:transition.fromLocation, max:transition.toLocation, toMin:0.0, max:1.0)
        return transition.color(forPercent: transitionPercent)
    }
    
    private func spectrumColor(forAngle angle: Double) -> UIColor {
        let hue = angle.convert(fromZeroToMax: Constants.MaxAngle, toZeroToMax: Constants.MaxHue)
        return UIColor(hue: CGFloat(hue / Constants.MaxHue), saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
    
    private func loadTransitions() {
        transitions.removeAll()
        
        if colors.count > 1 {
            let transitionsCount = colors.count - 1
            let locationStep = 1.0 / Double(transitionsCount)
            
            for i in 0 ..< transitionsCount {
                let fromLocation, toLocation: Double
                let fromColor, toColor: UIColor
                
                if locations.count == colors.count {
                    fromLocation = locations[i]
                    toLocation = locations[i + 1]
                } else {
                    fromLocation = locationStep * Double(i)
                    toLocation = locationStep * Double(i + 1)
                }
                
                fromColor = colors[i]
                toColor = colors[i + 1]
                
                let transition = Transition(fromLocation: fromLocation, toLocation: toLocation,
                                            fromColor: fromColor, toColor: toColor)
                transitions.append(transition)
            }
        }
    }
    
    private func transition(forPercent percent: Double) -> Transition? {
        let filtered = transitions.filter { percent >= $0.fromLocation && percent < $0.toLocation }
        let defaultTransition = percent <= 0.5 ? transitions.first : transitions.last
        return filtered.first ?? defaultTransition
    }
    
}

// MARK: - Extensions

private extension Double {
    func convert(fromMin oldMin: Double, max oldMax: Double, toMin newMin: Double, max newMax: Double) -> Double {
        let oldRange, newRange, newValue: Double
        oldRange = (oldMax - oldMin)
        if (oldRange == 0.0) {
            newValue = newMin
        } else {
            newRange = (newMax - newMin)
            newValue = (((self - oldMin) * newRange) / oldRange) + newMin
        }
        return newValue
    }
    
    func convert(fromZeroToMax oldMax: Double, toZeroToMax newMax: Double) -> Double {
        return ((self * newMax) / oldMax)
    }
    
}

private extension UIColor {
    
    struct RGBA {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        init(color: UIColor) {
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        }
    }
    
    var rgba: RGBA {
        return RGBA(color: self)
    }
    
    class func lerp(from: UIColor.RGBA, to: UIColor.RGBA, percent: CGFloat) -> UIColor {
        let red = from.red + percent * (to.red - from.red)
        let green = from.green + percent * (to.green - from.green)
        let blue = from.blue + percent * (to.blue - from.blue)
        let alpha = from.alpha + percent * (to.alpha - from.alpha)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
