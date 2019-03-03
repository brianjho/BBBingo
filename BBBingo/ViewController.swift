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
        
        func changeBox(_ i:Int, _ j:Int) -> Bool{
            
            self.sheet[i][j].switchCheck()
            if (self.checkBingo()) {
                print(self.name + " got a bingo!")
            }
            return self.sheet[i][j].check()
            
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
        
        let coord = String(sender.currentTitle!)
        
        var start = coord.index(coord.startIndex, offsetBy: 0)
        var end = coord.index(coord.endIndex, offsetBy: -1)
        var range = start..<end
        
        let i = Int(coord[range])
        
        start = coord.index(coord.startIndex, offsetBy: 1)
        end = coord.index(coord.endIndex, offsetBy: 0)
        range = start..<end
        
        let j = Int(coord[range])
        
        let checked = bb1.changeBox(i!, j!)
        if (checked) {
            sender.backgroundColor = UIColor.lightGray
        } else {
            sender.backgroundColor = UIColor.clear
        }
        
    }
}
