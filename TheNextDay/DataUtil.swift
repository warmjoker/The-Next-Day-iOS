//
//  DataUtil.swift
//  TheNextDay
//
//  Created by 潘俊舟 on 2018/5/16.
//  Copyright © 2018年 潘俊舟. All rights reserved.
//

import Foundation

class DataUtil {
  
  //是否阳历闰年
  class func isSpecial(year: Int) -> Bool {
    if year % 100 == 0 {
      if year % 400 == 0 {
        return true
      }else {
        return false
      }
    }else {
      if year % 4 == 0 {
        return true
      }else {
        return false
      }
    }
  }
  
  //获得阳历下一天
  class func getNextSolar(now: SolarDate) -> SolarDate {
    let year: Int = now.getYear()
    let month: Int = now.getMonth()
    let day: Int = now.getDay()
    let next: SolarDate = SolarDate()
    if month == 12 && day == 31 {
      next.setYear(year: year + 1)
      next.setMonth(month: 1)
      next.setDay(day: 1)
      return next
    }
    if isSpecial(year: year) {
      if day < Const.daysSpecial[month - 1] {
        next.setYear(year: year)
        next.setMonth(month: month)
        next.setDay(day: day + 1)
        return next
      }else {
        next.setYear(year: year)
        next.setMonth(month: month + 1)
        next.setDay(day: 1)
        return next;
      }
    }else {
      if day < Const.daysNormal[month - 1] {
        next.setYear(year: year)
        next.setMonth(month: month)
        next.setDay(day: day + 1)
      }else {
        next.setYear(year: year)
        next.setMonth(month: month + 1)
        next.setDay(day: 1)
        return next
      }
    }
    return next
  }
  
  //某天到公元元年1月1日的天数差值
  class func getDateMinusFromBeginning(solarDate: SolarDate) -> Int {
    var minus: Int = 0
    if isSpecial(year: solarDate.getYear()) {
      minus += Const.monthSpecial[solarDate.getMonth() - 1] + solarDate.getDay()
    }else {
      minus += Const.monthNormal[solarDate.getMonth() - 1] + solarDate.getDay()
    }
    minus += (solarDate.getYear() - 1) * 365 + (solarDate.getYear() - 1) / 4 - (solarDate.getYear() - 1) / 100 + (solarDate.getYear() - 1) / 400;
    return minus
  }
  
  //获得两个阳历天数差值
  class func getDateMinus(solarDate1: SolarDate, solarDate2: SolarDate) -> Int {
    return abs(getDateMinusFromBeginning(solarDate: solarDate1) - getDateMinusFromBeginning(solarDate: solarDate2))
  }
  
  //周几？
  class func getDayOfWeek(solarDate: SolarDate) -> Int {
    return getDateMinus(solarDate1: solarDate, solarDate2: SolarDate(year: 1900, month: 1, day: 1)) % 7
  }
  
  //获得当前是第几个星期几   具体星期几用上面的函数算
  class func getDayInWeek(solarDate: SolarDate) -> Int {
    return (solarDate.getDay() - 1) / 7 + 1
  }
  
  //农历闰哪个月
  class func leapMonth(year: Int) -> Int {
    return Const.lunarInfo[year - 1900] & 0xf
  }

  //返回这年闰月的天数
  class func leapDays(year: Int) -> Int {
    if leapMonth(year: year) != 0 {
      if (Const.lunarInfo[year - 1900] & 0x10000) != 0 {
        return 30
      }else {
        return 29
      }
    }else {
      return 0
    }
  }
  
  //返回这年天数
  class func lunarYearDays(year: Int) -> Int {
    var i: Int = 0x8000
    var sum: Int = 348
    while i > 0x8 {
      if (Const.lunarInfo[year - 1900] & i) != 0 {
        sum += 1
      }
      i >>= 1
    }
    return sum + leapDays(year: year)
  }
  
  //从阳历获得阴历
  class func getLunarDay(solarDate: SolarDate) -> LunarDate {
    if solarDate.getYear() == 1900 && solarDate.getMonth() == 1 && solarDate.getDay() < 31 {
      return LunarDate(year: -1, month: -1, day: -1)
    }
    var nongDate = Array<Int>(repeating: 0, count: 7)
    let lunarDate: LunarDate = LunarDate()
    var i: Int = 1900
    var temp: Int = 0
    var leap: Int = 0
    var offset = getDateMinus(solarDate1: solarDate, solarDate2: SolarDate(year: 1900, month: 1, day: 31))
    while i < 2100 && offset > 0 {
      temp = lunarYearDays(year: i)
      offset -= temp
      nongDate[4] += 12
      i += 1
    }
    if offset < 0 {
      offset += temp
      i -= 1
      nongDate[4] -= 12
    }
    nongDate[0] = i
    lunarDate.setYear(year: i)
    nongDate[3] = i - 1864
    leap = leapMonth(year: i)
    nongDate[6] = 0   // 闰哪个月
    i = 1
    while i < 13 && offset > 0 {
      // 闰月
      if leap > 0 && i == (leap + 1) && nongDate[6] == 0 {
        i -= 1;
        nongDate[6] = 1;
        temp = leapDays(year: nongDate[0]);
      } else {
        temp = monthDays(year: nongDate[0], month: i)
      }
      // 解除闰月
      if nongDate[6] == 1 && i == (leap + 1) {
        nongDate[6] = 0
      }
      offset -= temp;
      if nongDate[6] == 0 {
        nongDate[4] += 1
      }
      i += 1
    }
    if offset == 0 && leap > 0 && i == leap + 1 {
      if nongDate[6] == 1 {
        nongDate[6] = 0
      }else {
        nongDate[6] = 1
        i -= 1
        nongDate[4] -= 1
      }
    }
    if offset < 0 {
      offset += temp
      i -= 1
      nongDate[4] -= 1
    }
    nongDate[1] = i
    lunarDate.setMonth(month: i)
    nongDate[2] = offset + 1;
    lunarDate.setDay(day: offset + 1)
    
    return lunarDate
  }
  
  //查看今天阳历是否有节日
  class func getSolarHoliday(solarDate: SolarDate) -> String {
    for i in 0..<Const.solarHolidays.count {
      let solarHoliday: SolarHoliday = Const.solarHolidays[i]
      if solarDate.getMonth() == solarHoliday.getMonth() && solarDate.getDay() == solarHoliday.getDay() {
        return solarHoliday.getHoliday()
      }
    }
    return ""
  }
  
  //查看今天阴历是否有节日
  class func getLunarHoliday(lunarDate: LunarDate) -> String {
    if lunarDate.getYear() == -1 {
      return ""
    }
    for i in 0..<Const.lunarHolidays.count {
      let lunarHoliday: LunarHoliday = Const.lunarHolidays[i]
      if lunarDate.getMonth() == lunarHoliday.getMonth() && lunarDate.getDay() == lunarHoliday.getDay() {
        return lunarHoliday.getHoliday()
      }
    }
    return ""
  }
  
  //查看今天阴历是否有节日
  class func getLunarHoliday(solarDate: SolarDate) -> String {
    let lunarDate1: LunarDate = getLunarDay(solarDate: solarDate)
    let lunarDate2: LunarDate = getLunarDay(solarDate: solarDate)
    if getLunarHoliday(lunarDate: lunarDate2).compare("春节").rawValue == 0 {
      return "除夕"
    }else {
      return getLunarHoliday(lunarDate: lunarDate1)
    }
  }
  
  //查看今天根据周几是否有节日
  class func getWeekHoliday(solarDate: SolarDate) -> String {
    for i in 0..<Const.weekHolidays.count {
      let weekHoliday: WeekHoliday = Const.weekHolidays[i]
      if weekHoliday.getMonth() == solarDate.getMonth() && weekHoliday.getDayOfWeek() == getDayOfWeek(solarDate: solarDate) && weekHoliday.getDayth() == getDayInWeek(solarDate: solarDate) {
        return weekHoliday.getHoliday()
      }
    }
    return ""
  }
  
  //传回农历 year年month月的总天数
  class func monthDays(year: Int, month: Int) -> Int {
    if (Const.lunarInfo[year - 1900] & (0x10000 >> month)) == 0 {
      return 29
    }else {
      return 30
    }
  }
  
  //某年生肖
  class func animalsYear(year: Int) -> String {
    return Const.animals[(year - 4) % 12]
  }
  
  //根据月日offset传回天干地支，0=甲子年
  class func getGanZhi(year: Int) -> String {
    let num = year - 1900 + 36
    return Const.gan[num % 10] + Const.zhi[num % 12]
  }
}
