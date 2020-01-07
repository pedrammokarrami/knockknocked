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



let imageKey = "image"

class firstpageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate, TransitionInfoProtocol{
   
    
    @IBOutlet var category: UIButton!
    
    func startloading() {
                 let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

                 let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
                 loadingIndicator.hidesWhenStopped = true
                 loadingIndicator.style = UIActivityIndicatorView.Style.gray
                 loadingIndicator.startAnimating();

                 alert.view.addSubview(loadingIndicator)
                 present(alert, animated: true, completion: nil)
             }
             func endloading() {
                 dismiss(animated: false, completion: nil)
                 
             }
    
    
    var locationManager = CLLocationManager()
       var currentLocation: CLLocation?
    
       
    @IBAction func sidemenu(_ sender: Any) {
         sideMenuController?.revealMenu()
        
    }
    
       
     
          @IBOutlet weak var GoogleMapcontainer: UIView!
    
    
    var googleMapsView: GMSMapView!
    
       var resultsArray = [String]()
    
   
    
    
    @IBOutlet weak var tableview: UICollectionView!
    
   
    let data = [[imageKey: "1"],[imageKey: "2"],[imageKey: "3"],[imageKey: "4"]]
    var lastSelectedIndexPath: IndexPath?
    
    var userpics = [String]()
     var names = [String]()
     var prices = [Int]()
    var catnames = [String]()
    
    
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
                
               
            
    func server() {
        let header:HTTPHeaders = ["accept":"application/json"]
        Alamofire.request("http://dev.hoonamapps.com/telemarket/api/v0/provider", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
         print(response)
          if response.response?.statusCode == 200{
              
            self.endloading()
             let jsonData1 = JSON(response.result.value!)
            print(jsonData1)
             let avatar =  jsonData1["list"].arrayValue.map ({$0["provider"]["avatar"].stringValue})
            let username =  jsonData1["list"].arrayValue.map ({$0["provider"]["username"].stringValue})
            let gheymat =  jsonData1["list"].arrayValue.map ({$0["price"].intValue})
            let cat =  jsonData1["list"].arrayValue.map ({$0["service"]["title"].stringValue})
            let lati =  jsonData1["list"].arrayValue.map ({$0["latitude"].doubleValue})
             let longi =  jsonData1["list"].arrayValue.map ({$0["longitude"].doubleValue})
            
             let jsonData2 = JSON(response.result.value!)["list" ].arrayValue
            for latitude in jsonData2 {
                let data = latitude["latitude"].doubleValue
                let latitudess = lat (data: data)
            self.lats.append(latitudess)
                
            }
            
            for longitude in jsonData2 {
                           let data2 = longitude["longitude"].doubleValue
                         let data1 = longitude["latitude"].doubleValue
                           let cordss = coord (lattt: data1, longgg: data2)
                       self.coords.append(cordss)
                print(cordss)
                           
                       }
            
            self.catnames = cat
            self.prices = gheymat
            self.names = username
            self.userpics = avatar
             self.tableview.reloadData()
            self.googlemapss()
            }
        }
        
    }
    
    func googlemapss () {
       
               
        let camera = GMSCameraPosition.camera(withLatitude: 35.7178, longitude: 51.3413, zoom: 2.0)
               self.googleMapsView = GMSMapView(frame: self.GoogleMapcontainer.frame, camera: camera)
               self.GoogleMapcontainer.addSubview(self.googleMapsView)
                   self.googleMapsView.settings.myLocationButton = true
               
            
               googleMapsView.padding = UIEdgeInsets(top: 0, left: 0, bottom: tableview.frame.origin.x , right: 20)
                   self.googleMapsView.isMyLocationEnabled = true
                   locationManager.delegate = self
                   locationManager = CLLocationManager()
                   locationManager.desiredAccuracy = kCLLocationAccuracyBest
                   locationManager.requestAlwaysAuthorization()
                   locationManager.distanceFilter = 50
                   locationManager.startUpdatingLocation()
        
        for state in coords{
                          
                          let state_marker = GMSMarker()
                          state_marker.position = CLLocationCoordinate2D(latitude: state.lattt, longitude: state.longgg)
                          state_marker.map = googleMapsView
            state_marker.icon = UIImage(named: "marker")
                          
                       
                      }
               
                  do {
                       // Set the map style by passing the URL of the local file.
                       if let styleURL = Bundle.main.url(forResource: "map_style", withExtension: "json") {
                           googleMapsView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)

                       } else {
                           NSLog("Unable to find style.json")
                       }
                   } catch {
                       NSLog("pedrammm \(error)")
                   }
                   
    }
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startloading()
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
        
        
           if let categorys = UserDefaults.standard.object(forKey: "category") {
            category.setTitle(categorys as! String, for: .normal)
        }
  
      
    }
    
    
    
    
    fileprivate let identifer = "productCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return names.count
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                 
        let cell:firstpageViewCell = self.tableview.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! firstpageViewCell
        
        
//        cell.userface.image = UIImage(named: esm[indexPath.row])
        
        let dict1 = names[indexPath.row]
                                          
       cell.username?.text = dict1
        
        let dict2 = catnames[indexPath.row]
                                           
        cell.catname?.text = dict2

       
        let dict3 = prices[indexPath.row]
                                           
        cell.price?.text = "$\(dict3)/h"
       
     
         return cell
    }
  
    
    
    
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let cell:firstpageViewCell = self.tableview.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath) as! firstpageViewCell
        
     
    }
    
    
  
   
        
      
          
          func copyForView(_ subView: UIView) -> UIView {
            
              let cell: firstpageViewCell
            
           if tableview.indexPathsForSelectedItems != nil {
              cell = tableview.cellForItem(at: lastSelectedIndexPath!) as! firstpageViewCell
            } else {
                cell = tableview.cellForItem(at: lastSelectedIndexPath!) as! firstpageViewCell
            }
            return UIImageView(image: cell.userface.image)
              
          }
    
    func viewsToAnimate() -> [UIView] {
                  let cell: firstpageViewCell
           if tableview.indexPathsForSelectedItems != nil {
                          cell = tableview.cellForItem(at: lastSelectedIndexPath!) as! firstpageViewCell
                        } else {
                            cell = tableview.cellForItem(at: lastSelectedIndexPath!) as! firstpageViewCell
                        }
                        
           return [cell.userface]
             }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         if let indexPath = tableview.indexPath(for: sender as! UICollectionViewCell) {
                    
                  lastSelectedIndexPath = indexPath
                   let detailViewController = segue.destination as! detailViewController
                       detailViewController.appData = data[indexPath.row]
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
       googleMapsView.isMyLocationEnabled = true
       googleMapsView.settings.myLocationButton = true
     }
     
     // 6 
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       guard let location = locations.first else {
         return
       }
         
       // 7
       googleMapsView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
         
       // 8
       locationManager.stopUpdatingLocation()
     }
   
}


class firstpageViewCell: UICollectionViewCell {
    
    
    @IBOutlet var username: UILabel!
    
    @IBOutlet var catname: UILabel!
    
    @IBOutlet var price: UILabel!
    
    
    
    @IBOutlet var userface: UIImageView!
    
}
