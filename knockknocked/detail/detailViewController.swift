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
    
    
    @IBOutlet var jobofferfinal: UIButton!
    
  
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
    

    
    
    @IBOutlet var share: UIButton!
    
    
    @IBOutlet var fromlab: UILabel!
    
    @IBOutlet var fromprice: UILabel!
    
    @IBOutlet var webimage: UIImageView!
    
    
    @IBOutlet var bookview: UIView!
    
    @IBOutlet var rateimage: UIImageView!
    
    @IBAction func backk(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet var backui: UIButton!
    
    @IBAction func nextview(_ sender: Any) {
        let image = UIImage(named: "") as UIImage?
       jobofferfinal.isHidden = false
        nextview.isUserInteractionEnabled = false
        
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
        
        let xPosition4 = workdetail.frame.origin.x
        let yPosition4 = workdetail.frame.origin.y - 20 // Slide Up - 20px

        let width4 = workdetail.frame.size.width
        let height4 = workdetail.frame.size.height
        
     
         UIView.animate(withDuration: 0.5) {
           
            self.nametitle.textColor = .white
            self.nimedetail.textColor = .white
            self.workdetail.textColor = .white
            self.worktitle.textColor = .white
            self.bookview.alpha = 1
            self.nextview.frame =   UIScreen.main.bounds
            self.nextview.setTitle("", for: .normal)
            self.closeButton.isHidden = false
            self.nextview.backgroundColor = #colorLiteral(red: 0, green: 0.8180647492, blue: 0.5848332644, alpha: 1)
            self.backui.isHidden = true
                
        }
           UIView.animate(withDuration: 0.7) {
            self.nametitle.frame =  CGRect(x: xPosition, y: yPosition, width: width, height: height)
                                 
                      self.nimedetail.frame =  CGRect(x: xPosition1, y: yPosition1, width: width1, height: height1)
            self.facepic.frame =  CGRect(x: xPosition3, y: yPosition3, width: width3, height: height3)
             self.workdetail.frame =  CGRect(x: xPosition4, y: yPosition4, width: width4, height: height4)
        }
        
         UIView.animate(withDuration: 0.9) {
             self.bookview.frame =  CGRect(x: xPosition2, y: yPosition2, width: width2, height: height2)
        }
            
        
    }
    
    @IBAction func close(_ sender: Any) {
        
        
        nextview.isUserInteractionEnabled = true
jobofferfinal.isHidden = true
        let xPosition = nametitle.frame.origin.x
                           let yPosition = nametitle.frame.origin.y - 20 // Slide Up - 20px

                           let width = nametitle.frame.size.width
                           let height = nametitle.frame.size.height
               
               let xPosition1 = nimedetail.frame.origin.x
                                    let yPosition1 = nimedetail.frame.origin.y + 20 // Slide Up - 20px

                                    let width1 = nimedetail.frame.size.width
                                    let height1 = nimedetail.frame.size.height
        
        let xPosition3 = facepic.frame.origin.x
                                        let yPosition3 = facepic.frame.origin.y + 20 // Slide Up - 20px

                                        let width3 = facepic.frame.size.width
                                        let height3 = facepic.frame.size.height
        
        let xPosition4 = bookview.frame.origin.x
                                              let yPosition4 = bookview.frame.origin.y + 20 // Slide Up - 20px

                                              let width4 = bookview.frame.size.width
                                              let height4 = bookview.frame.size.height
        
        let xPosition5 = workdetail.frame.origin.x
              let yPosition5 = workdetail.frame.origin.y + 20 // Slide Up - 20px

             let width5 = workdetail.frame.size.width
                                                          let height5 = workdetail.frame.size.height
        
        nametitle.textColor = .black
        nimedetail.textColor = .black
        workdetail.textColor = .black
        self.worktitle.textColor = .black

        let xPosition10 = 254
        let yPosition10 = 598 // Slide Up - 20px

        let width10 = 121
        let height10 = 69
        
        let image = UIImage(named: "jobofer") as UIImage?
              
               
//               self.nextview.setImage(image, for: .normal)
         self.nextview.backgroundColor = #colorLiteral(red: 0, green: 0.8180647492, blue: 0.5848332644, alpha: 1)
        bookview.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
             self.nextview.setImage(image, for: .normal)
             self.nextview.setTitle("Continue", for: .normal)
        }
        UIView.animate(withDuration: 0.5) {
           
                          
        }
            UIView.animate(withDuration: 0.5) {
                self.closeButton.isHidden = true
               
         self.nextview.frame =  CGRect(x: xPosition10, y: yPosition10, width: width10, height: height10)
                self.backui.isHidden = false
        }
        UIView.animate(withDuration: 0.0) {
                   self.nametitle.frame =  CGRect(x: xPosition, y: yPosition, width: width, height: height)
                                        
           self.nimedetail.frame =  CGRect(x: xPosition1, y: yPosition1, width: width1, height: height1)
            self.workdetail.frame =  CGRect(x: xPosition5, y: yPosition5, width: width5, height: height5)
             self.facepic.frame =  CGRect(x: xPosition3, y: yPosition3, width: width3, height: height3)
             self.bookview.frame =  CGRect(x: xPosition4, y: yPosition4, width: width4, height: height4)
               }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(true, forKey: "didSkip1")
         UserDefaults.standard.set(true, forKey: "hidereserve")
               
        let catpro = UserDefaults.standard.object(forKey: "catpro") as! String
        let despro = UserDefaults.standard.object(forKey: "despro") as! String
//         let qulitypro = UserDefaults.standard.object(forKey: "qulitypro") as! Int
//         let orderpro = UserDefaults.standard.object(forKey: "orderpro") as! Int
//        let likepro = UserDefaults.standard.object(forKey: "likepro") as! Int

        
        
         let proname = UserDefaults.standard.object(forKey: "proname") as! String
//         let idpro = UserDefaults.standard.object(forKey: "idpro") as! Int
        
        nametitle.text = proname
        workdetail.text = despro
        nimedetail.text = catpro
        star1text.text = "0"
        star2text.text = "0"
        
        
        jobofferfinal.isHidden = true
        
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
        webimage.alpha = 0
//        fromlab.alpha = 0
//        fromprice.alpha = 0
        share.alpha = 1
         self.bookview.backgroundColor = #colorLiteral(red: 0, green: 0.8180647492, blue: 0.5848332644, alpha: 1)
         self.jobofferfinal.backgroundColor = #colorLiteral(red: 0, green: 0.8180647492, blue: 0.5848332644, alpha: 1)
        
        if let imageName = appData?[imageKey] {
            facepic.image = UIImage(named: imageName)
            
        }

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
                let xPosition14 = webimage.frame.origin.x
                                                          let yPosition14 = webimage.frame.origin.y - 20  // Slide Up - 20px

                                                          let width14 = webimage.frame.size.width
                                                          let height14 = webimage.frame.size.height+20
                
                
                
               let xPosition13 = share.frame.origin.x
                                                          let yPosition13 = share.frame.origin.y - 20  // Slide Up - 20px

                                                          let width13 = share.frame.size.width
                                                          let height13 = share.frame.size.height+20
              

//                let xPosition15 = fromprice.frame.origin.x
//                                                                         let yPosition15 = fromprice.frame.origin.y - 20  // Slide Up - 20px
//
//                                                                         let width15 = fromprice.frame.size.width
//                                                                         let height15 = fromprice.frame.size.height+20
//                
//                let xPosition16 = fromlab.frame.origin.x
//                                                                                        let yPosition16 = fromlab.frame.origin.y - 20  // Slide Up - 20px
//
//                                                                                        let width16 = fromlab.frame.size.width
//                                                                                        let height16 = fromlab.frame.size.height+20
                
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
                
                UIView.animate(withDuration: 1.2) {
                     self.webimage.alpha = 1
                   self.webimage.frame =  CGRect(x: xPosition14, y: yPosition14, width: width14, height: height14)
                    
                    self.share.alpha = 1
//                    self.share.frame =  CGRect(x: xPosition13, y: yPosition13, width: width13, height: height13)
                   
                    
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
        
        
        

    }
}
