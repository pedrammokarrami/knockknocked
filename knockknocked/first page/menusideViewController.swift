//
//  menusideViewController.swift
//  knockknocked
//
//  Created by pedram on 11/14/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class menusideViewController: UIViewController {
    
    
    var imagePicker = UIImagePickerController()
        
    @IBOutlet var okview: UIView!
    
    func animateOut() {
        
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.okview?.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            //self.transView?.alpha = 0
        }) { (success:Bool) in
            self.okview?.removeFromSuperview()
        }
    }
        func animateIn() {
            
            self.view.addSubview(okview!)
            okview?.center = view.center 
            okview?.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            
            UIView.animate(withDuration: 0.4) {
                //self.transView?.alpha = 0.5
                self.okview?.transform = CGAffineTransform.identity
            }
        }
    
     func server() {
    let token = UserDefaults.standard.object(forKey: "token") as! String
              let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
            let paramer:Parameters = ["latitude":""]
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
    
    @IBAction func av1(_ sender: Any) {
        
        userimage.setBackgroundImage(UIImage(named: "av1"), for: .normal)
        animateOut()
    }
    @IBAction func av2(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av2"), for: .normal)
               animateOut()
     }
    @IBAction func av3(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av3"), for: .normal)
               animateOut()
     }
    @IBAction func av4(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av4"), for: .normal)
               animateOut()
     }
    @IBAction func av5(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av5"), for: .normal)
               animateOut()
     }
    @IBAction func av6(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av6"), for: .normal)
               animateOut()
     }
    @IBAction func av7(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av7"), for: .normal)
               animateOut()
     }
    @IBAction func av8(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av8"), for: .normal)
               animateOut()
     }
    @IBAction func av9(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av9"), for: .normal)
               animateOut()
     }
    @IBAction func av10(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av10"), for: .normal)
               animateOut()
     }
    @IBAction func av11(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av11"), for: .normal)
               animateOut()
     }
    @IBAction func av12(_ sender: Any) {
        userimage.setBackgroundImage(UIImage(named: "av12"), for: .normal)
               animateOut()
     }
    
    @IBOutlet var userimage: UIButton!
    
    @IBAction func userimage(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func btnChooseImageOnClick(_ sender: UIButton) {
               
               let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
               alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
                   self.openCamera()
               }))
           
           alert.addAction(UIAlertAction(title: "Take from avatar", style: .default, handler: { _ in
               
               self.animateIn()
                         
                      }))
               
               alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { _ in
                   self.openGallary()
               }))
               
               alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
               
               //If you want work actionsheet on ipad then you have to use popoverPresentationController to present the actionsheet, otherwise app will crash in iPad
               switch UIDevice.current.userInterfaceIdiom {
               case .pad:
                   alert.popoverPresentationController?.sourceView = sender
                   alert.popoverPresentationController?.sourceRect = sender.bounds
                   alert.popoverPresentationController?.permittedArrowDirections = .up
               default:
                   break
               }
               
               self.present(alert, animated: true, completion: nil)
           }
           
           //MARK: - Open the camera
           func openCamera(){
               if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
                   imagePicker.sourceType = UIImagePickerController.SourceType.camera
                   //If you dont want to edit the photo then you can set allowsEditing to false
                   imagePicker.allowsEditing = true
                   imagePicker.delegate = self
                   self.present(imagePicker, animated: true, completion: nil)
               }
               else{
                   let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
               }
           }
           
           //MARK: - Choose image from camera roll
           
           func openGallary(){
               imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
               //If you dont want to edit the photo then you can set allowsEditing to false
               imagePicker.allowsEditing = true
               imagePicker.delegate = self
               self.present(imagePicker, animated: true, completion: nil)
           }
       }

       //MARK: - UIImagePickerControllerDelegate

       extension menusideViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
           func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
               /*
                Get the image from the info dictionary.
                If no need to edit the photo, use `UIImagePickerControllerOriginalImage`
                instead of `UIImagePickerControllerEditedImage`
                */
            if let pickedImage = info[.originalImage] as? UIImage {
                // imageViewPic.contentMode = .scaleToFill
//                self.imagePicker = pickedImage
                self.userimage.setBackgroundImage(pickedImage, for: .normal)

            }
          

            
           
            
               
               //Dismiss the UIImagePicker after selection
               picker.dismiss(animated: true, completion: nil)
           }
           
           func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
               picker.isNavigationBarHidden = false
               self.dismiss(animated: true, completion: nil)
           }
           
           override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
               self.animateOut()
               self.view.endEditing(true)
           }

           
       }
