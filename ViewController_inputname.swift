//
//  ViewController_inputname.swift
//  TouchIDBlogPost
//
//  Created by Kerry Lobel on 12/1/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

class ViewController_inputname: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        
        if let strFirst = defaults.string(forKey: defaultsKeys.keyfirst) {
            //println(strFirst) // Some String Value
            if (txtName.text != "NIL"){txtName.text = strFirst;} else
            {txtName.text = "First"}
        }
        
        if let strLast = defaults.string(forKey: defaultsKeys.keylast) {
            // println(strLast) // Another String Value
            if (txtLast.text != "NIL"){txtLast.text = strLast;} else {txtLast.text = "Last"}
        }
        if let strID = defaults.string(forKey: defaultsKeys.keyID) {
            //println(strID) // Another String Value
            if (txtID.text != "NIL"){txtID.text = strID;} else
            {txtID.text = "1234"}
        }
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
    struct defaultsKeys {
        static let keyfirst = "firstStringKey"
        static let keylast = "secondStringKey"
        static let keyID = "thirdstringkey"
    }
    
    // MARK: Actions
    
    @IBAction func btnSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let strfirst = txtName.text
        let strlast = txtLast.text
        let strID = txtID.text
        defaults.setValue(strfirst, forKey: defaultsKeys.keyfirst)
        defaults.setValue(strlast, forKey: defaultsKeys.keylast)
        defaults.setValue(strID, forKey: defaultsKeys.keyID)
        defaults.synchronize()
    }
    // MARK: Properties
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtID: UITextField!
}
