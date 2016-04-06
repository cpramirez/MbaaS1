//
//  ViewController.swift
//  HalCash
//
//  Created by CICE on 6/4/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //vamos a guardar unos datos de ejemplo (datos de un juego)
        let gameScore = PFObject(className:"GameScore")
        gameScore["score"] = 1337
        gameScore["playerName"] = "Sean Plott"
        gameScore["endDate"] = "06/04/2016"
        gameScore.setObject("David Ricardo", forKey: "partner")
        gameScore["enterprise"] = "HalCash"

        gameScore.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                self.displayAlertViewController("HEY",messageString: "Datos guardados correctamente")
            } else {
                self.displayAlertViewController("HEY",messageString: "Información no guaradad \(error?.description)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: -  UTILS
    func displayAlertViewController(titleString : String, messageString : String){
        let alertVC = UIAlertController(title: titleString, message: messageString, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)
    }

}

