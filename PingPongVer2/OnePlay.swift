//
//  OnePlay.swift
//  PingPongVer2
//
//  Created by Quang Bach on 12/28/16.
//  Copyright © 2016 Quang Bach. All rights reserved.
//

import UIKit

class OnePlay: UIViewController {

    @IBOutlet var player1: UIView!
    
    @IBOutlet var player2: UIView!
    
    @IBOutlet var ball: UIImageView!
    
    @IBOutlet var point1: UILabel!
    @IBOutlet var point2: UILabel!
    
    var model = GameModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func updateUI2() {
        //update
        player1.frame = model.p1
        player2.frame = model.p2
        ball.frame = model.ball
        point1.text = "\(model.point1)"
        point2.text = "\(model.point2)"
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
