//
//  ExampleSwiftUIView.swift
//  GuessTheFlagDemo
//
//  Created by IACD-013 on 2022/05/19.
//

import SwiftUI

struct ExampleSwiftUIView: View {
    @State private var showingAlert = false
    var body: some View {
        VStack {
                Button{
                    print("")
                } label: {
                    Label("Edit", systemImage: "pencil")
                        
            }
            //Alert
            
            Button("Show Alert"){
                showingAlert = true
            }
            .alert("Message", isPresented: $showingAlert){
                Button("Delete", role: .destructive){}
                Button("Cancel", role: .cancel){}
            } message: {
                Text("Read this")
            }
        }
    }
}

struct ExampleSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleSwiftUIView()
    }
}

    //
    //ZStack {
    //    VStack(spacing: 0) {
    //        Color(red: 0.2, green: 0.4, blue: 0.5)
    //        Color(red: 0.6, green: 0.9, blue: 0.6)
    //    }
    //    Text("Content")
    //        .foregroundColor(.secondary)
    //        .padding(50)
    //        .background(.ultraThinMaterial)
    //        .cornerRadius(30)
    //
    //}
    //.ignoresSafeArea()
    //
