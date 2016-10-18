//
// AEConicalGradientView
//
// Copyright © 2015-2016 Marko Tadić <tadija@me.com> http://tadija.net
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
    Conical gradient view is simple subclass of UIView 
    which uses `AEConicalGradientLayer` as the view’s Core Animation layer.
    
    You can configure conical gradient options with `gradientLayer` property.
*/
open class AEConicalGradientView: UIView {
    
    // MARK: - Properties
    
    /// The view’s conical gradient layer used for rendering. (read-only)
    open var gradientLayer: AEConicalGradientLayer { return layer as! AEConicalGradientLayer }
    
    // MARK: - Lifecycle
    
    /**
        The class used to create the view’s Core Animation layer.
     
        - returns: AEConicalGradientLayer Class
    */
    open override class var layerClass : AnyClass {
        return AEConicalGradientLayer.self
    }
    
    /**
        Initializes and returns a newly allocated conical gradient view object with the specified frame rectangle.
     
        - parameter frame: The frame rectangle for the view, measured in points.
     
        - returns: An initialized conical gradient view object.
    */
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    /**
        Returns an object initialized from data in a given unarchiver.
     
        - parameter decoder: An unarchiver object.
     
        - returns: self, initialized using the data in decoder.
    */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        layer.contentsScale = UIScreen.main.scale
        layer.drawsAsynchronously = true
        layer.needsDisplayOnBoundsChange = true
        layer.setNeedsDisplay()
    }
    
}
