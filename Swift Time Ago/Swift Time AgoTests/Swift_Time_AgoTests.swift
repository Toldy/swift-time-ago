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
    XCTAssert(false)
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
