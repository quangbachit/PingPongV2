//
//  ViewController.swift
//  PingPongVer2
//
//  Created by Quang Bach on 12/9/16.
//  Copyright © 2016 Quang Bach. All rights reserved.
//

import UIKit
import SafariServices
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goWeb(_ sender: Any) {
        
        let url = URL(string: "https://fb.com/Quangbachit")
        let safari = SFSafariViewController(url: url!)
        present(safari, animated: true, completion: nil)
    }

}

