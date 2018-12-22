//
//  LetsImageView.swift
//  LetsImageView
//
//  Created by Ketan Raval on 07/10/15.
//  Copyright © 2015 Ketan Raval. All rights reserved.
//

import UIKit
@IBDesignable
open class LetsImageView : UIImageView {
    var topBorder: UIView?
    var bottomBorder: UIView?
    var leftBorder: UIView?
    var rightBorder: UIView?
    fileprivate var _round = false
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBInspectable open var round: Bool {
        set {
            _round = newValue
            makeRound()
        }
        get {
            return self._round
        }
    }
    fileprivate func makeRound() {
        if self.round == true {
            self.clipsToBounds = true
            self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
        } else {
            self.layer.cornerRadius = 0
        }
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
    
    
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    
    @IBInspectable open var shadowRadius: CGFloat = 5.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    /*!
     *   @brief View Shedow Greadient Object
     */
    @IBInspectable open var shedowGreadient: Float = 1.0 {
        didSet {
            layer.masksToBounds = false
            layer.shadowOffset = CGSize(width: -0.5, height: 0.5)
            layer.shadowOpacity = shedowGreadient
        }
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
            bottomBorder?.frame = CGRect(x:0,y: self.frame.size.height - bottomBorderHeight,width: self.frame.size.width,height: bottomBorderHeight)
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
    open override func layoutSubviews() {
        super.layoutSubviews()
        makeRound()
    }
}
