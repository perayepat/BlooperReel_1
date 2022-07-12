//
//  ContentView.swift
//  chatBot
//
//  Created by IACD-013 on 2022/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Chat with spirits from the beyond", "Or the ghost of goat man bridge"]
    
    var body: some View {
        VStack{
            HStack{
                Text("Ouija Bot")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 46))
                    .foregroundColor(Color.green)
            }
            ScrollView{
                //Messages
                ForEach(messages, id: \.self){
                    message in if message.contains("[USER]"){
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        HStack{
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue.opacity(0.8))
                                .cornerRadius(30)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                               
                        }
                    }else{
                            HStack{
                                Text(message)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(.gray.opacity(0.2))
                                    .cornerRadius(30)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10)
                                Spacer()
                        }
                    
                    }
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.05))
            HStack{
                TextField("Say Hello",text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(30)
                    .onSubmit {
                        //sendMessage
                        sendMessage(message: messageText)
                    }
                Button{
                    //send message
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal,10)
                
            }
            .padding()
        }
    }
    func sendMessage(message:String){
        withAnimation{
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
            withAnimation{
                messages.append(getBotResponse(message: message))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
