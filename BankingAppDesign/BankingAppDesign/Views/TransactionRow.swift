//
//  TransactionRow.swift
//  BankingAppDesign
//
//  Created by IACD-013 on 2022/04/14.
//

import SwiftUI

struct TransactionRow: View {
    var body: some View {
        Transactionrow()
    }
}

struct Transactionrow: View{
    var body: some View{
        HStack{
            Image("visaIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30, alignment: .center)
                .padding(5)
            VStack(alignment: .leading){
                Text("Dribble")
                    .font(.headline)
                Text("12 Nov 2020 11:09")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("-R60.00")
                .font(.headline)
        }
        .padding(8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow()
    }
}
