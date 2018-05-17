//
//  ViewController.swift
//  TheNextDay
//
//  Created by 潘俊舟 on 2018/5/16.
//  Copyright © 2018年 潘俊舟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var solarDate: UILabel!
  
  @IBOutlet weak var weekDay: UILabel!
  
  @IBOutlet weak var lunarDate: UILabel!
  
  @IBOutlet weak var holiday: UILabel!
  
  @IBOutlet weak var dateChooser: UIDatePicker!
  
  @IBAction func onCick(_ sender: Any) {
    
    let dateformatter = DateFormatter()
    dateformatter.dateStyle = .short
    let ymd: [String] = dateformatter.string(from: self.dateChooser.date).components(separatedBy: "/") //从UIDatePicker 获取的格式为"YYYY/MM/dd"
    
    let year: Int! = Int(ymd[0])
    let month: Int! = Int(ymd[1])
    let day: Int! = Int(ymd[2])
    
    let now: SolarDate =  SolarDate()
    now.setDay(day: day);
    now.setMonth(month: month);
    now.setYear(year: year);
    let next: SolarDate = DataUtil.getNextSolar(now: now)
    let dayOfWeek = DataUtil.getDayOfWeek(solarDate: next)
    let nextSolar = "明天是" + String(next.getYear()) + "年" + String(next.getMonth()) + "月" + String(next.getDay()) + "日"
    let nextWeekDay: String = Const.daysOfWeek[dayOfWeek]
    let lunarDate: LunarDate = DataUtil.getLunarDay(solarDate: next)
    //self.lunarDate.text = String(lunarDate.getYear()) //+ lunarDate.getMonth() + lunarDate.getDay()
    
    var nextLunar: String!;
    if (lunarDate.getYear() == -1){
      nextLunar = "己亥猪年" + Const.lunarMonths[11] + "月" + Const.lunarDays[day] + "日";
    }else {
      
      nextLunar = DataUtil.getGanZhi(year: lunarDate.getYear()) + DataUtil.animalsYear(year: lunarDate.getYear()) + "年" + Const.lunarMonths[lunarDate.getMonth() - 1] + "月" + Const.lunarDays[lunarDate.getDay() - 1];
    }
    let nextSolarHoliday: String = DataUtil.getSolarHoliday(solarDate: next)
    let nextLunarHoliday: String = DataUtil.getLunarHoliday(solarDate: next)
    let nextWeekHoliday: String = DataUtil.getWeekHoliday(solarDate: next)
    let nextHoliday: String = nextSolarHoliday + " " + nextLunarHoliday + " " + nextWeekHoliday
    
    self.solarDate.text = nextSolar
    self.weekDay.text = nextWeekDay
    self.lunarDate.text = nextLunar
    self.holiday.text = nextHoliday
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

