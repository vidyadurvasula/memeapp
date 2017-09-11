//
//  MemedeyailviewController.swift
//  Memeappfinal
//
//  Created by Vidya Durvasula on 9/10/17.
//  Copyright © 2017 Vidya Durvasula. All rights reserved.
//

import UIKit

class MemedeyailviewController: UIViewController, UITextFieldDelegate
{
    
    var meme: Meme!
    var valueTextFieldTop: String!
    var valueTextFieldBottom: String!
    var valueImageMain: UIImage!
    var didEdit: Bool!
    var editButton: UIBarButtonItem!

    
    
    @IBOutlet weak var imagedetail: UIImageView!
    
   

    @IBOutlet weak var bottomtext: UITextField!

    @IBOutlet weak var top: UITextField!

    @IBOutlet weak var toptoolbar: UIToolbar!
    
       override func viewWillAppear(_ animated: Bool) {
      
    
   if valueTextFieldTop != nil && valueTextFieldBottom != nil && valueImageMain != nil {
        
            top.text = valueTextFieldTop
          bottomtext.text = valueTextFieldBottom
          imagedetail.image = valueImageMain
           top.isEnabled = false
            bottomtext.isEnabled = false
        }
        
            }
   
    override func viewDidLoad() {
    
        settextattributes(textfield: top)
        settextattributes(textfield: bottomtext)
                didEdit = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SentMeme", style: .plain, target: self, action: #selector(sentmeme))
    }
    
    func sentmeme(){
        
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
            
        }

       
                  }
}





