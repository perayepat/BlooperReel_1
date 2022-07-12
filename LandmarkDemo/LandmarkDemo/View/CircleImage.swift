//
//  CircleImage.swift
//  LandmarkDemo
//
//  Created by IACD-013 on 2022/06/10.
//

import SwiftUI

struct CircleImage: View {
    var image : Image
    
    var body: some View {
        image
            .resizable()
            .clipShape(Circle()) // Masking also works on this image
            .frame(width: 250, height: 250)
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .shadow(color: .black.opacity(0.3), radius: 8, x: 2, y: 5)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("TurtleRock"))
    }
}
