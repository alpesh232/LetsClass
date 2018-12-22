//
//  LetsLabel
//  LetsLabel
//
//  Created by Ketan Raval on 28/09/15.
//  Copyright (c) 2015 Ketan Raval. All rights reserved.
//

import UIKit

@IBDesignable
open class LetsLabel : UILabel {
    var topBorder: UIView?
    var bottomBorder: UIView?
    var leftBorder: UIView?
    var rightBorder: UIView?
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable open var isCircle: Bool = false {
        didSet {
            layer.cornerRadius = frame.width/2
            layer.masksToBounds = true
        }
    }
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    @IBInspectable open var fitToWidth: Bool = false {
        didSet {
            adjustsFontSizeToFitWidth = fitToWidth
        }
    }
    
    @IBInspectable open var paddingLeft: CGFloat = 0
    //@IBInspectable public var paddingRight: CGFloat = 0
    
    open override func drawText(in rect: CGRect) {
        super.drawText(in: rect)
        let newRect = rect.offsetBy(dx: paddingLeft, dy: 0) // move text 10 points to the right
        super.drawText(in: newRect)
        
    }
    @IBInspectable open var topBorderColor : UIColor = UIColor.clear
    @IBInspectable open var topBorderHeight : CGFloat = 0 {
        didSet{
            if topBorder == nil{
                topBorder = UIView()
                addSubview(topBorder!)
            }
            topBorder?.backgroundColor = topBorderColor
            topBorder?.frame = CGRect(x: 0,y: 0,width: self.frame.size.width,height: topBorderHeight)
        }
    }
    @IBInspectable open var bottomBorderColor : UIColor = UIColor.clear
    @IBInspectable open var bottomBorderHeight : CGFloat = 0 {
        didSet{
            if bottomBorder == nil{
                bottomBorder = UIView()
                addSubview(bottomBorder!)
            }
            bottomBorder?.backgroundColor = bottomBorderColor
            bottomBorder?.frame = CGRect(x: 0,y: self.frame.size.height - bottomBorderHeight,width: self.frame.size.width,height: bottomBorderHeight)
        }
    }
    @IBInspectable open var leftBorderColor : UIColor = UIColor.clear
    @IBInspectable open var leftBorderHeight : CGFloat = 0 {
        didSet{
            if leftBorder == nil{
                leftBorder = UIView()
                addSubview(leftBorder!)
            }
            leftBorder?.backgroundColor = leftBorderColor
            leftBorder?.frame = CGRect(x: 0,y: 0,width: leftBorderHeight,height: self.frame.size.height)
        }
    }
    @IBInspectable open var rightBorderColor : UIColor = UIColor.clear
    @IBInspectable open var rightBorderHeight : CGFloat = 0 {
        didSet{
            if rightBorder == nil{
                rightBorder = UIView()
                addSubview(rightBorder!)
            }
            rightBorder?.backgroundColor = rightBorderColor
            rightBorder?.frame = CGRect(x: self.frame.size.width - rightBorderHeight,y: 0,width: rightBorderHeight,height: self.frame.size.height)
        }
    }
    

}

