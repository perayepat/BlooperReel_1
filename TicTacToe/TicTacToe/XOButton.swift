//
//  XOButton.swift
//  TicTacToe
//
//  Created by IACD-013 on 2022/05/24.
//

import SwiftUI

struct XOButton: View {
    @Binding var letter: String /// We're going to pass this value to another view and change it in there
    @State private var degrees = 0.0
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(.secondary)
            Circle()
                .frame(width: 115, height: 115)
                .foregroundColor(.white)
            Text(letter)
                .font(.system(size: 50))
                .bold()
        }
        //MARK: Add the rotation effect when the button is clicked
        .rotation3DEffect(.degrees(degrees), axis:(x:1 , y:0, z:0))
        
        //MARK: Since there's going to be multiple tap gestures
        .simultaneousGesture(
        TapGesture()
            .onEnded{ _ in /// Animation after the tap gesture
                withAnimation(.easeIn(duration: 0.25)){
                    self.degrees -= 180
                }
            })
    }
}

struct XOButton_Previews: PreviewProvider {
    static var previews: some View {
        XOButton(letter: .constant("X"))
    }
}
