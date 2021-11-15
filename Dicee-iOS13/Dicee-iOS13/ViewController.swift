//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView3: UIImageView!
    @IBOutlet weak var diceImageView4: UIImageView!
    @IBOutlet weak var diceImageView5: UIImageView!
    @IBOutlet weak var diceImageView6: UIImageView!
    @IBOutlet weak var resultView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    var randomGenerator : [Int] = []
    
    
    func getResult(inputArray:[Int]) -> String {
        
        let counts = inputArray.reduce(into: [:]) { counts, word in counts[word, default: 0] += 1 }
        
        func compareResult(resultDict : Dictionary<Int, Int>) -> String {
            // 六子
            if counts.values.contains(6) {
                switch counts.someKey(forValue: 6) {
                case 1,4:
                    return("六红")
                default:
                    return("六黑")
                }
            }

            // 五子
            if counts.values.contains(5) {
                switch counts.someKey(forValue: 5) {
                case 4:
                    break
                default:
                    return("五子")
                }
            }
            
            // 对堂
            if counts.count == 6 {
                return("对堂")
            }
            
            // 四进
            if counts.values.contains(4) {
                switch counts.someKey(forValue: 4) {
                case 4:
                    break
                default:
                    return("四进")
                }
            }

            // 四点出现的情况
            switch counts[4] {
                case 4,5,6:
                    switch counts[1] {
                        case 2:
                            return("状元插金花")
                        default:
                            return("状元")
                    }
                case 3:
                    return("三红")
                case 2:
                    return("二举")
                case 1:
                    return("一秀")
                default:
                    break
            }
            return("")
            
        }

        return compareResult(resultDict : counts)
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
//        two ways to randomize the image
        randomGenerator = [Int.random(in: 1...6),Int.random(in: 1...6),Int.random(in: 1...6),Int.random(in: 1...6),Int.random(in: 1...6),Int.random(in: 1...6)]
        
        diceImageView1.image = diceArray[randomGenerator[0]-1]
        diceImageView2.image = diceArray[randomGenerator[1]-1]
        diceImageView3.image = diceArray[randomGenerator[2]-1]
        diceImageView4.image = diceArray[randomGenerator[3]-1]
        diceImageView5.image = diceArray[randomGenerator[4]-1]
        diceImageView6.image = diceArray[randomGenerator[5]-1]
        
        resultView.text = getResult(inputArray:randomGenerator)
    }

}

