//
//  CardList.swift
//  BankingAppDesign
//
//  Created by IACD-013 on 2022/04/14.
//

import SwiftUI

struct CardList: View {
    var body: some View {
        CardRow()
    }
}

struct CardRow: View{
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack{
                ForEach(0..<10, id: \.self)
                {
                    item in CardView(isSelected: item == 0)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                }
            }
            .padding(20)
        }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList()
    }
}
