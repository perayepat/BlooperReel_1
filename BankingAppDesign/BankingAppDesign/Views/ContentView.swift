    //
    //  ContentView.swift
    //  BankingAppDesign
    //
    //  Created by IACD-013 on 2022/04/13.
    //

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
                //        scrolling list
        CardsScreen()
            
            .tabItem{ Label("Home",systemImage: "house.fill")}
            VStack{}
            .tabItem{ Label("Statistic",systemImage: "chart.bar.fill")}
            VStack{}
            .tabItem{ Label("Wallet",systemImage: "creditcard.fill")}
            VStack{}
            .tabItem{ Label("Profile",systemImage: "person.fill")}

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
