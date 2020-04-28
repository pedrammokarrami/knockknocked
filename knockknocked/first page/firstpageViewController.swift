//
//  firstpageViewController.swift
//  knock knocked
//
//  Created by pedram on 7/15/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import GoogleMaps
import SDWebImage
import SideMenuSwift
import Lottie
import Firebase


let imageKey = "image"

class firstpageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate, TransitionInfoProtocol{
   
    
    @IBOutlet var category: UIButton!
    
    @IBOutlet var namename: UILabel!
    
    @IBOutlet var nametest: UILabel!
    
     var hud = LottieHUD("loading")
    

    var latcamrea = 35.7178
    var longcamera = 51.3109
    
    var locationManager = CLLocationManager()
       var currentLocation: CLLocation?
    
       
    @IBAction func sidemenu(_ sender: Any) {
         sideMenuController?.revealMenu()
        
    }
    
    @IBAction func mylocation(_ sender: Any) {
        
        guard let lat = self.googleMapsView.myLocation?.coordinate.latitude,
                let lng = self.googleMapsView.myLocation?.coordinate.longitude else { return }
//        googleMapsView.camera =
        let camera = GMSCameraPosition.camera(withLatitude: lat ,longitude: lng , zoom: 15)
        self.googleMapsView.animate(to: camera)
        
        
          
        // 8
        locationManager.stopUpdatingLocation()
        
    }
    
     
          @IBOutlet weak var GoogleMapcontainer: UIView!
    
    
    var googleMapsView: GMSMapView!
    
       var resultsArray = [String]()
    
    func getcentrloc () {
        let latitude = googleMapsView.camera.target.latitude
               let longitude = googleMapsView.camera.target.longitude
        
        UserDefaults.standard.set(latitude, forKey: "latpro")
        UserDefaults.standard.set(longitude, forKey: "longpro")

    }
    
    
    @IBOutlet weak var tableview: UICollectionView!
    
   
    let data = [[imageKey: "1"],[imageKey: "2"],[imageKey: "3"],[imageKey: "4"],[imageKey: "4"],[imageKey: "4"],[imageKey: "4"],[imageKey: "4"],[imageKey: "4"],[imageKey: "4"]]
    var lastSelectedIndexPath: IndexPath?
    
    var userpics = [String]()
     var names = [String]()
    var famales = [String]()
     var prices = [Int]()
    var catnames = [String]()
     var despro = [String]()
    var idpros = [Int]()
     var idpros1 = [Int]()
    var likepro = [Int]()
    var orderpro = [Int]()
      var qulitypro = [Int]()
    
    
    
    struct lat{
           var data : Double
       }
    
    struct long{
        var data : Double
    }
    
    struct coord{
        var lattt : Double
        var longgg : Double
    }
    
    
      var coords = [coord]()
    
    var lats = [lat]()

    var longs = [long]()
                
    func clean() {
        names.removeAll()
        userpics.removeAll()
        prices.removeAll()
        catnames.removeAll()
        coords.removeAll()
        lats.removeAll()
        longs.removeAll()
        tableview.reloadData()
    }
            
    func server() {
        clean()
       
        let header:HTTPHeaders = ["accept":"application/json"]
        Alamofire.request("http://dev.hoonamapps.com/telemarket/api/v0/provider", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
         
          if response.response?.statusCode == 200{
              
            self.hud.stopHUD()
          
             let jsonData1 = JSON(response.result.value!)
//            print(jsonData1)
             let avatar =  jsonData1["list"].arrayValue.map ({$0["user"]["avatar"].stringValue})
            let username =  jsonData1["list"].arrayValue.map ({$0["user"]["first_name"].stringValue})
             let lastnam =  jsonData1["list"].arrayValue.map ({$0["user"]["last_name"].stringValue})
            let gheymat =  jsonData1["list"].arrayValue.map ({$0["price"].intValue})
            let cat =  jsonData1["list"].arrayValue.map ({$0["service"]["title"].stringValue})
            let id =  jsonData1["list"].arrayValue.map ({$0["user"]["id"].intValue})
            
             let idpp =  jsonData1["list"].arrayValue.map ({$0["id"].intValue})
            
             let description =  jsonData1["list"].arrayValue.map ({$0["description"].stringValue})
             let likes =  jsonData1["list"].arrayValue.map ({$0["likes"].intValue})
            let order_count =  jsonData1["list"].arrayValue.map ({$0["order_count"].intValue})
            let quality =  jsonData1["list"].arrayValue.map ({$0["quality"].intValue})
            
                     
          
           

            
            
            let jsonData2 = JSON(response.result.value!)["list"].arrayValue
            for latitude in jsonData2 {
                let data = latitude["locations"]["latitude"].doubleValue
                let latitudess = lat (data: data)
            self.lats.append(latitudess)

            }
            print(jsonData2)
            
            for longitude in jsonData2 {
                           let data2 = longitude["locations"]["longitude"].doubleValue
                         let data1 = longitude["latitude"].doubleValue
                           let cordss = coord (lattt: data1, longgg: data2)
                       self.coords.append(cordss)


                       }
            
            self.qulitypro = quality
//            self.idpros = order_count
            self.idpros1 = idpp
            self.despro = description
            self.likepro = likes
            self.idpros = id
            self.catnames = cat
            self.prices = gheymat
            self.names = username
            self.userpics = avatar
            self.famales = lastnam
             self.tableview.reloadData()
            self.googlemapss()
            }
        }
        
    }
    
    func server1() {
      clean()
          let categorys = UserDefaults.standard.object(forKey: "categoryid") as! Int
       
      
        let header:HTTPHeaders = ["accept":"application/json"]
       Alamofire.request("http://dev.hoonamapps.com/telemarket/api/v0/provider/?service=\(categorys)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
 
         if response.response?.statusCode == 200{
             
       self.hud.stopHUD()
            let jsonData1 = JSON(response.result.value!)
          
            let avatar =  jsonData1["list"].arrayValue.map ({$0["user"]["avatar"].stringValue})
           let username =  jsonData1["list"].arrayValue.map ({$0["user"]["first_name"].stringValue})
                       let lastnam =  jsonData1["list"].arrayValue.map ({$0["user"]["last_name"].stringValue})
           let gheymat =  jsonData1["list"].arrayValue.map ({$0["price"].intValue})
           let cat =  jsonData1["list"].arrayValue.map ({$0["service"]["title"].stringValue})
           let id =  jsonData1["list"].arrayValue.map ({$0["user"]["id"].intValue})
            let idpp =  jsonData1["list"].arrayValue.map ({$0["id"].intValue})

            let description =  jsonData1["list"].arrayValue.map ({$0["description"].stringValue})
                       let likes =  jsonData1["list"].arrayValue.map ({$0["likes"].intValue})
                      let order_count =  jsonData1["list"].arrayValue.map ({$0["order_count"].intValue})
                      let quality =  jsonData1["list"].arrayValue.map ({$0["quality"].intValue})
                              
            
           let jsonData2 = JSON(response.result.value!)["list"].arrayValue
            print(jsonData2)
           for latitude in jsonData2 {
               let data = latitude["latitude"].doubleValue
               let latitudess = lat (data: data)
           self.lats.append(latitudess)
               
           }
           
           for longitude in jsonData2 {
                          let data2 = longitude["locations"]["longitude"].doubleValue
                        let data1 = longitude["locations"]["latitude"].doubleValue
                          let cordss = coord (lattt: data1, longgg: data2)
                      self.coords.append(cordss)
            
                          
                      }
            
            self.qulitypro = quality
            self.idpros = order_count
            self.despro = description
            self.likepro = likes
            self.idpros = id
           self.catnames = cat
           self.prices = gheymat
           self.names = username
            self.famales = lastnam
self.idpros1 = idpp
           self.userpics = avatar
            self.tableview.reloadData()
           self.googlemapss()
           }
       }
       
    }
    
    
    
    func googlemapss () {
       self.googleMapsView = GMSMapView(frame: self.GoogleMapcontainer.frame)
           self.GoogleMapcontainer.addSubview(self.googleMapsView)
        let camera = GMSCameraPosition.camera(withLatitude: latcamrea, longitude: longcamera, zoom: 12.0)
         
//        self.googleMapsView = GMSMapView(frame: self.GoogleMapcontainer.frame, camera: camera)
           
         
        self.googleMapsView.camera = camera
        self.googleMapsView.animate(to: camera)
      
        
            
       
                   self.googleMapsView.settings.myLocationButton = true
               
            
               googleMapsView.padding = UIEdgeInsets(top: 0, left: 0, bottom: tableview.frame.origin.x , right: 20)
                   self.googleMapsView.isMyLocationEnabled = true
                  
        
        for state in coords{
                          
                          let state_marker = GMSMarker()
                          state_marker.position = CLLocationCoordinate2D(latitude: state.lattt, longitude: state.longgg)
            
           
                          state_marker.map = googleMapsView
            state_marker.icon = UIImage(named: "marker1")
                          
                       
                      }
               
                  do {
                       // Set the map style by passing the URL of the local file.
                       if let styleURL = Bundle.main.url(forResource: "map_style", withExtension: "json") {
                           googleMapsView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)

                       } else {
                           NSLog("Unable to find style.json")
                       }
                   } catch {
                     
                   }
                   
    }
    
     var fcm1 = ""
      

      func serverpush() {

             let token = UserDefaults.standard.object(forKey: "token") as! String

                    let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
           let uuid = UUID().uuidString
       
        let userid = UserDefaults.standard.object(forKey: "userid") as! Int
        let paramer:Parameters = ["device_id":uuid,"registration_id":fcm1,"type":"ios","user":userid]
             Alamofire.request("http://dev.hoonamapps.com/telemarket/api/v0/notification/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
           
             print(response)
             
           print("pediiii")
                
                print(paramer)
print(response.response?.statusCode)
             
               if response.response?.statusCode == 201{
                   
                
    
                   
               }
               }
           }
    
    @objc func methodOfReceivedNotificationmap(notification: Notification) {
        sideMenuController?.hideMenu()
    if  let camlat = UserDefaults.standard.object(forKey: "camlat") {
               self.latcamrea = camlat as! Double
               
           }
            if let camlong = UserDefaults.standard.object(forKey: "camlong"){
               self.longcamera = camlong as! Double
                
               
           }
          self.googlemapss()

         
     }
     

     override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
        
        
        
         NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotificationmap(notification:)), name: Notification.Name("NotificationIdentifiermap"), object: nil)
        
       
        
     server()
        
    let categorys = UserDefaults.standard.object(forKey: "category") as! String
             
    category.setTitle(categorys, for: .normal)
        if categorys == "All services" {
                   
                   }else{
           server1()
                       
                   }
    
         
    }
     var nameecategory = "All services"
    
    
     @objc func methodOfReceivedNotification(notification: Notification) {
        
    }
    
    let actionSheetDemo = listViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InstanceID.instanceID().instanceID { (result, error) in
                 if let error = error {
                   print("Error fetching remote instance ID: \(error)")
                 } else if let result = result {
                   print("Remote instance ID token: \(result.token)")
                   self.fcm1 = "\(result.token)"
                   
                    self.serverpush()
                 }
               }
        
         hud.showHUD()
        

         category.setTitle("All services", for: .normal)
//        startloading()
        server()
        
        SideMenuController.preferences.basic.position = .sideBySide

        
            
        tableview.delegate = self
        tableview.dataSource = self
          let cellSize = CGSize(width:200 , height:100)

                 let layout = UICollectionViewFlowLayout()
                 layout.scrollDirection = .horizontal
                 layout.itemSize = cellSize
                 layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                 layout.minimumLineSpacing = 15.0
                 layout.minimumInteritemSpacing = 1.0
                 tableview.setCollectionViewLayout(layout, animated: true)
                 tableview.reloadData()
        
        
          locationManager = CLLocationManager()
             locationManager.desiredAccuracy = kCLLocationAccuracyBest
             locationManager.requestAlwaysAuthorization()
             locationManager.distanceFilter = 50
             locationManager.startUpdatingLocation()
         locationManager.delegate = self
  
      
    }
    
    
    
    
    fileprivate let identifer = "productCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return names.count
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                 
        let cell:firstpageViewCell = self.tableview.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! firstpageViewCell
        
        
//        cell.userface.image = UIImage(named: esm[indexPath.row])
        
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
      
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.5, height: 1.0)//CGSizeMake(0, 2.0);
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
       
        
        let dict1 = names[indexPath.row]
        let dict11 = famales[indexPath.row]
        let namefamil = "\(dict1) \(dict11)"
       
                                          
       cell.username?.text = namefamil
        
        let dict2 = catnames[indexPath.row]
                                           
        cell.catname?.text = dict2

       
        let dict3 = prices[indexPath.row]
                                           
        cell.price?.text = "$\(dict3)/h"
       
     
         return cell
    }
  
    
    
    
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let cell:firstpageViewCell = self.tableview.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath) as! firstpageViewCell
        getcentrloc()
         let dict1 = names[indexPath.row]
        let dict2 = famales[indexPath.row]
         let namefamil = "\(dict1) \(dict2)"
        UserDefaults.standard.set(namefamil, forKey: "proname")
     let dict3 = idpros[indexPath.row]
        
         let dict9 = idpros1[indexPath.row]
        UserDefaults.standard.set(dict9, forKey: "idpro1")
        
        
        UserDefaults.standard.set(dict3, forKey: "idpro")
        
        let dict4 = catnames[indexPath.row]
        UserDefaults.standard.set(dict4, forKey: "catpro")
        
        let dict5 = despro[indexPath.row]
        UserDefaults.standard.set(dict5, forKey: "despro")
        
//        let dict6 = qulitypro[indexPath.row]
        UserDefaults.standard.set(0, forKey: "qulitypro")
        
//        let dict7 = orderpro[indexPath.row]
        UserDefaults.standard.set(0, forKey: "orderpro")
        
        
//        let dict8 = likepro[indexPath.row]
        UserDefaults.standard.set(0, forKey: "likepro")
        
        
        
    }
    
    
 
   
        
      
          
          func copyForView(_ subView: UIView) -> UIView {
            
              let cell: firstpageViewCell
            
         cell = tableview.cellForItem(at: lastSelectedIndexPath!) as! firstpageViewCell
            return UIImageView(image: cell.userface.image)
              
          }
    
    func viewsToAnimate() -> [UIView] {
        
        
                  let cell: firstpageViewCell
           cell = tableview.cellForItem(at: lastSelectedIndexPath!) as! firstpageViewCell
                        
           return [cell.userface]
             }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         if segue.identifier == "next"{
      
            
            
         if let indexPath = tableview.indexPath(for: sender as! UICollectionViewCell) {
                    
                  lastSelectedIndexPath = indexPath
                   let detailViewController = segue.destination as! detailViewController
                       detailViewController.appData = data[indexPath.row]
               }
    
         }
    }
  public  func catname2() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
             let categorys = UserDefaults.standard.object(forKey: "category") as! String
           
            
        }
    if nameecategory == "All" {
                   
               }else{
                  print(nameecategory)
                   
               }
           
        }
    
      
       
    
}

extension firstpageViewController: CLLocationManagerDelegate {
     func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       // 3
       guard status == .authorizedWhenInUse else {
         return
       }
       // 4
       locationManager.startUpdatingLocation()
         
       //5
//       googleMapsView.isMyLocationEnabled = true
//       googleMapsView.settings.myLocationButton = true
     }
     
    
    
     // 6 
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        

       // 7
//       googleMapsView.camera = GMSCameraPosition(target: location.coordinate, zoom: 20, bearing: 0, viewingAngle: 0)
         
       // 8
        
        let location: CLLocation = locations.last!
        print("Location: \(location)")

        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: 20)
   
       
       
       locationManager.stopUpdatingLocation()
     }
   
}


class firstpageViewCell: UICollectionViewCell {
    
    
    @IBOutlet var username: UILabel!
    
    @IBOutlet var catname: UILabel!
    
    @IBOutlet var price: UILabel!
    
    
    
    @IBOutlet var userface: UIImageView!
    
    
    
}
