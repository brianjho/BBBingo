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
//                self.relabel(String(self.checked))
                
            }
            
            func setCheck(_ val:Bool){
                
                self.checked = val
//                self.relabel(String(self.checked))
                
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
            
            for _ in 0...4 {
                var row = [BingoBox]()
                for _ in 0...4 {
                    row += [BingoBox()]
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
        
        func setBox(_ i:Int, _ j:Int, _ val:Bool) -> Bool{
            
            self.sheet[i][j].setCheck(val)
            return self.sheet[i][j].check()
            
        }
        
        func checkBox(_ i:Int, _ j:Int) -> Bool{
            
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
                if (self.checkBox(row, 0) && self.checkBox(row, 1) && self.checkBox(row, 2) && self.checkBox(row, 3) && self.checkBox(row, 4)) {
                    return true
                }
            }
            return false
            
        }
        
        func checkVertical() -> Bool {
            
            for col in 0...4 {
                if (self.checkBox(0, col) && self.checkBox(1, col) && self.checkBox(2, col) && self.checkBox(3, col) && self.checkBox(4, col)) {
                    return true
                }
            }
            return false
            
        }
        
        func checkDiagonal() -> Bool {
            
            return ((self.checkBox(0, 0) && self.checkBox(1, 1) && self.checkBox(2, 2) && self.checkBox(3, 3) && checkBox(4, 4)) || (self.checkBox(0, 4) && self.checkBox(1, 3) && self.checkBox(2, 2) && checkBox(3, 1) && self.checkBox(4, 0)))
            
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
    @IBOutlet weak var resetButton: UIButton!
    var bb1:BingoSheet = BingoSheet("Brian")
    var buttons = [[UIButton]]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.buttons = [[self.aa, self.ab, self.ac, self.ad, self.ae], [self.ba, self.bb, self.bc, self.bd, self.be], [self.ca, self.cb, self.cc, self.cd, self.ce], [self.da, self.db, self.dc, self.dd, self.de], [self.ea, self.eb, self.ec, self.ed, self.ee]]
        
//        for buttonRow in self.buttons {
//            for indivButton in buttonRow {
//                indivButton.setTitle(":o", for: UIControl.State.normal)
//            }
//        }

    }
    
    @IBAction func pressed(_ sender: UIButton) {
        
        let coord = self.locateButton(sender)
        let checked = self.bb1.changeBox(coord[0], coord[1])
        if (checked) {
            sender.backgroundColor = UIColor.lightGray
        } else {
            sender.backgroundColor = UIColor.clear
        }
        
    }
    
    @IBAction func resetBingo(_ sender: UIButton) {
        
        var checked = false
        for i in 0...4 {
            for j in 0...4 {
                checked = self.bb1.setBox(i, j, false)
                if (checked) {
                    buttons[i][j].backgroundColor = UIColor.lightGray
                } else {
                    buttons[i][j].backgroundColor = UIColor.clear
                }
            }
        }
        print("Bingo sheet cleared.")
        
    }
    
    func locateButton(_ button: UIButton) -> [Int]{
        
        for i in 0...4 {
            for j in 0...4 {
                if (button == self.buttons[i][j]) {
                    return [i, j]
                }
            }
        }
        return [5, 5] // Should never reach here
        
    }
    
}
