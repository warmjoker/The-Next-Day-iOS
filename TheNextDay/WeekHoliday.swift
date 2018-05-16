//
//  WeekHoliday.swift
//  TheNextDay
//
//  Created by 潘俊舟 on 2018/5/16.
//  Copyright © 2018年 潘俊舟. All rights reserved.
//

import Foundation

class WeekHoliday {
  
  var month: Int!
  var dayth: Int!     //第几个
  var dayOfWeek: Int!     //星期几
  var holiday: String!
  
  init(month: Int, dayth: Int, dayOfWeek: Int, holiday: String) {
    self.month = month
    self.dayth = dayth
    self.dayOfWeek = dayOfWeek
    self.holiday = holiday
  }
  
  func getMonth() -> Int {
    return month
  }
  
  func setMonth(month: Int) {
    self.month = month
  }
  
  func getDayth() -> Int {
    return dayth
  }
  
  func setDayth(dayth: Int) {
    self.dayth = dayth
  }
  
  func getDayOfWeek() -> Int {
    return dayOfWeek
  }
  
  func setDayOfWeek(dayOfWeek: Int) {
    self.dayOfWeek = dayOfWeek
  }
  
  func getHoliday() -> String {
    return holiday
  }
  
  func setHoliday(holiday: String) {
    self.holiday = holiday
  }
}
