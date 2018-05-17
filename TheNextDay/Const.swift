//
//  Const.swift
//  TheNextDay
//
//  Created by 潘俊舟 on 2018/5/16.
//  Copyright © 2018年 潘俊舟. All rights reserved.
//

import Foundation

class Const {
  
  static var gan: [String] = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
  static var zhi: [String] = ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]
  static var animals: [String] = ["鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗", "猪"]
  static var lunarDays: [String] = ["初一","初二","初三","初四","初五","初六","初七","初八","初九","初十","十一","十二","十三","十四","十五","十六","十七","十八","十九","二十","廿一","廿二","廿三","廿四","廿五","廿六","廿七","廿八","廿九","三十"]
  static var lunarMonths: [String] = ["正","二","三","四","五","六","七","八","九","十","冬","腊"]
  /*前4位，即0在这一年是闰年时才有意义，它代表这年闰月的大小月，为1则闰大月，为0则闰小月。
   中间12位，即4bd，每位代表一个月，为1则为大月，为0则为小月。
   最后4位，即8，代表这一年的润月月份，为0则不润。首4位要与末4位搭配使用。*/
  static var lunarInfo: [Int] = [
    0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,//1900-1909
    0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,//1910-1919
    0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,//1920-1929
    0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,//1930-1939
    0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,//1940-1949
    0x06ca0,0x0b550,0x15355,0x04da0,0x0a5b0,0x14573,0x052b0,0x0a9a8,0x0e950,0x06aa0,//1950-1959
    0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,//1960-1969
    0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b6a0,0x195a6,//1970-1979
    0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,//1980-1989
    0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,//1990-1999
    0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,//2000-2009
    0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,//2010-2019
    0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,//2020-2029
    0x05aa0,0x076a3,0x096d0,0x04afb,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,//2030-2039
    0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0,//2040-2049
    0x14b63,0x09370,0x049f8,0x04970,0x064b0,0x168a6,0x0ea50, 0x06b20,0x1a6c4,0x0aae0,//2050-2059
    0x0a2e0,0x0d2e3,0x0c960,0x0d557,0x0d4a0,0x0da50,0x05d55,0x056a0,0x0a6d0,0x055d4,//2060-2069
    0x052d0,0x0a9b8,0x0a950,0x0b4a0,0x0b6a6,0x0ad50,0x055a0,0x0aba4,0x0a5b0,0x052b0,//2070-2079
    0x0b273,0x06930,0x07337,0x06aa0,0x0ad50,0x14b55,0x04b60,0x0a570,0x054e4,0x0d160,//2080-2089
    0x0e968,0x0d520,0x0daa0,0x16aa6,0x056d0,0x04ae0,0x0a9d4,0x0a2d0,0x0d150,0x0f252,//2090-2099
    0x0d520
  ]
  
  static var daysNormal: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  static var daysSpecial: [Int] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  static var monthNormal: [Int] = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]
  static var monthSpecial: [Int] = [0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335]
  static var daysOfWeek: [String] = ["星期一","星期二","星期三","星期四","星期五","星期六","星期日"]
  
  static var weekHolidays: [WeekHoliday] = [
    WeekHoliday(month: 5, dayth: 2, dayOfWeek: 6, holiday: "母亲节"),
    WeekHoliday(month: 5, dayth: 3, dayOfWeek: 6, holiday: "全国助残日"),
    WeekHoliday(month: 6, dayth: 3, dayOfWeek: 6, holiday: "父亲节"),
    WeekHoliday(month: 9, dayth: 3, dayOfWeek: 2, holiday: "国际和平日"),
    WeekHoliday(month: 9, dayth: 4, dayOfWeek: 6, holiday: "国际聋人节"),
    WeekHoliday(month: 10, dayth: 1, dayOfWeek: 1, holiday: "国际住房日"),
    WeekHoliday(month: 10, dayth: 1, dayOfWeek: 3, holiday: "国际减轻大自然灾害日"),
    WeekHoliday(month: 11, dayth: 4, dayOfWeek: 4, holiday: "感恩节")
  ]
  
  static var solarHolidays: [SolarHoliday] = [
    SolarHoliday(month: 1, day: 1, holiday: "元旦"),
    SolarHoliday(month: 2, day: 2, holiday: "世界湿地日"),
    SolarHoliday(month: 2, day: 10, holiday: "国际气象节"),
    SolarHoliday(month: 2, day: 14, holiday: "情人节"),
    SolarHoliday(month: 3, day: 1, holiday: "国际海豹日"),
    SolarHoliday(month: 3, day: 5, holiday: "学雷锋纪念日"),
    SolarHoliday(month: 3, day: 8, holiday: "妇女节"),
    SolarHoliday(month: 3, day: 12, holiday: "植树节 孙中山逝世纪念日"),
    SolarHoliday(month: 3, day: 14, holiday: "国际警察日"),
    SolarHoliday(month: 3, day: 15, holiday: "消费者权益日"),
    SolarHoliday(month: 3, day: 17, holiday: "中国国医节 国际航海日"),
    SolarHoliday(month: 3, day: 21, holiday: "世界森林日 消除种族歧视国际日 世界儿歌日"),
    SolarHoliday(month: 3, day: 22, holiday: "世界水日"),
    SolarHoliday(month: 3, day: 24, holiday: "世界防治结核病日"),
    SolarHoliday(month: 4, day: 1, holiday: "愚人节"),
    SolarHoliday(month: 4, day: 5, holiday: "清明节"),
    SolarHoliday(month: 4, day: 7, holiday: "世界卫生日"),
    SolarHoliday(month: 4, day: 22, holiday: "世界地球日"),
    SolarHoliday(month: 5, day: 1, holiday: "劳动节"),
    SolarHoliday(month: 5, day: 4, holiday: "青年节"),
    SolarHoliday(month: 5, day: 8, holiday: "世界红十字日"),
    SolarHoliday(month: 5, day: 12, holiday: "国际护士节"),
    SolarHoliday(month: 5, day: 20, holiday: "520"),
    SolarHoliday(month: 5, day: 31, holiday: "世界无烟日"),
    SolarHoliday(month: 6, day: 1, holiday: "国际儿童节"),
    SolarHoliday(month: 6, day: 5, holiday: "世界环境保护日"),
    SolarHoliday(month: 6, day: 26, holiday: "国际禁毒日"),
    SolarHoliday(month: 7, day: 1, holiday: "建党节 香港回归纪念 世界建筑日"),
    SolarHoliday(month: 7, day: 11, holiday: "世界人口日"),
    SolarHoliday(month: 8, day: 1, holiday: "建军节"),
    SolarHoliday(month: 8, day: 8, holiday: "中国男子节 父亲节"),
    SolarHoliday(month: 8, day: 15, holiday: "抗日战争胜利纪念"),
    SolarHoliday(month: 9, day: 10, holiday: "教师节"),
    SolarHoliday(month: 9, day: 18, holiday: "九·一八事变纪念日"),
    SolarHoliday(month: 9, day: 20, holiday: "国际爱牙日"),
    SolarHoliday(month: 9, day: 27, holiday: "世界旅游日"),
    SolarHoliday(month: 9, day: 28, holiday: "孔子诞辰"),
    SolarHoliday(month: 10, day: 1, holiday: "国庆节 国际音乐日"),
    SolarHoliday(month: 10, day: 6, holiday: "老人节"),
    SolarHoliday(month: 10, day: 24, holiday: "联合国日"),
    SolarHoliday(month: 11, day: 10, holiday: "世界青年节"),
    SolarHoliday(month: 11, day: 12, holiday: "孙中山诞辰纪念"),
    SolarHoliday(month: 12, day: 1, holiday: "世界艾滋病日"),
    SolarHoliday(month: 12, day: 3, holiday: "世界残疾人日"),
    SolarHoliday(month: 12, day: 20, holiday: "澳门回归纪念"),
    SolarHoliday(month: 12, day: 24, holiday: "平安夜"),
    SolarHoliday(month: 12, day: 25, holiday: "圣诞节")
  ]
  
  static var lunarHolidays: [LunarHoliday] = [
    LunarHoliday(month: 1, day: 1, holiday: "春节"),
    LunarHoliday(month: 1, day: 15, holiday: "元宵节"),
    LunarHoliday(month: 5, day: 5, holiday: "端午节"),
    LunarHoliday(month: 7, day: 7, holiday: "七夕情人节"),
    LunarHoliday(month: 7, day: 15, holiday: "中元节 盂兰盆节"),
    LunarHoliday(month: 8, day: 15, holiday: "中秋节"),
    LunarHoliday(month: 9, day: 9, holiday: "重阳节"),
    LunarHoliday(month: 12, day: 8, holiday: "腊八节"),
    LunarHoliday(month: 12, day: 23, holiday: "北方小年(扫房)"),
    LunarHoliday(month: 12, day: 24, holiday: "南方小年(掸尘)")
  ]
}
