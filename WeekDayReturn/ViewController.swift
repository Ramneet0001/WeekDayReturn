//
//  ViewController.swift
//  WeekDayReturn
//
//  Created by STUser on 27/06/19.
//  Copyright © 2019 abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let StartedDate = "2019-06-23"
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let date: NSDate? = dateFormatterGet.date(from: StartedDate ) as NSDate?
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        let strWeek = dateFormatterPrint.string(from: date! as Date)
        
        print(strWeek)
        
        let completeArray = self.getWeekDays(startDate1: "2019-06-23", startDate2: "2019-06-26", endDate1: "2019-06-28", endDate2: "2019-06-29")
        
        print(completeArray)
        
    }

}

extension ViewController{
    
    // MARK: getting week day main function
    func getWeekDays(startDate1: String, startDate2: String, endDate1: String, endDate2: String) -> [String]{
        
        var dateArray1 = [""]
        var dateArray2 = [""]
        
        dateArray1.removeAll()
        dateArray2.removeAll()
        
        dateArray1 = createArray(date1: startDate1, date2: startDate2)
        
        dateArray2 = createArray(date1: endDate1, date2: endDate2)
        
        dateArray1.append(contentsOf: dateArray2)
        
        return dateArray1
    }
    
    // MARK: getting week day with range of two dates
    func createArray(date1: String, date2: String) -> [String]{
        
        var dateArray = [""]
        
        dateArray.removeAll()
        
        var startD1 = self.getDateFromString(strDate: date1)
        
        while startD1 <= self.getDateFromString(strDate: date2) {
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "EEE"
            let strWeek = dateFormatterPrint.string(from: startD1)
            
            startD1 = Calendar.current.date(byAdding: .day, value: 1, to: startD1)!
            
            dateArray.append(strWeek)
        }
        return dateArray
    }
    
    //MARK: convert date from string and return
    func getDateFromString(strDate: String) -> Date{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let date: Date? = dateFormatterGet.date(from: strDate)
        
        return date!
    }
    
}

