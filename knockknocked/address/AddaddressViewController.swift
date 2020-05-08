//
//  AddaddressViewController.swift
//  knockknocked
//
//  Created by pedram on 11/12/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import GoogleMaps
import SwiftyJSON
import Alamofire
import CoreLocation


class AddaddressViewController: UIViewController, UITextFieldDelegate {
      var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
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
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    
  
    
    
     func server() {
let token = UserDefaults.standard.object(forKey: "token") as! String
          let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
        let paramer:Parameters = ["latitude":lat1,"longitude":long1,"name":titleadd.text!]
         Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/user_favorite/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
       
         print(response)
    

          
          
           if response.response?.statusCode == 201{
               
            
            
             
             
                let jsonObject = JSON(response.result.value!)
               print(jsonObject)
            

            let alertController = UIAlertController(title: "Congratulatios...", message: "Your address has been successfully registered", preferredStyle:UIAlertController.Style.alert)
                       
                       
                       let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                           
                           
                           
                           
                           print("you have pressed OK button");
                       }
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true, completion:{ () -> Void in
                    })
               
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
    
  
  
       
    var lat1 : Double = 0.0
       var long1 : Double = 0.0
    
    var con = ""
       var str = ""
       var cit = ""
       var locnam = ""
 
      
    
    
    
    
    @IBAction func getlocation(_ sender: Any) {
           
          
        reg.isHidden = false
        titleadd.isHidden = false
          
         
           let latitude = googleMapsView.camera.target.latitude
           let longitude = googleMapsView.camera.target.longitude
           centerMapCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
          
         lat1 = latitude
         long1 = longitude
         convertLatLongToAddress(latitude: lat1, longitude: long1)
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
      var centerMapCoordinate:CLLocationCoordinate2D!
     
      
      @IBOutlet weak var GoogleMapcontainer: UIView!
      
      
      var googleMapsView: GMSMapView!
      
      
     
      
      func googlemapss () {
           
                   
            let camera = GMSCameraPosition.camera(withLatitude: 35.7178, longitude: 51.3413, zoom: 12.0)
                   self.googleMapsView = GMSMapView(frame: self.GoogleMapcontainer.frame, camera: camera)
                   self.GoogleMapcontainer.addSubview(self.googleMapsView)
//                       self.googleMapsView.settings.myLocationButton = true
                   
                
               
                       self.googleMapsView.isMyLocationEnabled = true
          
//                       locationManager = CLLocationManager()
//                       locationManager.desiredAccuracy = kCLLocationAccuracyBest
//                       locationManager.requestAlwaysAuthorization()
//                       locationManager.distanceFilter = 50
//                       locationManager.startUpdatingLocation()
           
          
                   
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
   
    override func viewDidLoad() {
        super.viewDidLoad()
   
              locationManager = CLLocationManager()
              locationManager.desiredAccuracy = kCLLocationAccuracyBest
              locationManager.requestAlwaysAuthorization()
              locationManager.distanceFilter = 50
              locationManager.startUpdatingLocation()
              locationManager.delegate = self
  

        reg.isHidden = true
              titleadd.isHidden = true
        googlemapss()
         titleadd.delegate = self
       
    }
    
    @IBOutlet var reg: UIButton!
    
    @IBAction func reg(_ sender: Any) {
         self.view.endEditing(true)
        
        if titleadd.text?.isEmpty ?? true {
                                       let animation = CABasicAnimation(keyPath: "position")
                                       animation.duration = 0.07
                                       animation.repeatCount = 4
                                       animation.autoreverses = true
                                       animation.fromValue = NSValue(cgPoint: CGPoint(x: titleadd.center.x - 10, y: titleadd.center.y))
                                       animation.toValue = NSValue(cgPoint: CGPoint(x: titleadd.center.x + 10, y: titleadd.center.y))
                                       
                                       titleadd.layer.add(animation, forKey: "position")
        }else{
        server()
        }
    }
    
    
    @IBOutlet var titleadd: UITextField!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}



extension AddaddressViewController: CLLocationManagerDelegate {

    func convertLatLongToAddress(latitude:Double,longitude:Double){

        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in

            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]

            // Location name
         
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
         
       
         
       
            
        })

    }
    
  // Handle incoming location events.
    
   
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
 

//    let latitude = googleMapsView.camera.target.latitude
//      let longitude = googleMapsView.camera.target.longitude
  
    
//    convertLatLongToAddress(latitude: latitude, longitude: longitude)
    

  
  

  }

 
  // Handle authorization for the location manager.
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .restricted:
      print("Location access was restricted.")
    case .denied:
      print("User denied access to location.")
      // Display the map using the default location.
    case .notDetermined:
      print("Location status not determined.")
    case .authorizedAlways: fallthrough
    case .authorizedWhenInUse:
      print("Location status is OK.")
    }
  }

  // Handle location manager errors.
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//    locationManager.stopUpdatingLocation()
    print("Error: \(error)")
  }
}
