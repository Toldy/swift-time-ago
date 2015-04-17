//
//  DateTimeFormattedAsTimeAgo.swift
//  Swift Time Ago
//
//  Created by Julien Colin on 4/17/15.
//  Copyright (c) 2015 Toldino. All rights reserved.
//

import Foundation

func dateTimeFormattedAsTimeAgo(date: NSDate, referenceDate now: NSDate = NSDate()) -> String {

  let secondsFromDate = now.secondsFrom(date)
  if secondsFromDate < 60 {
    return secondsFormatter()
  }
  
  let minutesFromDate = now.minutesFrom(date)
  if minutesFromDate < 60 {
    return minutesFormatter(minutesFromDate)
  }
  
  let hoursFromDate = now.hoursFrom(date)
  if hoursFromDate < 24 {
    return hoursFormatter(hoursFromDate)
  }
  
  let daysFromDate = now.daysFrom(date)
  switch daysFromDate {
  case 2:
    return yesterdayFormatter()
  case 3...6:
    return daysFormatter(daysFromDate)
  default:
    break
  }
  
  let weeksFromDate = now.weeksFrom(date)
  let monthsFromDate = now.monthsFrom(date)
  switch monthsFromDate {
  case 0:
    return weeksFormatter(weeksFromDate)
  case 1...11:
    return monthsFormatter(monthsFromDate)
  default:
    break
  }
  
  let yearsFromDate = now.yearsFrom(date)
  return yearsFormatter(yearsFromDate)
}

// MARK: Formatter functions

func classicFormatterAgo(quantity: Int, unit: String) -> String {
  var formattedString = "\(quantity) \(unit)"
  if quantity > 1 {
    formattedString += "s"
  }
  formattedString += " ago"
  return formattedString
}

func secondsFormatter() -> String {
  return "Just now"
}

func minutesFormatter(minutes: Int) -> String {
  return classicFormatterAgo(minutes, "minute")
}

func hoursFormatter(hours: Int) -> String {
  return classicFormatterAgo(hours, "hour")
}

func yesterdayFormatter() -> String {
  return "Yesterday"
}

func daysFormatter(days: Int) -> String {
  return classicFormatterAgo(days, "day")
}

func weeksFormatter(weeks: Int) -> String {
  return classicFormatterAgo(weeks, "week")
}

func monthsFormatter(months: Int) -> String {
  return classicFormatterAgo(months, "month")
}

func yearsFormatter(years: Int) -> String {
  return classicFormatterAgo(years, "year")
}

// MARK: Extension of NSDate

private extension NSDate {
  func yearsFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitYear, fromDate: date, toDate: self, options: nil).year
  }
  func monthsFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitMonth, fromDate: date, toDate: self, options: nil).month
  }
  func weeksFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitWeekOfYear, fromDate: date, toDate: self, options: nil).weekOfYear
  }
  func daysFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay, fromDate: date, toDate: self, options: nil).day
  }
  func hoursFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitHour, fromDate: date, toDate: self, options: nil).hour
  }
  func minutesFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitMinute, fromDate: date, toDate: self, options: nil).minute
  }
  func secondsFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitSecond, fromDate: date, toDate: self, options: nil).second
  }
}