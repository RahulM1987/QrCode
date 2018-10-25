//
//  ViewController.swift
//  QRCodeGr
//
//  Created by Rahul Morade on 24/10/18.
//  Copyright © 2018 Rahul Morade. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    @IBOutlet weak var qrImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qrImage.image = QRCodeGeneration().generateQRCode(isString: "Hello world program created by someone", scale: 8.0)
       // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
   

}

