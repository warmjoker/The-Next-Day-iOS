//
//  SolarHoliday.swift
//  TheNextDay
//
//  Created by 潘俊舟 on 2018/5/16.
//  Copyright © 2018年 潘俊舟. All rights reserved.
//

import Foundation

class SolarHoliday {
  
  var month: Int!
  var day: Int!
  var holiday: String!
  
  init(month: Int, day: Int, holiday: String) {
    self.month = month
    self.day = day
    self.holiday = holiday
  }
  
  func getMonth() -> Int {
    return month;
  }
  
  func setMonth(month: Int) {
    self.month = month
  }
  
  func getDay() -> Int {
    return day;
  }
  
  func setDay(day: Int) {
    self.day = day
  }
  
  func getHoliday() -> String {
    return holiday;
  }
  
  func setHoliday(holiday: String) {
    self.holiday = holiday
  }
}
