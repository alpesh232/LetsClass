

import Foundation
import UIKit

public extension UIScreen {
    
    public class var size: CGSize {
        return UIScreen.main.bounds.size
    }
    
    public class var width: CGFloat {
        return size.width
    }
    
    public class var height: CGFloat {
        return size.height
    }
}
