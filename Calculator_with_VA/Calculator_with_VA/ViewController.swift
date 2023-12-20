//
//  ViewController.swift
//  Calculator_with_VA
//
//  Created by VariableNi on 23.11.2023.
//  Copyright © 2023 VariableNi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var Result: UILabel!
    var player: AVAudioPlayer!
    var num1: Float!
    var num2: Float!
    var znak: String!
    var step_voice: String!
    var temp_voice = ""
    var modelController: ModelController!
    
    @IBAction func Equelse(_ sender: UIButton) {
        num2 = Float(Result.text!)
        
        if (znak == "plus")
        {
            
            if num1 == 2 && num2 == 2{
            
                Result.text = String(5)
                num1 = 0
                num2 = 0
                playSound(tag_but: "dvoechnik")
                
            }
            
            else
            {
                Result.text = String(num1 + num2)
                num1 = 0
                num2 = 0
                playSound(tag_but: "equelse")
            }
        }
        
        else if (znak == "minus")
        {
            Result.text = String(num1-num2)
            num1 = 0
            num2 = 0
            playSound(tag_but: "equelse")
        }
        
        else if (znak == "delimiter")
        {
            if (num1 == 0 || num2 == 0)
            {
                Result.text = "Ошибка"
                playSound(tag_but: "sorry")
            }
            
            else
            {
                Result.text = String(num1/num2)
                playSound(tag_but: "equelse")
            }
        }
        
        else if (znak == "multiply")
        {
            Result.text = String(num1*num2)
            num1 = 0
            num2 = 0
            playSound(tag_but: "equelse")
        }
        
    }
    
    @IBAction func Back_element(_ sender: UIButton) {
        
        var stroka: String!
        stroka = Result.text
        stroka.removeLast(1)
        Result.text = stroka
        playSound(tag_but: "remove_element1")
    }
    
    @IBAction func Add_point(_ sender: UIButton) {
        Result.text = Result.text! + "."
        playSound(tag_but: "point")
    }
    
    @IBAction func Clear_label(_ sender: UIButton) {
        Result.text = ""
        playSound(tag_but: "clear")
    }
    @IBAction func Minus_num(_ sender: UIButton) {
        num1 = Float(Result.text!)
        Result.text = ""
        znak = "minus"
        playSound(tag_but: "minus")
    }
    
    @IBAction func Delimiter(_ sender: UIButton) {
        num1 = Float(Result.text!)
        Result.text = ""
        znak = "delimiter"
        playSound(tag_but: "delimetor")
    }
    
    @IBAction func Multiply(_ sender: UIButton) {
        num1 = Float(Result.text!)
        Result.text = ""
        znak = "multiply"
        playSound(tag_but: "multiply")
    }
    
    @IBAction func Plus_num(_ sender: UIButton) {
        
        num1 = Float(Result.text!)
        Result.text = ""
        znak = "plus"
        playSound(tag_but: "plus")
    }
    
    @IBAction func Didgets(_ sender: UIButton) {
        if (Result.text == "0")
        {
            Result.text = String(sender.tag)
        }
        
        else
        {
            Result.text = Result.text! + String(sender.tag)
        }
        
        playSound(tag_but: String(sender.tag))
    }
    
    
    func playSound(tag_but: String){
        
        if tag_but == "dvoechnik"
        {
            let url = Bundle.main.url(forResource: tag_but, withExtension: "mp3")
            
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
            
            
        }
        
        else
        {
            let url = Bundle.main.url(forResource: tag_but+step_voice, withExtension: "mp3")
            
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
            
        }
        
        

    }
    
    @IBAction func BackMenu(_ sender: UILongPressGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        step_voice = temp_voice
        playSound(tag_but: "greating")
        
    }
}


