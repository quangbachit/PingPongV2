//
//  GameModel.swift
//  PingPongVer2
//
//  Created by Quang Bach on 12/28/16.
//  Copyright © 2016 Quang Bach. All rights reserved.
//

import UIKit

class GameModel: NSObject {
    enum Status {
        case playing
        case stop
    }
    var ball = CGRect()
    var tableSize = CGSize()
    var p1 = CGRect()
    var p2 = CGRect()
    
    var v = CGPoint()
    
    var point1 = 0
    var point2 = 0
    var status = Status.stop
    
    func prepareInit(tableSize: CGSize, ballDemeter: CGFloat,padSize: CGSize)  {
        self.tableSize = tableSize
        
        self.ball = CGRect()
        point1 = 0
        point2 = 0
    }
    
    func startGame() {
        
    }
    
    
    
    func stopGame() {
        
    }
    
    
    
    
    
}
