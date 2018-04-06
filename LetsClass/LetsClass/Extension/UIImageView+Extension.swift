

import Foundation
import UIKit

public extension UIImageView {
    /**
     Creates a new image from a URL with optional caching. If cached, the cached image is returned. Otherwise, a place holder is used until the image from web is returned by the closure.
     
     - Parameter url: The image URL.
     - Parameter placeholder: The placeholder image.
     - Parameter shouldCacheImage: Weather or not we should cache the NSURL response (default: true)
     - Parameter closure: Returns the image from the web the first time is fetched.
     
     - Returns A new image
     */
    public func imageFromURL(_ url: String, placeholder: UIImage? = nil, shouldCacheImage: Bool = true, closure: ((_ image: UIImage?) -> ())? = nil ) -> UIImage?
    {
        if shouldCacheImage {
            if sharedCache.object(forKey: url as AnyObject) != nil {
                self.image = sharedCache.object(forKey: url as AnyObject) as! UIImage!
                if let closure = closure {
                    closure(self.image)
                }
                return self.image
            }
        }
        return placeholder
    }
    
}
