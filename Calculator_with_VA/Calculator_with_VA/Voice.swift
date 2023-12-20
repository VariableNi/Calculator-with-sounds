//
//  Voice.swift
//  Calculator_with_VA
//
//  Created by VariableNi on 28.11.2023.
//  Copyright © 2023 VariableNi. All rights reserved.
//

import Foundation
import UIKit

struct Voice {
    var id  :Int
    var name:String
}

class VoiceData {
    var voices = [Voice]()
    init(){
        setupData()
    }
    func setupData(){
        let voice1 = Voice(id: 0, name: "Кел'Тузад")
        let voice2 = Voice(id: 1, name: "Лунтик")
        let voice3 = Voice(id: 2, name: "Сержант Дорнан")
        voices.append(voice1)
        voices.append(voice2)
        voices.append(voice3)
        
    }
}
