//
//  uploadimageViewController.swift
//  knockknocked
//
//  Created by pedram on 12/3/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class uploadimageViewController: UIViewController, UITextFieldDelegate {

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
    
    
    var imagepic: UIImage? = nil
    
    @IBAction func back(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
        }
    
     var imagePicker = UIImagePickerController()
        
    @IBAction func reg(_ sender: Any) {
        
        if name.text?.isEmpty ?? true {
                                                             let animation = CABasicAnimation(keyPath: "position")
                                                             animation.duration = 0.07
                                                             animation.repeatCount = 4
                                                             animation.autoreverses = true
                                                             animation.fromValue = NSValue(cgPoint: CGPoint(x: name.center.x - 10, y: name .center.y))
                                                             animation.toValue = NSValue(cgPoint: CGPoint(x: name.center.x + 10, y: name.center.y))
                                                             
                                                             name.layer.add(animation, forKey: "position")
                        }else{
                            server()
                        }
                  
    }
    
    func server() {
        let token = UserDefaults.standard.object(forKey: "token") as! String

               let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
        
        let imageData = imagepic!.jpegData(compressionQuality: 0.50)!
        let param: [String:Any] = ["first_name":name.text!]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData, withName: "file", fileName: "swift_file.png", mimeType: "image/png")
                for (key, value) in param {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                }
            }, to: "http://dev.hoonamapps.com/telemarket/api/v0/user/avatar/",headers: header)
            { (result) in
                switch result {
                case .success(let upload, _, _):

                    upload.uploadProgress(closure: { (progress) in
                        //Print progress
                        print("uploading \(progress)")
                        

                    })

                    upload.responseJSON { response in
                        //print response.result

                    }
                case .failure( _): break
                    //print encodingError.description
                }
            }
        
        
        
    }
    
    @IBOutlet var transfer: UIButton!
    
    
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
        
        
        @IBOutlet var okview: UIView!
    
    @IBAction func av1(_ sender: Any) {
           
           userimage.setBackgroundImage(UIImage(named: "av1"), for: .normal)
        
        self.imagepic = UIImage(named: "av1")
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
       
     @IBOutlet var name: UITextField!
        
        @IBOutlet var userimage: UIButton!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userimage.setBackgroundImage(UIImage(named: "camera1"), for: .normal)
        name.delegate = self
    }
    

    @IBAction func btnChooseImageOnClick(_ sender: UIButton) {
              
              let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
              alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
                  self.openCamera()
              }))
        
        alert.addAction(UIAlertAction(title: "Choose Avatar", style: .default, handler: { _ in
            self.avatar()
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
    func avatar (){
        animateIn()
    }
    
    
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

      extension uploadimageViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
          func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
              /*
               Get the image from the info dictionary.
               If no need to edit the photo, use `UIImagePickerControllerOriginalImage`
               instead of `UIImagePickerControllerEditedImage`
               */
            
          
              
              //Dismiss the UIImagePicker after selection
            
            let imagee = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
            userimage.setBackgroundImage(imagee, for: .normal)
            
            self.imagepic = imagee
           
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

