    //
    //  ContentView.swift
    //  GuessTheFlagDemo
    //
    //  Created by IACD-013 on 2022/05/18.
    //

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State  var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        
        ZStack {
            Color.black.opacity(0.25)
                .ignoresSafeArea()
            VStack(){
                VStack{
                    Text(" Tap the flag of")
                        .font(.title2)
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                        
                }
                
                ForEach(0..<3){number in
                    Button{
                        //flag was tapped
                        flagTapped(number)
                    }label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                            .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 2)
                    }
                }
            }
        }//Alert
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        }message: {
            Text("Your score is: \(scoreTitle)")
        }
    }
    
    //Tapped method
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
        }else{
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    //New game
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

