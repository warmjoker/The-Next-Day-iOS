//
//  SolarDate.swift
//  TheNextDay
//
//  Created by 潘俊舟 on 2018/5/16.
//  Copyright © 2018年 潘俊舟. All rights reserved.
//

import Foundation

class SolarDate {
  
  var year: Int!
  var month: Int!
  var day: Int!
  
  init(year: Int, month: Int, day: Int) {
    self.year = year
    self.month = month
    self.day = day
  }
  
  init(month: Int, day:Int) {
    self.month = month
    self.day = day
  }
  
  init() {
    
  }
  
  func getMonth() -> Int {
    return month;
  }
  
  func setMonth(month: Int) {
    self.month = month
  }
  
  func getYear() -> Int {
    return year
  }
  
  func setYear(year: Int) {
    self.year = year
  }
  
  func getDay() -> Int {
    return day
  }
  
  func setDay(day: Int) {
    self.day = day
  }
}
