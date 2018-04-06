

import Foundation

public func checkInternet() ->Bool
{
    let status = LetsReach().connectionStatus()
    switch status {
    case .unknown, .offline:
        return false
    case .online(.wwan), .online(.wiFi):
        return true
    }
    
}

/*
public func jsonStringConvert(_ obj : AnyObject) -> String {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: obj, options: JSONSerialization.WritingOptions.prettyPrinted)
        return  String(data: jsonData, encoding: String.Encoding.utf8)! as String
        
    } catch {
        return ""
    }
}
*/ 

public func alertShow(_ controller : UIViewController, title : String = "", message : String = "",okStr : String = "",cancelStr : String = "", okClick : (() -> ())? = nil ) {
    let alert=UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert);
    if okStr.length > 0 {
        alert.addAction(UIAlertAction(title: okStr, style: UIAlertActionStyle.default, handler: {(action:UIAlertAction) in
            if let block = okClick {
                block()
            }
        }));
    }
    alert.addAction(UIAlertAction(title: cancelStr.length > 0 ?  cancelStr : "Cancel", style: UIAlertActionStyle.cancel, handler: nil));
    controller.present(alert, animated: true, completion: nil);
}
//MARK: Validation Function

public func isEmptyString(_ text : String) -> Bool
{
    if text.trim == "" || text.trim.isEmpty
    {
        return true
    }
    else
    {
        return false
    }
    
}
public func validateEmailWithString(_ Email: String) -> Bool {
    do {
        let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .caseInsensitive)
        return !(regex.firstMatch(in: Email, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, Email.characters.count)) != nil)
    } catch {
        return true
    }
}
public func validePassword(_ text : String) ->Bool
{
    if text.length < 6 || text.length > 16
    {
        return true
    }
    else
    {
        return false
    }
}

public func validePhoneNumber(_ text : String)->Bool
{
    if text.length < 8 || text.length > 15
    {
        return true
    }
    else
    {
        return false
    }
}

func valideCardNumber(_ text : NSString)->Bool
{
    if text.length < 16 || text.length > 20
    {
        return true
    }
    else
    {
        return false
    }
}
