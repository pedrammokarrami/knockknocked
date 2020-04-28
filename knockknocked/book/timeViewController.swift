//
//  timeViewController.swift
//  knock knocked
//
//  Created by pedram on 10/9/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Foundation
import VACalendar
import Lottie
import Alamofire
import SwiftyJSON


class timeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
 
//   let animationView = AnimationView()
    
   
      var hud = LottieHUD("tik")
    
    var time = ""
    var saat1 = ""
    var resss : Bool = true

    
    @IBOutlet var reserve: UIButton!
    
    
    @IBOutlet var timename: UILabel!
    
    
    @IBOutlet var tableview: UICollectionView!
    
    
//    var hidding : Bool = true
    
     func server() {
    let token = UserDefaults.standard.object(forKey: "token") as! String
         let latpro = UserDefaults.standard.object(forKey: "latpro") as! Double
          let longpro = UserDefaults.standard.object(forKey: "longpro") as! Double
        let idpro = UserDefaults.standard.object(forKey: "idpro1") as! Int
        let userid = UserDefaults.standard.object(forKey: "userid") as! Int

        
        
        
        
        
              let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
        let paramer:Parameters = ["provider":idpro,"latitude":latpro,"longitude":longpro,"order_date":time,"order_time":saat1]
             Alamofire.request("http://dev.hoonamapps.com/telemarket/api/v0/order/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
           
             print(response)
        print(paramer)

              
              
               if response.response?.statusCode == 201{
                   
                
                
                 
                 
                    let jsonObject = JSON(response.result.value!)
                   print(jsonObject)
                

          
               
                  
                   
                    let tokennameValu = jsonObject["non_field_errors"].stringValue
                   if tokennameValu == "" {
                       
                   }else{
                      
                               let alertController = UIAlertController(title: "Warning...", message: tokennameValu, preferredStyle:UIAlertController.Style.alert)
                                          
                                          
                                          let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                                              
                                              
                                              
                                              
                                              print("you have pressed OK button");
                                          }
                                       alertController.addAction(OKAction)
                                       
                                       self.present(alertController, animated: true, completion:{ () -> Void in
                                       })
                   }
                   
               }
               }
           }
   
    
    @IBOutlet weak var monthHeaderView: VAMonthHeaderView! {
           didSet {
                let dateFormatter = DateFormatter()
           
                         dateFormatter.dateFormat = "LLLL yyyy"
                         let appereance = VAMonthHeaderViewAppearance(
                             monthFont: UIFont.systemFont(ofSize: 17),
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
               let appereance = VAWeekDaysViewAppearance(symbolsType: .short, calendar: defaultCalendar1)
               weekDaysView.appearance = appereance
           
           }
       }
    let defaultCalendar1: Calendar = {
        var calendar = Calendar.current
        calendar.firstWeekday = 1
//         calendar = Calendar(identifier: .persian)
//       calendar.locale = Locale(identifier: "fa_IR")
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        return calendar
    }()
    
    var didSelectDay: ((Date) -> Void)?
      var calendarView: VACalendarView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if UserDefaults.standard.bool(forKey: "didSkip2") {
            reserve?.isHidden = true
        } else {
            reserve?.isHidden = false
        }
    }
   
    @objc func methodOfReceivedNotificationlog(notification: Notification) {
     
          
    
          
      }
      
    override func viewDidLoad() {
        super.viewDidLoad()
 NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotificationlog(notification:)), name: Notification.Name("NotificationIdentifierlogin"), object: nil)


        
        reserve.isHidden = resss
   
        tableview.delegate = self
        tableview.dataSource = self

     let calendar = VACalendar(calendar: defaultCalendar1)
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
        
        
        
        calendarView.showDaysOut = false
       
  
        view.addSubview(calendarView)
        
    }
    
    
//  override func awakeFromNib() {
//      super.awakeFromNib()
//     let hid = UserDefaults.standard.bool(forKey: "didSkip1")
//     DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//    if hid == false {
//        self.reserve?.isHidden = false
//        print(hid)
//        print("sad")
//    }else{
//         self.reserve?.isHidden = true
//         print(hid)
//        print("ooe")
//        }
//    }
//  }
//    
  
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
         calendarView.setup()
    }
    
  
    @IBAction func reserve(_ sender: Any) {
          hud.showHUD()
        server()
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.hud.stopHUD()
//         self.dismiss(animated: true, completion: nil)
              let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let chatting = storyBoard.instantiateViewController(withIdentifier: "chatting") as! chatting
            self.present(chatting, animated:true, completion:nil)
        }
    }
    
  
    
    var saat = ["0 - 2 AM","2 - 4 AM","4 - 6 AM", "6 - 8 AM","8 - 10 AM","10 - 12 PM","12 - 14 PM", "14 - 16 PM","16 - 18 PM","18 - 20 PM","20 - 22 PM","22 - 24 PM"]
       
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 8
        }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let cell:timecell = self.tableview.dequeueReusableCell(withReuseIdentifier: "timecell", for: indexPath) as! timecell
        
        let dict1 = saat[indexPath.row]
        cell.lblTime?.text = dict1
    
    if indexPath.row == 0 {
        cell.offsetDirection = .right
       }
    
    if indexPath.row == 2 {
     cell.offsetDirection = .right
    }
    
    if indexPath.row == 4 {
     cell.offsetDirection = .right
    }
    if indexPath.row == 6 {
     cell.offsetDirection = .right
    }
    if indexPath.row == 8 {
        cell.offsetDirection = .right
       }
    if indexPath.row == 10 {
        cell.offsetDirection = .right
       }
    
    if indexPath.row == 1 {
     cell.offsetDirection = .left
    }
    if indexPath.row == 3 {
     cell.offsetDirection = .left
    }
   if indexPath.row == 5 {
    cell.offsetDirection = .left
   }
    if indexPath.row == 7 {
     cell.offsetDirection = .left
    }
    if indexPath.row == 9{
        cell.offsetDirection = .left
       }
    if indexPath.row == 11 {
        cell.offsetDirection = .left
       }
       
         return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           if let cell = tableview.cellForItem(at: indexPath) as? timecell {
               cell.select(animated: true)
            hidresok(cell: cell)
            
           
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            cell.hidecell()
//            }
//            reserve.isHidden = false
            
            if indexPath.row == 0 {
                saat1 = "0"
            }
            if indexPath.row == 1 {
                           saat1 = "1"
                       }
            if indexPath.row == 2 {
                           saat1 = "2"
                       }
            if indexPath.row == 3 {
                           saat1 = "3"
                       }
            if indexPath.row == 4 {
                           saat1 = "4"
                       }
            if indexPath.row == 5 {
                           saat1 = "5"
                       }
            if indexPath.row == 6 {
                           saat1 = "6"
                       }
            if indexPath.row == 7 {
                           saat1 = "7"
                       }
            if indexPath.row == 8 {
                           saat1 = "8"
                       }
            if indexPath.row == 9 {
                           saat1 = "9"
                       }
            if indexPath.row == 10 {
                           saat1 = "10"
                       }
            if indexPath.row == 11 {
                           saat1 = "11"
                       }
           
           }
        
       }
    
    
       
       func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        self.unhideee()

           if let cell = tableview.cellForItem(at: indexPath) as? timecell {
               cell.deselect(animated: true)
                 hidresok(cell: cell)
            
            
           }
       }
    
    

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 112)
       }
    
    
    
   func hidresok(cell: CB3DSelectCell) {

        
 
    
 
    print(cell.hidding)
  
        
        if cell.hidding == false {
            reserve.isHidden = false
        }else{
            reserve.isHidden = true
        }
        
    }

  
    @objc func methodOfReceivedNotification(notification: Notification) {
   
        
    reserve.isHidden = true
        
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
extension timeViewController: VAMonthViewAppearanceDelegate {
    
    func leftInset() -> CGFloat {
        return 10.0
    }
    
    func rightInset() -> CGFloat {
        return 10.0
    }
    
    func verticalMonthTitleFont() -> UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    func verticalMonthTitleColor() -> UIColor {
        return .black
    }
    
    func verticalCurrentMonthTitleColor() -> UIColor {
        return .red
    }
    
}
extension timeViewController: VADayViewAppearanceDelegate {
    
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
extension timeViewController: VACalendarViewDelegate {
    
    func selectedDate(_ date: Date) {
        didSelectDay?(date)
     let dateFormatter = DateFormatter()
 dateFormatter.dateFormat = "yyyy-MM-dd"
        let timee = dateFormatter.string(from: date)
      time = timee
        print(time)
    }
    
}
class timecell :CB3DSelectCell {
    @IBOutlet weak var lblTime: UILabel!

   
    
}
