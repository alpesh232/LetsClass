
import UIKit
import Foundation


public extension UITextField {
    public func errorMessageView() -> LNErrorMessageView? {
        return (self.rightView is LNErrorMessageView) ? (self.rightView as! LNErrorMessageView) : nil
    }
    
    public func setupErrorMessageView() {
        self.rightView = LNErrorMessageView.errorMessageView()
    }
    public func setupErrorMessageViewWithImage(_ img : UIImage) {
        self.rightView = LNErrorMessageView.errorMessageView(img)
    }
    
    public func setupErrorMessageViewWithView(_ errorMessageView: LNErrorMessageView) {
        self.rightView = errorMessageView
    }
    
    public func showError() {
        self.rightViewMode = .always
    }
    
    public func hideError() {
        self.rightViewMode = .never
    }
}
open class LNErrorMessageView : UIImageView {
    open class func errorMessageView() -> LNErrorMessageView {
        let errorIconView: LNErrorMessageView = LNErrorMessageView()
        let bundle : Bundle = Bundle(for: LNErrorMessageView.self)
        let url: URL = (bundle.url(forResource: "LetsPod", withExtension: "bundle")! as NSURL) as URL
        let imageBundle: Bundle = Bundle(url: url as URL)!
        var errorIconImage: UIImage = UIImage(contentsOfFile: imageBundle.path(forResource: "errorIcon", ofType: "png")!)!
        errorIconImage = errorIconImage.withRenderingMode(.alwaysTemplate)
        errorIconView.image = errorIconImage
        return errorIconView
    }
    open class func errorMessageView(_ img : UIImage) -> LNErrorMessageView {
        let errorIconView: LNErrorMessageView = LNErrorMessageView(image:img )
        return errorIconView
    }
}
