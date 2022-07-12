//
//  CardsScreen.swift
//  BankingAppDesign
//
//  Created by IACD-013 on 2022/04/14.
//

import SwiftUI

struct CardsScreen: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(CGColor(red: 181, green: 192, blue: 255, alpha: 1)).edgesIgnoringSafeArea(.all)
                ScrollView(.vertical){
                    CardList()
                    TransactionView()
                }
                .navigationTitle(Text("My Cards"))
            }
        }
    }
}

struct CardsScreen_Previews: PreviewProvider {
    static var previews: some View {
        CardsScreen()
    }
}
