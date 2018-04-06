
import Foundation
import UIKit

public extension NSAttributedString {
    
    public class func HTMLString(_ HTMLString: String) throws -> NSAttributedString?{
        let data = HTMLString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        let opt = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType]
        do {
            return try NSAttributedString(data: data!, options: opt, documentAttributes: nil)
        } catch  {
            NSException(name: NSExceptionName(rawValue: "Html"), reason: "Not convert", userInfo: nil).raise()
        }
        return nil
    }
    public class func attributedString(_ string: String, withFont font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(NSFontAttributeName, value: font, range: NSMakeRange(0, attributedString.length))
        return attributedString
    }
}
