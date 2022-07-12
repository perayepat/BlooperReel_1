//
//  TransactionHeader.swift
//  BankingAppDesign
//
//  Created by IACD-013 on 2022/04/14.
//

import SwiftUI

struct TransactionHeader: View {
    var body: some View {
        Transactionheader()
    }
}

struct Transactionheader: View{
    var body: some View{
        VStack(spacing: -20){
            HStack(){
                Text("Send Money")
                    .font(.headline)
                Spacer()
//                MARK: TODO: Change to button
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .foregroundColor(Color.blue)
                    .frame(width: 30, height: 30)
                
                Text("add recipient")
                    .font(.headline)
            }
            .padding(20)
            .padding(.bottom, 60)
            .foregroundColor(Color.white)
            .background(Color.black)
            .cornerRadius(20)
            .offset(x:0,y: 15)
            .frame(width: 356, height: 80, alignment: .center)
            
            LazyVStack{
                ForEach(0..<10, id: \.self){
                    item in TransactionRow()
                }
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal)
            
        }

    }
}

struct TransactionHeader_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHeader()
    }
}
