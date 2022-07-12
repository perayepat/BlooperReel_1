//
//  BotResponse.swift
//  chatBot
//
//  Created by IACD-013 on 2022/03/21.
//

import Foundation
import SwiftUI

func getBotResponse(message: String) -> String{
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello"){
        return "He ll o There "
    }else if tempMessage.contains("goodbye"){
        return "Into the veil I go"
    }
    else if tempMessage.contains("who are you"){
        return "Im rick james *****"
    }
    else{
        return "... U+1F441"
    }
    
    
}
