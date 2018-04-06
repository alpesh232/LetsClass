

import Foundation

// MARK: - Int Extension -
public extension Int {
    var toBinaryString: String {
        return String(self, radix: 2)
    }
    var toHexaString: String {
        return String(self, radix: 16)
    }
    public var string : String {
        return String(self)
    }
    public var day: (Int, Calendar.Component) {
        return (self, Calendar.Component.day)
    }
    public var month: (Int, Calendar.Component) {
        return (self, Calendar.Component.month)
    }
    public var year: (Int, Calendar.Component) {
        return (self, Calendar.Component.year)
    }
    public var minute: (Int, Calendar.Component) {
        return (self, Calendar.Component.minute)
    }
    public var hour: (Int, Calendar.Component) {
        return (self, Calendar.Component.hour)
    }
    public var second: (Int, Calendar.Component) {
        return (self, Calendar.Component.second)
    }
    public var nanosecond: (Int, Calendar.Component) {
        return (self, Calendar.Component.nanosecond)
    }
    public var weekofyear: (Int, Calendar.Component) {
        return (self, Calendar.Component.weekOfYear)
    }
    public var era: (Int, Calendar.Component) {
        return (self, Calendar.Component.era)
    }
    public var weekday: (Int, Calendar.Component) {
        return (self, Calendar.Component.weekday)
    }
    public var weekdayordinal: (Int, Calendar.Component) {
        return (self, Calendar.Component.weekdayOrdinal)
    }
    public var quarter: (Int, Calendar.Component) {
        return (self, Calendar.Component.quarter)
    }
    public var weekofmonth: (Int, Calendar.Component) {
        return (self, Calendar.Component.weekOfMonth)
    }
}
