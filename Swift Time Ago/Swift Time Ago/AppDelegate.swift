//
//  AppDelegate.swift
//  Swift Time Ago
//
//  Created by Julien Colin on 4/17/15.
//  Copyright (c) 2015 Toldino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    var formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    // TODO: Tests
    println(dateTimeFormattedAsTimeAgo(formatter.dateFromString("2012-04-17 23:26:00")!, referenceDate: formatter.dateFromString("2012-04-17 23:26:00")!))
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
  }

  func applicationDidEnterBackground(application: UIApplication) {
  }

  func applicationWillEnterForeground(application: UIApplication) {
  }

  func applicationDidBecomeActive(application: UIApplication) {
  }

  func applicationWillTerminate(application: UIApplication) {
  }


}

