    //
    //  LandMarkDetail.swift
    //  LandmarkDemo
    //
    //  Created by IACD-013 on 2022/06/10.
    //

import SwiftUI

struct LandMarkDetail: View {
    var landmark: Landmark
    var body: some View {
        ScrollView{
            VStack {
                MapView(coordinate: landmark.locationCoordinates)
                    .ignoresSafeArea()
                    .frame(height: 300)
                
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)
                    HStack {
                        Text(landmark.park)
                            .font(.headline)
                        Spacer()
                        Text(landmark.state)
                    }
                    Divider()
                    
                    
                    Text("About \(landmark.name)")
                        .font(.title3)
                    Text(landmark.description)
                        .lineSpacing(5)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                }
                .padding()
                Spacer()
            }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LandMarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkDetail(landmark: landmarks[0])
    }
}
