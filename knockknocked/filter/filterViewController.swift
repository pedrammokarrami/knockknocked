//
//  filterViewController.swift
//  knockknocked
//
//  Created by pedram on 11/2/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit

class filterViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var finalidlang = ""
    var finalidgen = ""
    var counting = 0
    
    var countlang = 0
    var countgen = 0
    
    
    @IBOutlet var tedad: UILabel!
    
    @IBOutlet var arrlang: UIImageView!
    
    @IBOutlet var langstart: UIButton!
    
    @IBOutlet var genstart: UIButton!
    
    
    @IBOutlet var arrgen: UIImageView!
    
    @IBAction func clear(_ sender: Any) {
        clearlang()
    }
    
    func shomaresh () {
        counting = countgen + countlang
        tedad.text = "\(counting)"
    }
    
    

    @IBAction func langstart(_ sender: Any) {
       
  
      
   
        if tableview2.isHidden == false {
             self.genstart.sendActions(for: .touchUpInside)
        }
        
         
        let xPosition = genstart.frame.origin.x
                                  let yPosition = genstart.frame.origin.y + tableview1.frame.size.width // Slide Up - 20px

                                  let width = genstart.frame.size.width
                                  let height = genstart.frame.size.height
        
     

      
        
        let xPosition2 = genstart.frame.origin.x
        let yPosition2 = genstart.frame.origin.y - tableview1.frame.size.width // Slide Up - 20px

           let width2 = genstart.frame.size.width
           let height2 = genstart.frame.size.height
               
        
        let xPosition3 = arrgen.frame.origin.x
         let yPosition3 = arrgen.frame.origin.y + tableview1.frame.size.width // Slide Up - 20px

                  let width3 = arrgen.frame.size.width
                  let height3 = arrgen.frame.size.height
        
        let xPosition4 = arrgen.frame.origin.x
                let yPosition4 = arrgen.frame.origin.y - tableview1.frame.size.width // Slide Up - 20px

                         let width4 = arrgen.frame.size.width
                         let height4 = arrgen.frame.size.height
             
        
       
        
        UIView.animate(withDuration: 0.2) {
            if self.tableview1.isHidden == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                 self.arrlang.transform = CGAffineTransform(rotationAngle: .pi / 1)
                       self.tableview1.isHidden = false
                   }
//               self.tableview1.isHidden = false
         self.genstart.frame =  CGRect(x: xPosition, y: yPosition, width: width, height: height)
                
                 self.arrgen.frame =  CGRect(x: xPosition3, y: yPosition3, width: width3, height: height3)
               
            }else{
                 self.arrlang.transform = CGAffineTransform(rotationAngle: .pi / 180)
              self.tableview1.isHidden = true
//                self.tableview1.isHidden = true
                self.genstart.frame =  CGRect(x: xPosition2, y: yPosition2, width: width2, height: height2)
                
                 self.arrgen.frame =  CGRect(x: xPosition4, y: yPosition4, width: width4, height: height4)
               
            }
        }
        
    }
    
    
    
    
    
    
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func gen(_ sender: Any) {
         if tableview1.isHidden == false {
          self.langstart.sendActions(for: .touchUpInside)
        }
        let xPosition4 = tableview2.frame.origin.x
        let yPosition4 = genstart.frame.origin.y + 40// Slide Up - 20px

        let width4 = tableview2.frame.size.width
        let height4 = tableview2.frame.size.height
        
        if tableview2.isHidden == true {
        UIView.animate(withDuration: 0.2) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.arrgen.transform = CGAffineTransform(rotationAngle: .pi / 1)
                 self.tableview2.isHidden = false
            }
//        self.tableview2.isHidden = false
//            self.tableview2.isHidden = false
            self.tableview2.frame =  CGRect(x: xPosition4, y: yPosition4, width: width4, height: height4)
            }
            }else{
            self.arrgen.transform = CGAffineTransform(rotationAngle: .pi / 180)
            self.tableview2.isHidden = true
            
        }
    }
    
    
    
    @IBOutlet var lang: UIButton!
   
    
    @IBAction func lang(_ sender: Any) {
        
       
                           
              
    }
    
    @IBOutlet var gen: UIButton!
    
    @IBOutlet var tableview1: UITableView!
    
    @IBOutlet var tableview2: UITableView!
    
    
    var zaban = ["Persian","Engilish","Armenian"]
    var zabanid = ["1","2","3"]
    
    var jens = ["Male","Female"]
    var jensid = ["m","f"]
    
//    func rotate() {
//        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
//        rotation.toValue = NSNumber(value: Double.pi * 2)
//        rotation.duration = 2
//        rotation.isCumulative = true
//        rotation.repeatCount = Float.greatestFiniteMagnitude
//        self.layer.add(rotation, forKey: "rotationAnimation")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tedad.layer.cornerRadius = 9
        tedad.layer.masksToBounds = true
        tedad.text = "\(counting)"
        tableview1.isHidden = true
        tableview2.isHidden = true
       tableview1.delegate = self
       tableview1.dataSource = self
        
        tableview2.delegate = self
         tableview2.dataSource = self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        if tableView == tableview1 {
            return zaban.count
        }else{
            return jens.count
        }
           
           
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableview1 {
    
    let cell:filterlang = self.tableview1.dequeueReusableCell(withIdentifier: "filterlang") as! filterlang
            
              let dict1 = zaban[indexPath.row]
        
            cell.name?.text = dict1
            finalidlang = ""
           

            
            return cell
    
        }else{
            let cell:filtergen = self.tableview2.dequeueReusableCell(withIdentifier: "filtergen") as! filtergen
                       
                         let dict1 = jens[indexPath.row]
                   
                       cell.namegen?.text = dict1
            finalidgen = ""
           
            return cell
        }
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
               
               if tableView == tableview1 {
                 
                   
                     let dict1 = zabanid[indexPath.row]
                   finalidlang = dict1
                
               
             
                if countlang == 1 {
                    self.countlang = 0
                      self.shomaresh()
                }else{
                    self.countlang = 1
                                   self.shomaresh()
                }
                   
               }
               
        if tableView == tableview2 {
          
            
                                                    
                              let dict2 = jensid[indexPath.row]
                              finalidgen = dict2
            if countlang == 1 {
                self.countlang = 0
                  self.shomaresh()
            }else{
                self.countlang = 1
                               self.shomaresh()
            }

            
            
   
        }
        
        
        
    
               
           }
    

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
          if tableView == tableview1 {
                        

                         
                         finalidlang = ""
                     
                    
                 
                         
                     }
                     
              if tableView == tableview2 {
                   
                

                                                          
                                    finalidgen = ""
                  
                  
         
              }
              
              
    }
    
    func clearlang () {
        jens.removeAll()
     tableview2.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.jens = ["Male","Female"]
            self.countgen = 0
            self.shomaresh()

            self.tableview2.reloadData()
        }
    }
    

    
    @IBAction func filterr(_ sender: Any) {
        
       
        
        if finalidlang == ""{
             UserDefaults.standard.set("All", forKey: "prolang")
        }else{
             UserDefaults.standard.set(finalidlang, forKey: "prolang")
        }
        
        if finalidgen == ""{
            UserDefaults.standard.set("All", forKey: "progen")
        }else{
             UserDefaults.standard.set(finalidgen, forKey: "progen")
        }
        
   self.dismiss(animated: true, completion: nil)

    }
    

}


class filterlang: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    
   
    
    
}


class filtergen: UITableViewCell {
    
    @IBOutlet var namegen: UILabel!
    
    
}
