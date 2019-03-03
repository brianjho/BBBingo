//
//  ViewController.swift
//  BBBingo
//
//  Created by Brian Ho on 3/2/19.
//  Copyright © 2019 bhojho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    class BingoSheet {
        
        class BingoBox: CustomStringConvertible {
            
            var label = ""
            var checked = false
            var description: String { return self.label }
            
            init() {
                
                self.label = "blank"
                
            }
            
            init(_ label:String) {
                
                self.label = label
                
            }
            
            init(_ label:String, _ checked:Bool) {
                
                self.label = label
                self.checked = checked
                
            }
            
            func switchCheck(){
                
                self.checked = !self.checked
                self.relabel(String(self.checked))
                
            }
            
            func check() -> Bool {
                
                return self.checked
                
            }
            
            func relabel(_ label:String) {
                
                self.label = label
                
            }
            
        }
        
        var name:String = ""
        var sheet = [[BingoBox]]()
        
        init(_ name:String) {
            
            self.name = name
            
            for i in 0...4 {
                var row = [BingoBox]()
                for j in 0...4 {
                    if (i == 2 && j == 2) {
                        row += [BingoBox("Free Space", true)]
                    } else {
                        row += [BingoBox()]
                    }
                }
                self.sheet += [row]
            }
            
        }
        
        func printSheet() {
            
            print(self.name + "'s Bingo Sheet:")
            for i in 0...4 {
                print(self.sheet[i][0], self.sheet[i][1], self.sheet[i][2], self.sheet[i][3], self.sheet[i][4], separator:"\t")
            }
            
        }
        
        func changeBox(_ i:Int, _ j:Int) {
            
            self.sheet[i][j].switchCheck()
            if (self.checkBingo()) {
                print(self.name + " got a bingo!")
            }
            
        }
        
        func relabelBox(_ i:Int, _ j:Int, _ label:String) {
            
            self.sheet[i][j].relabel(label)
            
        }
        
        func checkBingo() -> Bool {
            
            return (self.checkHorizontal() || self.checkVertical() || self.checkDiagonal())
            
        }
        
        func checkHorizontal() -> Bool {
            
            for row in 0...4 {
                if (self.sheet[row][0].check() && self.sheet[row][1].check() && self.sheet[row][2].check() && self.sheet[row][3].check() && self.sheet[row][4].check()) {
                    return true
                }
            }
            return false
            
        }
        
        func checkVertical() -> Bool {
            
            for col in 0...4 {
                if (self.sheet[0][col].check() && self.sheet[1][col].check() && self.sheet[2][col].check() && self.sheet[3][col].check() && self.sheet[4][col].check()) {
                    return true
                }
            }
            return false
            
        }
        
        func checkDiagonal() -> Bool {
            
            return ((self.sheet[0][0].check() && self.sheet[1][1].check() && self.sheet[2][2].check() && self.sheet[3][3].check() && self.sheet[4][4].check()) || (self.sheet[0][4].check() && self.sheet[1][3].check() && self.sheet[2][2].check() && self.sheet[3][1].check() && self.sheet[4][0].check()))
            
        }
        
    }

    @IBOutlet weak var aa: UIButton!
    @IBOutlet weak var ab: UIButton!
    @IBOutlet weak var ac: UIButton!
    @IBOutlet weak var ad: UIButton!
    @IBOutlet weak var ae: UIButton!
    @IBOutlet weak var ba: UIButton!
    @IBOutlet weak var bb: UIButton!
    @IBOutlet weak var bc: UIButton!
    @IBOutlet weak var bd: UIButton!
    @IBOutlet weak var be: UIButton!
    @IBOutlet weak var ca: UIButton!
    @IBOutlet weak var cb: UIButton!
    @IBOutlet weak var cc: UIButton!
    @IBOutlet weak var cd: UIButton!
    @IBOutlet weak var ce: UIButton!
    @IBOutlet weak var da: UIButton!
    @IBOutlet weak var db: UIButton!
    @IBOutlet weak var dc: UIButton!
    @IBOutlet weak var dd: UIButton!
    @IBOutlet weak var de: UIButton!
    @IBOutlet weak var ea: UIButton!
    @IBOutlet weak var eb: UIButton!
    @IBOutlet weak var ec: UIButton!
    @IBOutlet weak var ed: UIButton!
    @IBOutlet weak var ee: UIButton!
    var bb1:BingoSheet = BingoSheet("Brian")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func pressed(_ sender: UIButton) {
        var i: Int!
        var j: Int!
        switch sender {
        case aa:
            i = 0
            j = 0
        case ab:
            i = 0
            j = 1
        case ac:
            i = 0
            j = 2
        case ad:
            i = 0
            j = 3
        case ae:
            i = 0
            j = 4
        case ba:
            i = 1
            j = 0
        case bb:
            i = 1
            j = 1
        case bc:
            i = 1
            j = 2
        case bd:
            i = 1
            j = 3
        case be:
            i = 1
            j = 4
        case ca:
            i = 2
            j = 0
        case cb:
            i = 2
            j = 1
        case cc:
            i = 2
            j = 2
        case cd:
            i = 2
            j = 3
        case ce:
            i = 2
            j = 4
        case da:
            i = 3
            j = 0
        case db:
            i = 3
            j = 1
        case dc:
            i = 3
            j = 2
        case dd:
            i = 3
            j = 3
        case de:
            i = 3
            j = 4
        case ea:
            i = 4
            j = 0
        case eb:
            i = 4
            j = 1
        case ec:
            i = 4
            j = 2
        case ed:
            i = 4
            j = 3
        case ee:
            i = 4
            j = 4
        default:
            return
        }
        bb1.changeBox(i, j)
        sender.setTitle(String(bb1.sheet[i][j].checked), for: UIControl.State.normal)
        
    }
}
