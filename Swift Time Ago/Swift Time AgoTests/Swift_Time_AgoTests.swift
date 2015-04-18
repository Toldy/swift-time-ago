//
//  Swift_Time_AgoTests.swift
//  Swift Time AgoTests
//
//  Created by Julien Colin on 4/17/15.
//  Copyright (c) 2015 Toldino. All rights reserved.
//

import UIKit
import XCTest
import Swift_Time_Ago

class Swift_Time_AgoTests: XCTestCase {
  var formatter = NSDateFormatter()
  var referenceDate: NSDate!

  // TODO: Tests
  
  override func setUp() {
    super.setUp()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    referenceDate = formatter.dateFromString("2015-04-17 10:00:00")!
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testDateTimesWhoseResultShouldBeJustNow() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 10:00:00")!, referenceDate: referenceDate) == "Just now")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:59:59")!, referenceDate: referenceDate) == "Just now")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:59:45")!, referenceDate: referenceDate) == "Just now")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:59:30")!, referenceDate: referenceDate) == "Just now")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:59:15")!, referenceDate: referenceDate) == "Just now")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:59:01")!, referenceDate: referenceDate) == "Just now")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:59:00")!, referenceDate: referenceDate) != "Just now")
  }

  func testDateTimesWhoseResultShouldBeMinutesAgo() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 10:00:00")!, referenceDate: referenceDate) != "0 minute ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:59:00")!, referenceDate: referenceDate) == "1 minute ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:58:30")!, referenceDate: referenceDate) == "1 minute ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:45:00")!, referenceDate: referenceDate) == "15 minutes ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:30:00")!, referenceDate: referenceDate) == "30 minutes ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:15:00")!, referenceDate: referenceDate) == "45 minutes ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:00:30")!, referenceDate: referenceDate) == "59 minutes ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:00:01")!, referenceDate: referenceDate) == "59 minutes ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:00:00")!, referenceDate: referenceDate) != "60 minutes ago")
  }
  
  func testDateTimesWhoseResultShouldBeHoursAgo() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:00:01")!, referenceDate: referenceDate) != "0 hour ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:00:00")!, referenceDate: referenceDate) == "1 hour ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 08:00:01")!, referenceDate: referenceDate) == "1 hour ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 08:00:00")!, referenceDate: referenceDate) == "2 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 04:00:00")!, referenceDate: referenceDate) == "6 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 21:00:30")!, referenceDate: referenceDate) == "12 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 15:30:00")!, referenceDate: referenceDate) == "18 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 11:00:00")!, referenceDate: referenceDate) == "23 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 10:01:00")!, referenceDate: referenceDate) == "23 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 10:00:01")!, referenceDate: referenceDate) == "23 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 10:00:00")!, referenceDate: referenceDate) != "24 hours ago")
  }
  
  func testDateTimesWhoseResultShouldBeYesterday() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 10:00:01")!, referenceDate: referenceDate) != "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 10:00:00")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 00:00:00")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 22:00:00")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 16:30:00")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 12:00:00")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 10:00:01")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 10:00:00")!, referenceDate: referenceDate) != "Yesterday")
  }
  
  func testDateTimesWhoseResultShouldBeDaysAgo() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 10:00:01")!, referenceDate: referenceDate) != "1 day ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 10:00:00")!, referenceDate: referenceDate) == "2 days ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-14 10:00:00")!, referenceDate: referenceDate) == "3 days ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-13 10:00:00")!, referenceDate: referenceDate) == "4 days ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-12 10:00:00")!, referenceDate: referenceDate) == "5 days ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-11 10:00:00")!, referenceDate: referenceDate) == "6 days ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-10 23:42:00")!, referenceDate: referenceDate) == "6 days ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-10 10:00:01")!, referenceDate: referenceDate) == "6 days ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-10 10:00:00")!, referenceDate: referenceDate) != "7 days ago")
  }
  
  func testDateTimesWhoseResultShouldBeWeeksAgo() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-10 10:00:01")!, referenceDate: referenceDate) != "0 week ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-10 10:00:00")!, referenceDate: referenceDate) == "1 week ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-03 10:00:00")!, referenceDate: referenceDate) == "2 weeks ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-03-27 10:00:42")!, referenceDate: referenceDate) == "2 weeks ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-03-27 10:00:00")!, referenceDate: referenceDate) == "3 weeks ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-03-20 10:00:00")!, referenceDate: referenceDate) == "4 weeks ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-03-17 10:00:01")!, referenceDate: referenceDate) == "4 weeks ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-03-17 10:00:00")!, referenceDate: referenceDate) != "4 weeks ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-03-13 10:00:00")!, referenceDate: referenceDate) != "5 weeks ago")
  }
  
  func testDateTimesWhoseResultShouldBeMonthsAgo() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-03-17 10:00:00")!, referenceDate: referenceDate) == "1 month ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-01-17 10:00:00")!, referenceDate: referenceDate) == "3 months ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2014-10-17 10:00:00")!, referenceDate: referenceDate) == "6 months ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2014-07-17 10:00:00")!, referenceDate: referenceDate) == "9 months ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2014-05-17 10:00:00")!, referenceDate: referenceDate) == "11 months ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2014-04-19 10:00:00")!, referenceDate: referenceDate) == "11 months ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2014-04-17 10:00:01")!, referenceDate: referenceDate) == "11 months ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2014-04-17 09:59:59")!, referenceDate: referenceDate) != "12 months ago")
  }
  
  func testDateTimesWhoseResultShouldBeYearsAgo() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2014-04-17 09:59:59")!, referenceDate: referenceDate) == "1 year ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2010-04-17 09:59:59")!, referenceDate: referenceDate) == "5 years ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2008-04-17 09:59:59")!, referenceDate: referenceDate) == "7 years ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2004-04-17 09:59:59")!, referenceDate: referenceDate) == "11 years ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("1994-04-17 09:59:59")!, referenceDate: referenceDate) == "21 years ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("1990-04-17 09:59:59")!, referenceDate: referenceDate) == "25 years ago")
  }
}
