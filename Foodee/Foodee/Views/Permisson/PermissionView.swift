//
//  ContentView.swift
//  Foodee
//
//  Created by Gary Tokman on 9/21/21.
//

import SwiftUI

struct PermissionView: View {
    
    @State var isAnimating = false
    var animation: Animation{
        .interpolatingSpring(stiffness: 0.5, damping: 0.3)
            .repeatForever()
            .delay(isAnimating ? .random(in: 0...1):0)
            .speed(isAnimating ? .random(in: 0.1...1):0)
    }
    
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                
                ZStack{
                    //make each image show up twice
                    //And animation
                    ForEach(1..<14){ i in
                        Image("food\(i % 7)")
                        //na
                            .position(x: .random(in: 0...proxy.size.width), y: .random(in: 0...proxy.size.height))
                    }
                    .animation(animation)
                }.frame(height: proxy.size.height / 3)
                
                //Text & Button
                Text("Hot and Icy")
                    .font(.largeTitle)
                    .bold()
                
                Text("The 1st and 2nd place for good food")
                    .font(.body)
                
                Spacer()
                
                //button
                Button(action: {}){
                    Text("Get Started")
                        .bold()
                }
                .padding()
                .frame(maxWidth: proxy.size.width - 50)
                .background(Color.red)
                .cornerRadius(50)
                .shadow(radius: 10)
                .foregroundColor(.white)
                
            }.onAppear{
                isAnimating.toggle()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionView()
    }
}
