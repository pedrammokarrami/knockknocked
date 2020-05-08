//
//  businessfinalViewController.swift
//  knockknocked
//
//  Created by pedram on 11/8/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import GoogleMaps
import SwiftyJSON
import Alamofire


class businessfinalViewController: UIViewController , UITextFieldDelegate {
  
func textFieldDidBeginEditing(_ textField: UITextField) {
       UIView.animate(withDuration: 0.3, animations: {
           self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y - 200, width:self.view.frame.size.width, height:self.view.frame.size.height);
           
       })
   }
   
   func textFieldDidEndEditing(_ textField: UITextField) {
       UIView.animate(withDuration: 0.3, animations: {
           self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y + 200, width:self.view.frame.size.width, height:self.view.frame.size.height);
           
       })
   }
    
    var lat1 : Double = 0.0
    var long1 : Double = 0.0
    
    var lat2 : Double = 0.0
      var long2 : Double = 0.0
    var lat3 : Double = 0.0
      var long3 : Double = 0.0
    
    var serkind = ""
    
    
    @IBOutlet var insta: UITextField!
    
    @IBOutlet var neighbourhood: UITextField!
    
    @IBAction func freelancer(_ sender: Any) {
        if freelancer.isOn  {
        map2.isHidden = false
               map3.isHidden = false
               addresslabel2.isHidden = false
               addresslabel3.isHidden = false
        }else{
            map2.isHidden = true
                          map3.isHidden = true
                          addresslabel2.isHidden = true
                          addresslabel3.isHidden = true
        }
    }
    
    var btnn = 0
    
    @IBOutlet var freelancer: UISwitch!
    
    @IBOutlet var map1: UIButton!
    @IBOutlet var map2: UIButton!
    @IBOutlet var map3: UIButton!
    
    @IBOutlet var selectloc: UIButton!
    
    @IBAction func map1(_ sender: Any) {
        GoogleMapcontainer.isHidden = false
        mylocation.isHidden = false
        selectloc.isHidden = false
        btnn = 1
    }
   
    @IBAction func map2(_ sender: Any) {
        mylocation.isHidden = false

        GoogleMapcontainer.isHidden = false
        selectloc.isHidden = false
        btnn = 2
       }
    
    @IBAction func map3(_ sender: Any) {
        mylocation.isHidden = false

        GoogleMapcontainer.isHidden = false
        selectloc.isHidden = false
        btnn = 3
       }
    
    var con = ""
    var str = ""
    var cit = ""
    var locnam = ""
   func convertLatLongToAddress(latitude:Double,longitude:Double){

       let geoCoder = CLGeocoder()
       let location = CLLocation(latitude: latitude, longitude: longitude)
       geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in

           // Place details
           var placeMark: CLPlacemark!
           placeMark = placemarks?[0]

           // Location name
        
        if self.btnn == 1 {
           
            // Street address
            if let street = placeMark.thoroughfare {
                self.str = street
            }
            // City
            if let city = placeMark.subAdministrativeArea {
                self.cit = city
            }
            // Zip code
            
            // Country
            if  let country = placeMark.country {
                self.con = country
            }
            self.addresslabel1.text  = "\(self.con) \(self.cit) \(self.str)"
        }
        
        if self.btnn == 2 {
             
              // Street address
              if let street = placeMark.thoroughfare {
                  self.str = street
              }
              // City
              if let city = placeMark.subAdministrativeArea {
                  self.cit = city
              }
              // Zip code
              
              // Country
              if  let country = placeMark.country {
                  self.con = country
              }
              self.addresslabel2.text  = "\(self.con) \(self.cit) \(self.str)"
          }
        
        if self.btnn == 3 {
             
              // Street address
              if let street = placeMark.thoroughfare {
                  self.str = street
              }
              // City
              if let city = placeMark.subAdministrativeArea {
                  self.cit = city
              }
              // Zip code
              
              // Country
              if  let country = placeMark.country {
                  self.con = country
              }
              self.addresslabel3.text  = "\(self.con) \(self.cit) \(self.str)"
          }
           
       })

   }
    @IBAction func getlocation(_ sender: Any) {
        
       
              mylocation.isHidden = true
        GoogleMapcontainer.isHidden = true
        selectloc.isHidden = true
        let latitude = googleMapsView.camera.target.latitude
        let longitude = googleMapsView.camera.target.longitude
        centerMapCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
       
        if btnn == 1 {
            lat1 = latitude
            long1 = longitude
            convertLatLongToAddress(latitude: lat1, longitude: long1)
             UserDefaults.standard.set(lat1, forKey: "lat1")
            UserDefaults.standard.set(long1, forKey: "long1")
        
        }
        if btnn == 2 {
                   lat2 = latitude
                   long2 = longitude
             convertLatLongToAddress(latitude: lat2, longitude: long2)
            UserDefaults.standard.set(lat1, forKey: "lat1")
            UserDefaults.standard.set(long1, forKey: "long1")
             
               
               }
        if btnn == 3 {
                   lat3 = latitude
                   long3 = longitude
                convertLatLongToAddress(latitude: lat3, longitude: long3)
            UserDefaults.standard.set(lat1, forKey: "lat1")
            UserDefaults.standard.set(long1, forKey: "long1")
             
               }
      
    }
    
    
    
    @IBOutlet var addresslabel1: UILabel!
     @IBOutlet var addresslabel2: UILabel!
     @IBOutlet var addresslabel3: UILabel!
    
    @IBOutlet var mylocation: UIButton!
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    @IBAction func mylocation(_ sender: Any) {
            
            guard let lat = self.googleMapsView.myLocation?.coordinate.latitude,
                    let lng = self.googleMapsView.myLocation?.coordinate.longitude else { return }
    //        googleMapsView.camera =
            let camera = GMSCameraPosition.camera(withLatitude: lat ,longitude: lng , zoom: 15)
            self.googleMapsView.animate(to: camera)
            
            
  
              
            // 8
            locationManager.stopUpdatingLocation()
            
        }
    var centerMapCoordinate:CLLocationCoordinate2D!
   
    
    @IBOutlet weak var GoogleMapcontainer: UIView!
    
    
    var googleMapsView: GMSMapView!
    
    
   
    
    func googlemapss () {
         
                 
          let camera = GMSCameraPosition.camera(withLatitude: 35.7178, longitude: 51.3413, zoom: 12.0)
                 self.googleMapsView = GMSMapView(frame: self.GoogleMapcontainer.frame, camera: camera)
                 self.GoogleMapcontainer.addSubview(self.googleMapsView)
//                     self.googleMapsView.settings.myLocationButton = true
                 
              
             
                     self.googleMapsView.isMyLocationEnabled = true
        
                     locationManager.delegate = self
                     locationManager = CLLocationManager()
                     locationManager.desiredAccuracy = kCLLocationAccuracyBest
                     locationManager.requestAlwaysAuthorization()
                     locationManager.distanceFilter = 50
                     locationManager.startUpdatingLocation()
          
        
                 
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
    
    
    
    
    @IBAction func next(_ sender: Any) {
        
        if freelancer.isOn {
            serkind = "p"
            UserDefaults.standard.set(insta.text!, forKey: "instapro")
            UserDefaults.standard.set(neighbourhood.text!, forKey: "webpro")
            UserDefaults.standard.set(serkind, forKey: "serkind")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                let contactViewController = storyBoard.instantiateViewController(withIdentifier: "contactViewController") as! contactViewController
                                self.present(contactViewController, animated:true, completion:nil)

        }else{
            serkind = "i"
                       UserDefaults.standard.set(insta.text!, forKey: "instapro")
                       UserDefaults.standard.set(neighbourhood.text!, forKey: "webpro")
                       UserDefaults.standard.set(serkind, forKey: "serkind")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
  let bussinestimeslotViewController = storyBoard.instantiateViewController(withIdentifier: "bussinestimeslotViewController") as! bussinestimeslotViewController
      self.present(bussinestimeslotViewController, animated:true, completion:nil)
        }
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        googlemapss()
        GoogleMapcontainer.isHidden = true
       
        neighbourhood.delegate = self
        map2.isHidden = true
        map3.isHidden = true
        addresslabel2.isHidden = true
        addresslabel3.isHidden = true
        selectloc.isHidden = true
        mylocation.isHidden = true
      
    }
    
    func sendlocation (){
    let token = UserDefaults.standard.object(forKey: "token") as! String
          let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
        let paramer:Parameters = ["latitude":lat1,"longitude":long1]
         Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/provider_location/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
       
        
    
print(response)
          
          
           if response.response?.statusCode == 201{
         
            
            }
        }
    
        
    }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      self.view.endEditing(true)
  }

}

extension businessfinalViewController: CLLocationManagerDelegate {
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
       guard let location = locations.first else {
         return
       }
         
       // 7
       googleMapsView.camera = GMSCameraPosition(target: location.coordinate, zoom: 20, bearing: 0, viewingAngle: 0)
         
       // 8
       locationManager.stopUpdatingLocation()
     }
   
}
