//
//  memetextattributes.swift
//  Memeappfinal
//
//  Created by Vidya Durvasula on 9/10/17.
//  Copyright © 2017 Vidya Durvasula. All rights reserved.
//

import Foundation
import UIKit



let memeTxtAttributes:[String:Any] =
    [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont( name: "HelveticaNeue-CondensedBlack", size: 40 )!,
        NSStrokeWidthAttributeName: NSNumber( value: -4.0 )
]

func settextattributes(textfield : UITextField)
{
   textfield.defaultTextAttributes = memeTxtAttributes
    textfield.textAlignment = NSTextAlignment.center
   
  
}
