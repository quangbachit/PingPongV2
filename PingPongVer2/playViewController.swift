//
//  playViewController.swift
//  PingPongVer2
//
//  Created by Quang Bach on 12/17/16.
//  Copyright © 2016 Quang Bach. All rights reserved.
//

import UIKit
import AVFoundation



class playViewController: UIViewController {

    @IBOutlet var poin2: UILabel!
    @IBOutlet var poin1: UILabel!
    @IBOutlet var player1: UIView!
    @IBOutlet var player2: UIView!
    @IBOutlet var ballImage: UIImageView!
    
    var gameModel = GameModel()
    var kplayer1: Int = 0
    var kplayer2: Int = 0
    var pont = 0
    var sound: AVAudioPlayer!
    var over: AVAudioPlayer!
    var v: CGPoint!
    var time: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameModel.tableSize = view.frame.size
        gameModel.p1 = CGRect(x: 0, y: 0, width: 5, height: 100)
        gameModel.p2 = CGRect(x: gameModel.tableSize.width - 5, y: 0, width: 5, height: 100)
        gameModel.ball = CGRect(origin: self.view.center, size: CGSize(width: 10.0, height: 10.0))
        
        
         self.navigationController?.isNavigationBarHidden = true
        v = CGPoint(x: 10, y: 10)
        time = Timer.scheduledTimer(timeInterval: 1.0/40.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        
        
        let parth = Bundle.main.path(forResource: "sound", ofType: "wav")
        let parth2 = Bundle.main.path(forResource: "gameOver", ofType: "wav")
        
        let urlSound = URL(fileURLWithPath: parth!)
        let urlGameOver = URL(fileURLWithPath: parth2!)
        
        do {
            try sound = AVAudioPlayer(contentsOf: urlSound)
            try over = AVAudioPlayer(contentsOf: urlGameOver)
            sound.prepareToPlay()
            over.prepareToPlay()
        } catch let err as NSError {
            print(err.description)
        }
        
        
    }
   
    
    
    
    
    func updateUI(){
        
        var frame = view.convert(ballImage.bounds, from: ballImage)
        
        
        frame.origin.x += v.x
        frame.origin.y += v.y
        
        if frame.minX < self.view.frame.minX {
            let d = frame.minX - self.view.frame.minX
            frame.origin.x -= 2*d
            v.x = -v.x
            gameOver()
                    }
        if frame.maxX > self.view.frame.maxX{
            let d = frame.maxX - self.view.frame.maxX
            frame.origin.x -= 2*d
            v.x = -v.x
            gameOver()
        }
        if frame.minY < self.view.frame.minY {
            let d = frame.minY - self.view.frame.minY
            frame.origin.y -= 2*d
            v.y = -v.y
            gameOver()
        }
        
        if frame.maxY > self.view.frame.maxY {
            let d = frame.maxY - self.view.frame.maxY
            frame.origin.y -= 2*d
            v.y = -v.y
            gameOver()
        }
        if frame.minX < player1.frame.maxX {
            if frame.midY >= player1.frame.minY && frame.midY <= player1.frame.maxY {
                let d = frame.minX - player1.frame.maxX
                frame.origin.x -= 3*d
                v.x = -v.x
                print("ok")
                soundClick()
                if kplayer1 != 2 {
                    kplayer1 += 1
                }else{
                    let c = UIAlertController(title: "player1 Win", message: "success", preferredStyle: .alert)
                    let cancel = UIAlertAction(title: "Play Again", style: .cancel, handler: { (UIAlertAction) in
                        _ = self.navigationController?.popViewController(animated: true)
                    })
                    c.addAction(cancel)
                    present(c, animated: true, completion: nil)
                }
                poin1.text = "\(kplayer1)"
            }
        }
        if frame.maxX > player2.frame.minX && frame.maxX < player2.frame.maxX{
            if frame.midY >= player2.frame.minY && frame.midY <= player2.frame.maxY{
                let d = frame.maxX - player2.frame.minX
                frame.origin.x -= 3*d
                v.x = -v.x
            }
        }

        ballImage.frame = frame
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    @IBAction func panVV(_ sender: UIPanGestureRecognizer){
        let tran = sender.translation(in: view)
        sender.setTranslation(CGPoint(), in: view)
        if let view = sender.view{
            var point = view.center
            point.y += tran.y
            view.center = point
            
        }
    }
    

        
        func soundClick() {
            if sound.isPlaying {
                sound.stop()
            }
            sound.play()
        }
        func gameOver() {
            if over.isPlaying {
                over.stop()
            }
            over.play()
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
