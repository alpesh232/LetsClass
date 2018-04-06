
import Foundation
import UIKit
public extension Array {
    public func indexOfObject<T: Equatable>(_ array: Array<T>, object: T) -> Int? {
        var i: Int
        for i in 0..<array.count {
            if (array[i] == object) {
                return i
            }
        }
        return nil
    }
    
}
public extension Array where Element : Equatable {
    public var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
    public func uniq() -> [Element] {
        var arrayCopy = self
        arrayCopy.uniqInPlace()
        return arrayCopy
    }
    public func containsCount<T>(_ obj: T) -> Int where T : Equatable {
        return self.filter({$0 as? T == obj}).count
    }
    mutating public func uniqInPlace() {
        var seen = [Element]()
        var index = 0
        for element in self {
            if seen.contains(element) {
                remove(at: index)
            } else {
                seen.append(element)
                index+=1
            }
        }
    }
}
public extension Sequence where Self.Iterator.Element: Hashable {
    public func freq() -> [Self.Iterator.Element: Int] {
        return reduce([:]) { (accu: [Self.Iterator.Element: Int], element) in
            var accu = accu
            
            //FIXME: secusser
            accu[element] = accu[element] ?? 1
            return accu
        }
    }
}
public extension Sequence where Self.Iterator.Element: Equatable {
    public func freqTuple() -> [(Self.Iterator.Element, Int)] {
        
        let empty: [(Self.Iterator.Element, Int)] = []
        
        return reduce(empty) { (accu: [(Self.Iterator.Element, Int)], element) in
            var accu = accu
            for (index, value) in accu.enumerated() {
                if value.0 == element {
                    accu[index].1 += 1
                    return accu
                }
            }
            
            return accu + [(element, 1)]
        }
    }
}
