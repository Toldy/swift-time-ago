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
  }

  func testDateTimesWhoseResultShouldBeMinutesAgo() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:59:00")!, referenceDate: referenceDate) == "1 minute ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:58:30")!, referenceDate: referenceDate) == "1 minute ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:45:00")!, referenceDate: referenceDate) == "15 minutes ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:30:00")!, referenceDate: referenceDate) == "30 minutes ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:15:00")!, referenceDate: referenceDate) == "45 minutes ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:00:30")!, referenceDate: referenceDate) == "59 minutes ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:00:01")!, referenceDate: referenceDate) == "59 minutes ago")
  }
  
  func testDateTimesWhoseResultShouldBeHoursAgo() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 09:00:00")!, referenceDate: referenceDate) == "1 hour ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 08:00:01")!, referenceDate: referenceDate) == "1 hour ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 08:00:00")!, referenceDate: referenceDate) == "2 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-17 04:00:00")!, referenceDate: referenceDate) == "6 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 21:00:30")!, referenceDate: referenceDate) == "12 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 15:30:00")!, referenceDate: referenceDate) == "18 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 11:00:00")!, referenceDate: referenceDate) == "23 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 10:01:00")!, referenceDate: referenceDate) == "23 hours ago")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 10:00:01")!, referenceDate: referenceDate) == "23 hours ago")
  }
  
  func testDateTimesWhoseResultShouldBeYesterday() {
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 10:00:00")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-16 00:00:00")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 22:00:00")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 16:30:00")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 12:00:00")!, referenceDate: referenceDate) == "Yesterday")
    XCTAssert(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2015-04-15 10:00:01")!, referenceDate: referenceDate) == "Yesterday")
  }
  
  func testDateTimesWhoseResultShouldBeDaysAgo() {
    XCTAssert(false)
  }
  
  func testDateTimesWhoseResultShouldBeWeeksAgo() {
    XCTAssert(false)
  }
  
  func testDateTimesWhoseResultShouldBeMonthsAgo() {
    XCTAssert(false)
  }
  
  func testDateTimesWhoseResultShouldBeYearsAgo() {
    XCTAssert(false)
  }
}
