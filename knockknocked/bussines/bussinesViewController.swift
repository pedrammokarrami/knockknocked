//
//  bussinesViewController.swift
//  knockknocked
//
//  Created by pedram on 11/1/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import DropDown





class bussinesViewController: UIViewController, UITextFieldDelegate {
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        userimage.isHidden = true
          UIView.animate(withDuration: 0.3, animations: {
              self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y - 200, width:self.view.frame.size.width, height:self.view.frame.size.height);
            
              
          })
      }
      
    func textFieldDidEndEditing(_ textField: UITextField) {
        userimage.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y + 200, width:self.view.frame.size.width, height:self.view.frame.size.height);
            
        })
    }
    
    
    var idserv = 0
    

 var imagePicker = UIImagePickerController()
    
    
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
    
    @IBOutlet var userimage: UIButton!
    
    
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
    
    
    @IBOutlet var desc: UITextField!
    
   
    @IBOutlet var catselceted: UITextField!
    
    @IBAction func categoryselect(_ sender: Any) {
        
    
        dropDown.show()
       
    }
    
    
    let dropDown = DropDown()
    
    
    func setup() {
        dropDown.anchorView = catselceted
               
               // Will set a custom with instead of anchor view width
               //        dropDown.width = 100
               
               // By default, the dropdown will have its origin on the top left corner of its anchor view
               // So it will come over the anchor view and hide it completely
               // If you want to have the dropdown underneath your anchor view, you can do this:
               dropDown.bottomOffset = CGPoint(x: 0, y: dropDown.bounds.height)
               
               // You can also use localizationKeysDataSource instead. Check the docs.
               dropDown.dataSource = [
                   "Car wash",
                   "English Teaching",
                   "Fitness Trainer",
             
               ]
               
               // Action triggered on selection
               dropDown.selectionAction = { [weak self] (index, item) in
                   self?.catselceted.text = item
                self?.dropDown.hide()
                 self?.view.endEditing(true)
    
               }
               
               dropDown.multiSelectionAction = { [weak self] (indices, items) in
                  
                   if items.isEmpty {
                       self?.catselceted.text = ""
                   }
               }
               
               
             
    }


    @IBAction func des(_ sender: Any) {
     
      

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        catselceted.delegate = self
        desc.delegate = self
       
      
         }
         
                     
    @IBAction func next(_ sender: Any) {
        if catselceted.text?.isEmpty ?? true {
                                       let animation = CABasicAnimation(keyPath: "position")
                                       animation.duration = 0.07
                                       animation.repeatCount = 4
                                       animation.autoreverses = true
                                       animation.fromValue = NSValue(cgPoint: CGPoint(x: catselceted.center.x - 10, y: catselceted.center.y))
                                       animation.toValue = NSValue(cgPoint: CGPoint(x: catselceted.center.x + 10, y: catselceted.center.y))
                                       
                                       catselceted.layer.add(animation, forKey: "position")
                                   }
        if desc.text?.isEmpty ?? true {
                                             let animation = CABasicAnimation(keyPath: "position")
                                             animation.duration = 0.07
                                             animation.repeatCount = 4
                                             animation.autoreverses = true
                                             animation.fromValue = NSValue(cgPoint: CGPoint(x: desc.center.x - 10, y: desc.center.y))
                                             animation.toValue = NSValue(cgPoint: CGPoint(x: desc.center.x + 10, y: desc.center.y))
                                             
                                             desc.layer.add(animation, forKey: "position")
        }else{
            if catselceted.text == "Car wash" {
                self.idserv = 7
            }
            if catselceted.text == "English Teaching" {
                self.idserv = 9
            }
            if catselceted.text == "Fitness Trainer" {
                           self.idserv = 10
                       }
             UserDefaults.standard.set(idserv, forKey: "servicepro")
            UserDefaults.standard.set(desc.text!, forKey: "descriptionpro")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                      let businessfinalViewController = storyBoard.instantiateViewController(withIdentifier: "businessfinalViewController") as! businessfinalViewController
                      self.present(businessfinalViewController, animated:true, completion:nil)
        }
        
    }
    
    
    
    

    
     @IBAction func btnChooseImageOnClick(_ sender: UIButton) {
            
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
                self.openCamera()
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

    extension bussinesViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            /*
             Get the image from the info dictionary.
             If no need to edit the photo, use `UIImagePickerControllerOriginalImage`
             instead of `UIImagePickerControllerEditedImage`
             */
          
            
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
