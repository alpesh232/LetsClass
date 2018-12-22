/*!
 //  LetsView.swift
 //  LetsView
 //
 //  Created by Ketan Raval on 07/10/15.
 //  Copyright © 2015 Ketan Raval. All rights reserved.
 */

import UIKit
@IBDesignable
/*!
 UIView Designable class
 */
open class LetsView : UIImageView {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    /*!
     Variable Define
     */
    var bottomBorder: UIView?
    /*!
     View border color Object
     */
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
            layer.masksToBounds = true
        }
    }
    /*!
     View border width Object
     */
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = true
        }
    }
    
    /*!
     *   @brief View corner radius Object
     */
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    /*!
        View shadow radius Object
     */
    
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
    
    @IBInspectable open var bottomBorderColor : UIColor = UIColor.clear {
        didSet {
            bottomBorder?.backgroundColor = bottomBorderColor
        }
    }
    /*!
     View bottom border height Object
     */
    @IBInspectable open var bottomBorderHeight : CGFloat = 0 {
        didSet{
            if bottomBorderHeight > 0 {
                if bottomBorder == nil{
                    bottomBorder = UIView()
                    addSubview(bottomBorder!)
                }
                bottomBorder?.backgroundColor = bottomBorderColor
                bottomBorder?.frame = CGRect(x: 0,y: self.frame.size.height - bottomBorderHeight,width: self.frame.size.width,height: bottomBorderHeight)
            }
            else {
                bottomBorder?.removeFromSuperview()
                bottomBorder = nil
            }
            
        }
    }
    /*!
     View's super method layoutSubviews()
     */
    open override func layoutSubviews() {
        super.layoutSubviews()
        if bottomBorder != nil{
            bottomBorder?.frame = CGRect(x: 0,y: self.frame.height - bottomBorderHeight,width: self.frame.size.width,height: bottomBorderHeight)
        }
    }
    
    
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            updateView()
        }
    }
    
    override open class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map {$0.cgColor}
        if (isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
    }
}
