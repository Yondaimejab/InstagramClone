//
//  Data+Extension.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 21/2/21.
//

import Foundation

// MARK: - DateFormatter
extension DateFormatter {
    convenience init(withDateFormat dateFormat: String, andLocale locale: String = "es_DO") {
        self.init()
        self.dateFormat = dateFormat
        self.locale = Locale(identifier: locale)
        self.amSymbol = "AM"
        self.pmSymbol = "PM"
    }
}

// MARK: - Date
extension Date {
    enum Formatters {
        // UI formatters
        static let short = DateFormatter(withDateFormat: "dd/MM/yyyy") // 17/12/2018
        static let medium = DateFormatter(withDateFormat: "dd/MM/yyyy '-' hh:mm:ss a") // 29/10/2018 - 06:50:47 AM
        static let time = DateFormatter(withDateFormat: "hh:mm a") // 04:59 PM
        static let shortMonthYear = DateFormatter(withDateFormat: "MM/yy") // 31/12
        static let shortYearMonth = DateFormatter(withDateFormat: "y/MM") // 2019/02
        static let fullDate = DateFormatter(withDateFormat: "y-MM-dd HH:mm:ss") // 2019-02-25 10:37:37
        static let sixDigitsDate = DateFormatter(withDateFormat: "yyyyMM") //201808

        static let mediumTime = DateFormatter(withDateFormat: "HH:mm:ss") // 13:00:31
        static let imperialMediumDate = DateFormatter(withDateFormat: "MM/dd/YYYY") // 08/01/2019
    }

    var short: String {
        return Formatters.short.string(from: self)
    }

    var medium: String {
        return Formatters.medium.string(from: self)
    }

    var time: String {
        return Formatters.time.string(from: self)
    }

    var mediumTime: String {
        return Formatters.mediumTime.string(from: self)
    }

    var shortMonthYear: String {
        return Formatters.shortMonthYear.string(from: self)
    }

    var imperialMediumDate: String {
        return Formatters.imperialMediumDate.string(from: self)
    }
}
