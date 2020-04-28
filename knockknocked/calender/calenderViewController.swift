//
//  calenderViewController.swift
//  knockknocked
//
//  Created by pedram on 11/1/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import VACalendar

class calenderViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
 
    
    
    @IBOutlet var reserve: UIButton!
    
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
        calendarView.showDaysOut = false
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
    
    var saat = ["8-10 AM","8-10 AM","8-10 AM", "8-10 AM"]
       
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let cell:calendercell = self.tableview.dequeueReusableCell(withReuseIdentifier: "calendercell", for: indexPath) as! calendercell
        
        let dict1 = saat[indexPath.row]
        cell.lblTime?.text = dict1
 cell.layer.cornerRadius = 4.0
 cell.layer.borderWidth = 1.0
  cell.layer.borderColor = UIColor.clear.cgColor
cell.layer.masksToBounds = true
  
        
         return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
       }
       
       func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
       
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 310, height: 82)
       }
    

    

}

extension calenderViewController: VACalendarViewDelegate {
    
    func selectedDate(_ date: Date) {
        didSelectDay?(date)
    }
    
}
extension calenderViewController: VADayViewAppearanceDelegate {
    func font(for state: VADayState) -> UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
  func textColor(for state: VADayState) -> UIColor {
       switch state {
       case .out:
           return UIColor(red: 214 / 255, green: 214 / 255, blue: 219 / 255, alpha: 1.0)
       case .selected:
           return .white
       case .unavailable:
           return .clear
       default:
           return .black
       }
   }
   
  
   func textBackgroundColor(for state: VADayState) -> UIColor {
         switch state {
         case .selected:
             return UIColor(red: 92 / 255, green: 50 / 255, blue: 235 / 255, alpha: 1.0)
         default:
             return .clear
         }
     }
     

   

   func shape() -> VADayShape {
       return .circle
   }
   
  
  
   
}
extension calenderViewController: VAMonthHeaderViewDelegate {
    
    func didTapNextMonth() {
        calendarView.nextMonth()
    }
    
    func didTapPreviousMonth() {
        calendarView.previousMonth()
    }
    
}


class calendercell :UICollectionViewCell {
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
