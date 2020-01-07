//
//  detailViewController.swift
//  knock knocked
//
//  Created by pedram on 7/17/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit


class detailViewController: UIViewController, TransitionInfoProtocol {

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
  
   @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet var facepic: UIImageView!
    
      var appData: [String:String]?
    
    @IBOutlet var nametitle: UILabel!
    
    @IBOutlet var nimedetail: UILabel!
    
    @IBOutlet var worktitle: UILabel!
    
    @IBOutlet var workdetail: UILabel!
    
    
    @IBOutlet var start1: UIImageView!
    
    @IBOutlet var star1text: UILabel!
    
    @IBOutlet var star2: UIImageView!
    
    
    @IBOutlet var star2text: UILabel!
    
    @IBOutlet var price: UILabel!
    @IBOutlet var quality: UILabel!
    
    @IBOutlet var exprienceview: UIView!
    
    @IBOutlet var nextview: UIButton!
    
    @IBOutlet var star11: UIImageView!
    @IBOutlet var star12: UIImageView!
    @IBOutlet var star13: UIImageView!
    
    @IBOutlet var star21: UIImageView!
    
    @IBOutlet var star22: UIImageView!
    
    @IBOutlet var star23: UIImageView!
    
    @IBOutlet var ordermember: UILabel!
    
    @IBOutlet var likelable: UILabel!
    
    @IBOutlet var fromprice: UILabel!
    
    @IBOutlet var bookview: UIView!
    
    @IBOutlet var rateimage: UIImageView!
    
    @IBAction func backk(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextview(_ sender: Any) {
        let image = UIImage(named: "") as UIImage?
       
       
        
        self.nextview.setImage(image, for: .normal)
        
        let xPosition = nametitle.frame.origin.x
                    let yPosition = nametitle.frame.origin.y + 20 // Slide Up - 20px

                    let width = nametitle.frame.size.width
                    let height = nametitle.frame.size.height
        
        let xPosition1 = nimedetail.frame.origin.x
                             let yPosition1 = nimedetail.frame.origin.y - 20 // Slide Up - 20px

                             let width1 = nimedetail.frame.size.width
                             let height1 = nimedetail.frame.size.height
        
        let xPosition2 = bookview.frame.origin.x
                                   let yPosition2 = bookview.frame.origin.y - 20 // Slide Up - 20px

                                   let width2 = bookview.frame.size.width
                                   let height2 = bookview.frame.size.height
        
        let xPosition3 = facepic.frame.origin.x
                                         let yPosition3 = facepic.frame.origin.y - 20 // Slide Up - 20px

                                         let width3 = facepic.frame.size.width
                                         let height3 = facepic.frame.size.height
        
     
         UIView.animate(withDuration: 0.5) {

            self.nametitle.textColor = .white
            self.nimedetail.textColor = .white
            self.bookview.alpha = 1
            self.nextview.frame =   UIScreen.main.bounds
            self.nextview.setTitle("", for: .normal)
            self.closeButton.isHidden = false
            self.nextview.backgroundColor = #colorLiteral(red: 0, green: 0.7020093203, blue: 0.2533324957, alpha: 1)
        }
           UIView.animate(withDuration: 0.7) {
            self.nametitle.frame =  CGRect(x: xPosition, y: yPosition, width: width, height: height)
                                 
                      self.nimedetail.frame =  CGRect(x: xPosition1, y: yPosition1, width: width1, height: height1)
            self.facepic.frame =  CGRect(x: xPosition3, y: yPosition3, width: width3, height: height3)
        }
        
         UIView.animate(withDuration: 0.9) {
             self.bookview.frame =  CGRect(x: xPosition2, y: yPosition2, width: width2, height: height2)
        }
            
        
    }
    
    @IBAction func close(_ sender: Any) {
        
        let xPosition = nametitle.frame.origin.x
                           let yPosition = nametitle.frame.origin.y - 20 // Slide Up - 20px

                           let width = nametitle.frame.size.width
                           let height = nametitle.frame.size.height
               
               let xPosition1 = nimedetail.frame.origin.x
                                    let yPosition1 = nimedetail.frame.origin.y - 20 // Slide Up - 20px

                                    let width1 = nimedetail.frame.size.width
                                    let height1 = nimedetail.frame.size.height
        
        let xPosition3 = facepic.frame.origin.x
                                        let yPosition3 = facepic.frame.origin.y - 20 // Slide Up - 20px

                                        let width3 = facepic.frame.size.width
                                        let height3 = facepic.frame.size.height
        
        nametitle.textColor = .black
        nimedetail.textColor = .black
        let xPosition10 = 290
        let yPosition10 = 820 // Slide Up - 20px

        let width10 = 124
        let height10 = 76
        
        let image = UIImage(named: "backwith") as UIImage?
              
               
               self.nextview.setImage(image, for: .normal)
         self.nextview.backgroundColor = #colorLiteral(red: 0.9875081182, green: 0.6993025541, blue: 0.8245705366, alpha: 1)
        bookview.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.closeButton.isHidden = true
                
                 self.nextview.setTitle("Job offer", for: .normal)
         self.nextview.frame =  CGRect(x: xPosition10, y: yPosition10, width: width10, height: height10)
        }
        UIView.animate(withDuration: 0.7) {
                   self.nametitle.frame =  CGRect(x: xPosition, y: yPosition, width: width, height: height)
                                        
                             self.nimedetail.frame =  CGRect(x: xPosition1, y: yPosition1, width: width1, height: height1)
             self.facepic.frame =  CGRect(x: xPosition3, y: yPosition3, width: width3, height: height3)
               }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        closeButton.isHidden = true
        facepic.alpha = 0
        nametitle.alpha = 0
        nimedetail.alpha = 0
        worktitle.alpha = 0
        workdetail.alpha = 0
        start1.alpha = 0
        star1text.alpha = 0
        star2.alpha = 0
        star2text.alpha = 0
        exprienceview.alpha = 0
        bookview.alpha = 0
        rateimage.alpha = 0
        fromprice.alpha = 0
         self.bookview.backgroundColor = #colorLiteral(red: 0, green: 0.7020093203, blue: 0.2533324957, alpha: 1)
        
        if let imageName = appData?[imageKey] {
            facepic.image = UIImage(named: imageName)
            
        }
      }
      
      
      
     func viewsToAnimate() -> [UIView] {
             return [facepic]
         }
         
         func copyForView(_ subView: UIView) -> UIView {
               return UIImageView(image: facepic.image)
         }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        

        
               let xPosition = nametitle.frame.origin.x
               let yPosition = nametitle.frame.origin.y - 20 // Slide Up - 20px

               let width = nametitle.frame.size.width
               let height = nametitle.frame.size.height
               
               let xPosition1 = nimedetail.frame.origin.x
                      let yPosition1 = nimedetail.frame.origin.y - 20 // Slide Up - 20px

                      let width1 = nimedetail.frame.size.width
                      let height1 = nimedetail.frame.size.height
        
        let xPosition2 = worktitle.frame.origin.x
               let yPosition2 = worktitle.frame.origin.y - 20 // Slide Up - 20px

               let width2 = worktitle.frame.size.width
               let height2 = worktitle.frame.size.height
               
               let xPosition3 = workdetail.frame.origin.x
                      let yPosition3 = workdetail.frame.origin.y - 20 // Slide Up - 20px

                      let width3 = workdetail.frame.size.width
                      let height3 = workdetail.frame.size.height
        
     
        let xPosition5 = star2.frame.origin.x
        let yPosition5 = star2.frame.origin.y - 20 // Slide Up - 20px

        let width5 = star2.frame.size.width
        let height5 = star2.frame.size.height
        
        let xPosition6 = star2text.frame.origin.x
              let yPosition6 = star2text.frame.origin.y - 20 // Slide Up - 20px

              let width6 = star2text.frame.size.width
              let height6 = star2text.frame.size.height
        
        let xPosition7 = start1.frame.origin.x
               let yPosition7 = start1.frame.origin.y - 20 // Slide Up - 20px

               let width7 = start1.frame.size.width
               let height7 = start1.frame.size.height
               
               let xPosition8 = star1text.frame.origin.x
                     let yPosition8 = star1text.frame.origin.y - 20 // Slide Up - 20px

                     let width8 = star1text.frame.size.width
                     let height8 = star1text.frame.size.height
        
        let xPosition9 = exprienceview.frame.origin.x
                          let yPosition9 = exprienceview.frame.origin.y - 20  // Slide Up - 20px

                          let width9 = exprienceview.frame.size.width
                          let height9 = exprienceview.frame.size.height+20
        
        let xPosition10 = likelable.frame.origin.x
                                let yPosition10 = likelable.frame.origin.y - 20  // Slide Up - 20px

                                let width10 = likelable.frame.size.width
                                let height10 = likelable.frame.size.height+20
        
        let xPosition11 = ordermember.frame.origin.x
                                     let yPosition11 = ordermember.frame.origin.y - 20  // Slide Up - 20px

                                     let width11 = ordermember.frame.size.width
                                     let height11 = ordermember.frame.size.height+20
        
        
        let xPosition12 = rateimage.frame.origin.x
                                           let yPosition12 = rateimage.frame.origin.y - 20  // Slide Up - 20px

                                           let width12 = rateimage.frame.size.width
                                           let height12 = rateimage.frame.size.height+20
        
        let xPosition13 = fromprice.frame.origin.x
                                                  let yPosition13 = fromprice.frame.origin.y - 20  // Slide Up - 20px

                                                  let width13 = fromprice.frame.size.width
                                                  let height13 = fromprice.frame.size.height+20
      

        UIView.animate(withDuration: 0.5) {
            self.facepic.alpha = 1
            self.nametitle.alpha = 1
            self.nimedetail.alpha = 1
            self.nametitle.frame =  CGRect(x: xPosition, y: yPosition, width: width, height: height)
                       
            self.nimedetail.frame =  CGRect(x: xPosition1, y: yPosition1, width: width1, height: height1)
           
            
        }
        UIView.animate(withDuration: 0.7) {
            self.worktitle.alpha = 1
           self.workdetail.alpha = 1
            self.worktitle.frame =  CGRect(x: xPosition2, y: yPosition2, width: width2, height: height2)
                                  
           self.workdetail.frame =  CGRect(x: xPosition3, y: yPosition3, width: width3, height: height3)
        }
        UIView.animate(withDuration: 0.9) {
             self.exprienceview.alpha = 1
           self.exprienceview.frame =  CGRect(x: xPosition9, y: yPosition9, width: width9, height: height9)
        }
       
        UIView.animate(withDuration: 1.1) {
            self.start1.alpha = 1
            self.star1text.alpha = 1
            self.star2.alpha = 1
            self.star2text.alpha = 1
            
            
            
             self.star2.frame =  CGRect(x: xPosition5, y: yPosition5, width: width5, height: height5)
            self.star2text.frame =  CGRect(x: xPosition6, y: yPosition6, width: width6, height: height6)
            
            self.start1.frame =  CGRect(x: xPosition7, y: yPosition7, width: width7, height: height7)
                       self.star1text.frame =  CGRect(x: xPosition8, y: yPosition8, width: width8, height: height8)
            
            self.likelable.frame =  CGRect(x: xPosition10, y: yPosition10, width: width10, height: height10)
            
             self.ordermember.frame =  CGRect(x: xPosition11, y: yPosition11, width: width11, height: height11)
            
            
            
        }
        
        UIView.animate(withDuration: 1.2) {
             self.rateimage.alpha = 1
           self.rateimage.frame =  CGRect(x: xPosition12, y: yPosition12, width: width12, height: height12)
        }
        
        UIView.animate(withDuration: 1.3) {
             self.fromprice.alpha = 1
           self.fromprice.frame =  CGRect(x: xPosition13, y: yPosition13, width: width13, height: height13)
        }
       
    }
    
}
