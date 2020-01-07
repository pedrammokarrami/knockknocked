//
//  timeViewController.swift
//  knock knocked
//
//  Created by pedram on 10/9/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import VACalendar

class timeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
 
    
    
    
    @IBOutlet var timepic: UIImageView!
    
    @IBOutlet var timename: UILabel!
    
    
    @IBOutlet var tableview: UICollectionView!
    
    
    @IBAction func back(_ sender: Any) {
    }
    
    @IBOutlet weak var monthHeaderView: VAMonthHeaderView! {
           didSet {
                let dateFormatter = DateFormatter()
           
                         dateFormatter.dateFormat = "LLLL yyyy"
                         let appereance = VAMonthHeaderViewAppearance(
                             monthFont: UIFont.systemFont(ofSize: 20),
                             monthTextColor: .black,
                             monthTextWidth: 200,
                            previousButtonImage: #imageLiteral(resourceName: "backm"),
                            nextButtonImage: #imageLiteral(resourceName: "nextm"),
                             dateFormatter: dateFormatter
                         )
                         monthHeaderView.delegate = self
                         monthHeaderView.appearance = appereance
                       
                         let path = UIBezierPath(rect: monthHeaderView.bounds)
                         let border = CAShapeLayer()
                         border.path = path.cgPath
                         border.lineWidth = 0
                         border.fillColor = UIColor.clear.cgColor
                         border.strokeColor = UIColor.lightGray.cgColor
                         monthHeaderView.layer.addSublayer(border)
                     }
       }
       
       @IBOutlet weak var weekDaysView: VAWeekDaysView! {
           didSet {
               let appereance = VAWeekDaysViewAppearance(symbolsType: .veryShort, calendar: defaultCalendar)
               weekDaysView.appearance = appereance
           }
       }
    let defaultCalendar: Calendar = {
        var calendar = Calendar.current
        calendar.firstWeekday = 1
//         calendar = Calendar(identifier: .persian)
//       calendar.locale = Locale(identifier: "fa_IR")
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        return calendar
    }()
    
    var didSelectDay: ((Date) -> Void)?
      var calendarView: VACalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
               tableview.dataSource = self

     let calendar = VACalendar(calendar: defaultCalendar)
        calendarView = VACalendarView(frame: CGRect(
            x: 0, y: weekDaysView.frame.maxY,
            width: view.frame.width,
            height: 200
        ), calendar: calendar)
               calendarView.showDaysOut = true
               calendarView.selectionStyle = .single
               calendarView.monthDelegate = monthHeaderView
               calendarView.dayViewAppearanceDelegate = self
               calendarView.calendarDelegate = self
               calendarView.scrollDirection = .horizontal
               calendarView.setup()
        view.addSubview(calendarView)
        
    }
    
    private func commonSetup() {
          
       }
    
    var saat = ["8 - 10 AM","10 - 12 AM","9 - 11 AM", "11 - 13 AM"]
       
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let cell:timecell = self.tableview.dequeueReusableCell(withReuseIdentifier: "timecell", for: indexPath) as! timecell
        
        let dict1 = saat[indexPath.row]
        cell.lblTime?.text = dict1
   
        
         return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           if let cell = tableview.cellForItem(at: indexPath) as? timecell {
               cell.select(animated: true)
           }
       }
       
       func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
           if let cell = tableview.cellForItem(at: indexPath) as? timecell {
               cell.deselect(animated: true)
           }
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 100)
       }
    

    

}

extension timeViewController: VACalendarViewDelegate {
    
    func selectedDate(_ date: Date) {
        didSelectDay?(date)
    }
    
}
extension timeViewController: VADayViewAppearanceDelegate {
    
    func font(for state: VADayState) -> UIFont {
        return UIFont.systemFont(ofSize: 15)
    }
    
    func textColor(for state: VADayState) -> UIColor {
        switch state {
        case .out:
            return UIColor(red: 214 / 255, green: 214 / 255, blue: 219 / 255, alpha: 1.0)
        case .selected:
            return UIColor(red: 55 / 255, green: 167 / 255, blue: 248 / 255, alpha: 1.0)
        case .unavailable:
            return .lightGray
        default:
            return .black
        }
    }
    
    func backgroundColor(for state: VADayState) -> UIColor {
        switch state {
        case .out:
            return UIColor(red: 249 / 255, green: 250 / 255, blue: 250 / 255, alpha: 1.0)
        default:
            return .white
        }
    }
    
    func shape() -> VADayShape {
        return .square
    }
    
    func borderWidth(for state: VADayState) -> CGFloat {
        switch state {
        case .selected:
            return 2
        default:
            return 0 / UIScreen.main.scale
        }
    }
    
    func borderColor(for state: VADayState) -> UIColor {
        switch state {
        case .selected:
            return UIColor(red: 55 / 255, green: 167 / 255, blue: 248 / 255, alpha: 1.0)
        default:
            return UIColor(red: 221 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1.0)
        }
    }
    
}
extension timeViewController: VAMonthHeaderViewDelegate {
    
    func didTapNextMonth() {
        calendarView.nextMonth()
    }
    
    func didTapPreviousMonth() {
        calendarView.previousMonth()
    }
    
}


class timecell :CB3DSelectCell {
    @IBOutlet weak var lblTime: UILabel!
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 4
            super.frame = frame
        }
    }
    
}
