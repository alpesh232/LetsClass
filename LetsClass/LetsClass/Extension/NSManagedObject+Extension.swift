
import Foundation
import CoreData


// MARK: - NSManagedObject Extension -
public extension NSManagedObject{
    
    // Class method that transforms NSObjects from Dictionaries into NSManagedObjects. the method creates an NSObject which is then populated
    public class func createNewObject<T:NSManagedObject>(_ context: NSManagedObjectContext)-> T {
        let name = self.classForCoder().description().pathExtension!
        let newObject =  NSEntityDescription.insertNewObject(forEntityName: name, into: context) as! T
        return newObject
    }
}
