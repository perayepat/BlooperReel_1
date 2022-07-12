//
//  CardView.swift
//  BankingAppDesign
//
//  Created by IACD-013 on 2022/04/13.
//

import SwiftUI

struct CardView: View {
    @State var isSelected :Bool = false
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Image("visaIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 40)
                    .foregroundColor(isSelected ? .white : .black)
                    .padding(3)
            }
            Spacer()
            Text("Balance")
                .font(.caption)
                .foregroundColor(isSelected ? .white : .black)
                .padding(.bottom)
            HStack(alignment:.center){
                Text("USD")
                    .font(.headline)
                    .foregroundColor(isSelected ? .white : .black)
                Text("$13,000.00")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(isSelected ? .white : .black)
            }
            .padding(.bottom)
            Spacer()
            Text("**** **** ***** 2093")
                .foregroundColor(isSelected ? .white : .black)
                .font(.body)
                .padding(.bottom)
        }
        .frame(width: 245, height: 170)
        .padding(8)
        .background(isSelected ? Color.blue: Color.white)
        .cornerRadius(20)
       
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(isSelected: true)
            .previewLayout(.sizeThatFits)
        CardView()
            .previewLayout(.sizeThatFits)
    }
}
