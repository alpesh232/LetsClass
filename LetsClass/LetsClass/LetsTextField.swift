//
//  LetsTextField.swift
//  LetsTextField
//
//  Created by Ketan Raval on 28/09/15.
//  Copyright (c) 2015 Ketan Raval. All rights reserved.
//

import UIKit
@IBDesignable
open  class LetsTextField : UITextField {
    
    var topBorder: UIView?
    var bottomBorder: UIView?
    var leftBorder: UIView?
    var rightBorder: UIView?
    var leftimageview : UIImageView?
    var rightimageview : UIImageView?
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBInspectable open var rightImage : UIImage? {
        didSet {
            if rightImage != nil {
                let width = rightviewWidth > rightImage!.size.width + 10 ? rightviewWidth :  rightImage!.size.width + 10
                rightViewMode = UITextFieldViewMode.always
                rightimageview = UIImageView()
                rightimageview!.frame=CGRect(x: self.frame.size.width - width,y: self.frame.origin.y+2,width: width,height: self.frame.size.height-4)
                rightimageview!.image = rightImage
                rightView = rightimageview
                self.rightViewMode = .always
                rightimageview!.contentMode = .center
            }
        }
    }
    @IBInspectable open var rightviewWidth : CGFloat = 0 {
        didSet{
            if rightimageview != nil{
                let width = rightviewWidth > rightImage!.size.width + 10 ? rightviewWidth :  rightImage!.size.width + 10
                rightimageview!.frame=CGRect(x: self.frame.origin.x+5,y: self.frame.origin.y+2,width: width, height: self.frame.size.height-4)
            }
        }
    }
    
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable open var placeHolderColor : UIColor = UIColor.lightGray{
        didSet {
            setValue(placeHolderColor, forKeyPath: "_placeholderLabel.textColor")
        }
    }
    
    @IBInspectable open var leftImage : UIImage? {
        didSet {
            if leftImage != nil {
                let width = leftviewWidth > leftImage!.size.width + 10 ? leftviewWidth :  leftImage!.size.width + 10
                leftViewMode = UITextFieldViewMode.always
                leftimageview = UIImageView();
                leftimageview!.frame = CGRect(x: self.frame.origin.x+10,y: self.frame.origin.y+2,width: width,height: self.frame.size.height-4)
                leftimageview!.image = leftImage;
                leftView = leftimageview;
                self.leftViewMode = .always
                leftimageview!.contentMode = .center
            }
            
        }
    }
    @IBInspectable open var leftviewWidth : CGFloat = 0 {
        didSet{
            if leftimageview != nil{
                let width = leftviewWidth > leftImage!.size.width + 10 ? leftviewWidth :  leftImage!.size.width + 10
                leftimageview!.frame = CGRect(x: self.frame.origin.x+10,y: self.frame.origin.y+2,width: width,height: self.frame.size.height-4)
            }
        }
    }
    @IBInspectable open var paddingLeft: CGFloat = 0
    @IBInspectable open var paddingRight: CGFloat = 0
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        super.textRect(forBounds: bounds)
        return CGRect(x: bounds.origin.x + paddingLeft,y: bounds.origin.y,
                      width: bounds.size.width - paddingLeft - paddingRight,height: bounds.size.height);
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        super.editingRect(forBounds: bounds)
        return textRect(forBounds: bounds)
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
    @IBInspectable open var bottomBorderColor : UIColor = UIColor.clear {
        didSet {
            bottomBorder?.backgroundColor = bottomBorderColor
        }
    }
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
    open override func layoutSubviews() {
        super.layoutSubviews()
        bottomBorder?.frame = CGRect(x: 0,y: self.frame.size.height - bottomBorderHeight,width: self.frame.size.width,height: bottomBorderHeight)
    }
}
