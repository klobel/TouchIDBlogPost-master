//
//  ViewController_qr.swift
//  TouchIDBlogPost
//
//  Created by Kerry Lobel on 12/1/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit
import LocalAuthentication


class ViewController_qr: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        struct defaultsKeys {
            static let keyfirst = "firstStringKey"
            static let keylast = "secondStringKey"
            static let keyID = "thirdstringkey"
        }
        let comma : Character = " "
        var strQR = defaults.string(forKey: defaultsKeys.keyfirst)
        strQR?.append(comma)
        strQR? += defaults.string(forKey: defaultsKeys.keylast)!
        strQR?.append(comma)
        strQR? += defaults.string(forKey: defaultsKeys.keyID)!
        
   
        
        let image = generateQRCode(from: strQR!)
        let imageView = UIImageView(image:image)
        self.view.addSubview(imageView);
        imageView.frame = CGRect(x:150, y:200, width: 100,height: 100)
        

    }

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.applying(transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
