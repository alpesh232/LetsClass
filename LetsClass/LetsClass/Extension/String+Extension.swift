

import Foundation
import UIKit

// MARK: - String Extension -
public extension String {
    public var isUsernameString : Bool{
        let invalidCharSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz._1234567890").inverted as CharacterSet
        let filtered : String = self.components(separatedBy: invalidCharSet).joined(separator: "")
        return (self == filtered)
    }
    public var isEmailString : Bool{
        let invalidCharSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz._1234567890@").inverted as CharacterSet
        let filtered : String = self.components(separatedBy: invalidCharSet).joined(separator: "")
        return (self == filtered)
    }
    public var isCharacter : Bool{
        let invalidCharSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz").inverted as CharacterSet
        let filtered : String = self.components(separatedBy: invalidCharSet).joined(separator: "")
        return (self == filtered)
    }
    
    public var isCharacterWithSpace : Bool{
        let invalidCharSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ").inverted as CharacterSet
        let filtered : String = self.components(separatedBy: invalidCharSet).joined(separator: "")
        return (self == filtered)
    }
    
    public var isNumber : Bool{
        let invalidCharSet = CharacterSet(charactersIn: "1234567890").inverted as CharacterSet
        let filtered : String = self.components(separatedBy: invalidCharSet).joined(separator: "")
        return (self == filtered)
    }
    public func widhtOfString (_ font : UIFont,height : CGFloat) -> CGFloat {
        let attributes = [NSFontAttributeName:font]
        let rect = NSString(string: self).boundingRect(
            with: CGSize(width: CGFloat.greatestFiniteMagnitude,height: height),
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: attributes, context: nil)
        return  rect.size.width
    }
    
    public func heightOfString (_ font : UIFont,width : CGFloat) -> CGFloat {
        let attributes = [NSFontAttributeName:font]
        let rect = NSString(string: self).boundingRect(
            with: CGSize(width:width ,height: CGFloat.greatestFiniteMagnitude),
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: attributes, context: nil)
        return  rect.size.height
    }
    public func millisecondToDateString(_ formate : String) -> String {
        return millisecondToDate.toString(formate)!
    }
    public var millisecondToDate : Date {
        return Date(timeIntervalSince1970: Double(self) != nil ? Double(self)!  / 1000: 0)
    }
    public func intervalToDateString(_ formate : String) -> String {
        return intervalToDate.toString(formate)!
    }
    public var intervalToDate : Date {
        return Date(timeIntervalSince1970: Double(self) != nil ? Double(self)! : 0)
    }
    public func toDate( _ format:String) -> Date? {
        let formatter:DateFormatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone =  TimeZone.ReferenceType.local
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    public var trim : String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    public var length : Int {
        return self.characters.count
    }
    public var ns: NSString {
        return self as NSString
    }
    public var pathExtension: String? {
        return ns.pathExtension
    }
    public var lastPathComponent: String? {
        return ns.lastPathComponent
    }
    
//    public func contains(_ s: String) -> Bool
//    {
//        return self.range(of: s) != nil ? true : false
//    }
    
    public func isMatch(_ regex: String, options: NSRegularExpression.Options) -> Bool
    {
        do {
            let exp = try NSRegularExpression(pattern: regex, options: options)
            let matchCount = exp.numberOfMatches(in: self, options: [], range: NSMakeRange(0, self.length))
            return matchCount > 0
        }
        catch {
            return false
        }
        
    }
    public func getMatches(_ regex: String, options: NSRegularExpression.Options) -> [NSTextCheckingResult]
    {
        do {
            let exp = try NSRegularExpression(pattern: regex, options: options)
            let matches = exp.matches(in: self, options: [], range: NSMakeRange(0, self.length))
            return matches as [NSTextCheckingResult]
        }
        catch {
            return [NSTextCheckingResult]()
        }
        
    }
}
extension String.Index{
    func successor(in string:String)->String.Index{
        return string.index(after: self)
    }
    
    func predecessor(in string:String)->String.Index{
        return string.index(before: self)
    }
    
    func advance(_ offset:Int,for string:String)->String.Index{
        return string.index(self, offsetBy: offset)
    }
}
