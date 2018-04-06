
import Foundation
import UIKit
import AVKit


let appDelegate = UIApplication.shared.delegate as! AppDelegate


func getVersion() -> String {
    guard let nsObject: Any = Bundle.main.infoDictionary?["CFBundleShortVersionString"]  else {
        return ""
    }
    return nsObject as! String
}


func AlertShowWithOK(_ title : String, message : String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
    appDelegate.window?.rootViewController!.present(alert, animated: true, completion: nil)
}


func setDeviceToken(_ token : String) {
    let defaults: UserDefaults = UserDefaults.standard
    let data: Data = NSKeyedArchiver.archivedData(withRootObject: token)
    defaults.set(data, forKey: "deviceToken")
    defaults.synchronize()
}
func removeDeviceToken() {
    let defaults: UserDefaults = UserDefaults.standard
    defaults.removeObject(forKey: "deviceToken")
    defaults.synchronize()
}
func getDeviceToken() -> String {
    let defaults: UserDefaults = UserDefaults.standard
    let data = defaults.object(forKey: "deviceToken") as? Data
    if data != nil {
        if let str = NSKeyedUnarchiver.unarchiveObject(with: data!) as? String {
            return str
        }
        else {
            return "11"
        }
    }
    return "11"
}



func topMostController() -> UIViewController
{
    var top = UIApplication.shared.keyWindow?.rootViewController
    while ((top?.presentedViewController) != nil)
    {
        top = top?.presentedViewController
    }
    return top!
}



func verifyUrl(urlString: String?) -> Bool {
    guard let urlString = urlString,
        let url = URL(string: urlString) else {
            return false
    }
    
    return UIApplication.shared.canOpenURL(url)
}


func videoSnapshot(videourl: URL) -> UIImage? {
    
    
    let asset = AVURLAsset(url: videourl)
    let generator = AVAssetImageGenerator(asset: asset)
    generator.appliesPreferredTrackTransform = true
    
    let timestamp = CMTime(seconds: 1, preferredTimescale: 60)
    
    do {
        let imageRef = try generator.copyCGImage(at: timestamp, actualTime: nil)
        return UIImage(cgImage: imageRef)
    }
    catch let error as NSError
    {
        print("Image generation failed with error \(error)")
        return UIImage(named: "")
    }
}
