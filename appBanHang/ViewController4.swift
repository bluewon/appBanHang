//
//  ViewController4.swift
//  appBanHang
//
//  Created by datnguyen on 12/15/16.
//  Copyright © 2016 datnguyen. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController4.huy), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var imgview: UIImageView!
    func huy(){
        //let lac1 = CATransform3DTranslate(CATransform3DIdentity, 200, 0, 0)
        //let lac2 = CATransform3DTranslate(lac1, -300, 0, 0)
//        CATransform3DConcat(<#T##a: CATransform3D##CATransform3D#>, <#T##b: CATransform3D##CATransform3D#>)
        let lac1 = CATransform3DScale(CATransform3DIdentity, 0.9, 0.9, 0.9)
        let lac2 = CATransform3DScale(lac1, 3, 3, 3)
        UIView.animate(withDuration: 1, animations: {
            self.imgview.layer.transform = lac1
        }, completion: {(true) in
            UIView.animate(withDuration: 3, animations: {
                self.imgview.layer.transform = lac2
            }, completion: {(true) in
                UIView.animate(withDuration: 1, animations: {
                    self.imgview.layer.transform = CATransform3DIdentity
                    self.imgview.alpha = 0
                }, completion: {(true) in
                    self.dismiss(animated: true, completion: nil)
                })
            })
        })
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
