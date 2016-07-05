//
//  ViewController.swift
//  はるな
//
//  Created by 田代　貴大 on 2014/12/26.
//  Copyright (c) 2014年 田代　貴大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card5: UIButton!
    @IBOutlet weak var card6: UIButton!
    @IBOutlet weak var card7: UIButton!
    @IBOutlet weak var card8: UIButton!
    
    var cards : [String] = ["c01.png","c01.png","h01.png","h01.png","d01.png","d01.png","s01.png","s01.png"]
    var opencard1 = -1
    var opencard2 = -1
    var openkind = ""
    var uraimg:UIImage = UIImage(named: "z01.png")!
    var cnt : Float = 0.0
    var reverse : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var i = 0
        var temp = ""
        for(i=0; i<100; i++){
            var n = arc4random() % 8
            temp = cards[Int(n)]
            cards[Int(n)] = cards[0]
            cards[0] = temp
        }
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onUpdate(timer : NSTimer){
        cnt += 0.2
        print("\(cnt)")
        
        if(Int(cnt) % 3 == 0 && reverse)
        {
            if(opencard1 == 1)
            {
                card1.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard1 == 2)
            {
                card2.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard1 == 3)
            {
                card3.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard1 == 4)
            {
                card4.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard1 == 5)
            {
                card5.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard1 == 6)
            {
                card6.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard1 == 7)
            {
                card7.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard1 == 8)
            {
                card8.setImage(uraimg, forState: UIControlState.Normal)
            }
            
            if(opencard2 == 1)
            {
                card1.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard2 == 2)
            {
                card2.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard2 == 3)
            {
                card3.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard2 == 4)
            {
                card4.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard2 == 5)
            {
                card5.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard2 == 6)
            {
                card6.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard2 == 7)
            {
                card7.setImage(uraimg, forState: UIControlState.Normal)
            }
            else if(opencard2 == 8)
            {
                card8.setImage(uraimg, forState: UIControlState.Normal)
            }
            opencard1 = -1
            opencard2 = -1
            reverse = false
            cnt = 0.0
        }
        
    }
    
    func carddisable(){
        if(opencard1 == 1)
        {
            card1.enabled = false
        }
        else if(opencard1 == 2)
        {
            card2.enabled = false
        }
        else if(opencard1 == 3)
        {
            card3.enabled = false
        }
        else if(opencard1 == 4)
        {
            card4.enabled = false
        }
        else if(opencard1 == 5)
        {
            card5.enabled = false
        }
        else if(opencard1 == 6)
        {
            card6.enabled = false
        }
        else if(opencard1 == 7)
        {
            card7.enabled = false
        }
        else if(opencard1 == 8)
        {
            card8.enabled = false
        }
        
        if(opencard2 == 1)
        {
            card1.enabled = false
        }
        else if(opencard2 == 2)
        {
            card2.enabled = false
        }
        else if(opencard2 == 3)
        {
            card3.enabled = false
        }
        else if(opencard2 == 4)
        {
            card4.enabled = false
        }
        else if(opencard2 == 5)
        {
            card5.enabled = false
        }
        else if(opencard2 == 6)
        {
            card6.enabled = false
        }
        else if(opencard2 == 7)
        {
            card7.enabled = false
        }
        else if(opencard2 == 8)
        {
            card8.enabled = false
        }
    }
    
    func chkclear(){
        if(card1.enabled == false && card2.enabled == false && card3.enabled == false && card4.enabled == false && card5.enabled == false && card6.enabled == false && card7.enabled == false && card8.enabled == false)
        {
            let myAlert = UIAlertController(title: "Congratulation", message: "You cleared", preferredStyle: .Alert)
            let myOkAction = UIAlertAction(title: "OK", style: .Default) { action in
                print("Action OK!!")
        }
            
            // OKのActionを追加する.
            myAlert.addAction(myOkAction)
            // UIAlertを発動する.
            presentViewController(myAlert, animated: true, completion: nil)
        }
    }
    
    func chkcard(card:Int, kindcard:String) -> Int{
        var res = 0
        
        if(opencard1 == card)
        {
            print("same card")
            //opencard1 = -1
            //opencard2 = -1
            openkind = ""
            res = 1
        }
        else if(opencard1 == -1)
        {
            print("first")
            opencard1 = card
            openkind = kindcard
            res = 1
        }
        else
        {
            opencard2 = card
            if(kindcard == openkind)
            {
                print("OK")
                carddisable()
                opencard1 = -1
                opencard2 = -1
                
                chkclear()
            }
            else
            {
                reverse = true;
                print("BAD")
            }
            
            res = 0
            
        }
        return res
    }

    @IBAction func tappedcard1(sender: AnyObject) {
        let myImage = UIImage(named: cards[0])
        card1.setImage(myImage, forState: UIControlState.Normal)
        chkcard(1, kindcard: cards[0])
    }
    
    @IBAction func tappedcard2(sender: AnyObject) {
        let myImage = UIImage(named: cards[1])
        card2.setImage(myImage, forState: UIControlState.Normal)
        chkcard(2, kindcard: cards[1])
    }
    
    @IBAction func tappedcard3(sender: AnyObject) {
        let myImage = UIImage(named: cards[2])
        card3.setImage(myImage, forState: UIControlState.Normal)
        chkcard(3, kindcard: cards[2])
    }

    @IBAction func tappedcard4(sender: AnyObject) {
        let myImage = UIImage(named: cards[3])
        card4.setImage(myImage, forState: UIControlState.Normal)
        chkcard(4, kindcard: cards[3])
    }
    
    @IBAction func tappedcard5(sender: AnyObject) {
        let myImage = UIImage(named: cards[4])
        card5.setImage(myImage, forState: UIControlState.Normal)
        chkcard(5, kindcard: cards[4])
    }
    
    @IBAction func tappedcard6(sender: AnyObject) {
        let myImage = UIImage(named: cards[5])
        card6.setImage(myImage, forState: UIControlState.Normal)
        chkcard(6, kindcard: cards[5])
    }
    
    @IBAction func tappedcard7(sender: AnyObject) {
        let myImage = UIImage(named: cards[6])
        card7.setImage(myImage, forState: UIControlState.Normal)
        chkcard(7, kindcard: cards[6])
    }
    
    @IBAction func tappedcard8(sender: AnyObject) {
        let myImage = UIImage(named: cards[7])
        card8.setImage(myImage, forState: UIControlState.Normal)
        chkcard(8, kindcard: cards[7])
    }
    
    @IBAction func pushReset(sender: AnyObject) {
        var i = 0
        var temp = ""
        
        for(i=0; i<100; i++)
        {
            var n = arc4random() % 8
            temp = cards[Int(n)]
            cards[Int(n)] = cards[0]
            cards[0] = temp
        }
        
        card1.setImage(uraimg, forState: UIControlState.Normal)
        card2.setImage(uraimg, forState: UIControlState.Normal)
        card3.setImage(uraimg, forState: UIControlState.Normal)
        card4.setImage(uraimg, forState: UIControlState.Normal)
        card5.setImage(uraimg, forState: UIControlState.Normal)
        card6.setImage(uraimg, forState: UIControlState.Normal)
        card7.setImage(uraimg, forState: UIControlState.Normal)
        card8.setImage(uraimg, forState: UIControlState.Normal)
        
        card1.enabled = true
        card2.enabled = true
        card3.enabled = true
        card4.enabled = true
        card5.enabled = true
        card6.enabled = true
        card7.enabled = true
        card8.enabled = true
    }
    
    
}
