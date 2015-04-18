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
    XCTAssert(false)
  }
  
  func testDateTimesWhoseResultShouldBeYesterday() {
    XCTAssert(false)
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
