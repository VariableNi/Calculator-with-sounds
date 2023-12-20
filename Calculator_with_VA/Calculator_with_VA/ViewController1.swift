//
//  ViewController1.swift
//  Calculator_with_VA
//
//  Created by VariableNi on 28.11.2023.
//  Copyright © 2023 VariableNi. All rights reserved.
//

import UIKit
import Foundation

class ViewController1: UIViewController {

    
    @IBOutlet weak var pickerView: UIPickerView!
    var modelController: ModelController!
    
    var voice = VoiceData()
    var selected_voice: Voice?
    var sele_v: String!
    
    @IBAction func Show_calc(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            
            viewController.temp_voice = sele_v
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func Show_EngCalc(_ sender: UIButton) {
    }
    
    
    @IBAction func Show_progCalc(_ sender: UIButton) {
    }
    
    
    @IBAction func About_dev(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 {
            
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }

}

extension ViewController1:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1

    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 3
    }

}

extension ViewController1:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        let Voice = voice.voices[row]
        return Voice.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        let voice_ = voice.voices[row]
            selected_voice = voice_
        
        
        sele_v = selected_voice?.name
        
        if sele_v == "Лунтик"
        {
            sele_v = "_l"
        }
        
        else if sele_v == "Кел'Тузад"
        {
            sele_v = ""
        }
        
        else if sele_v == "Сержант Дорнан"
        
        {
            sele_v = "_s"
        }
        
    }
}

