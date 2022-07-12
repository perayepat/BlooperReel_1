    //
    //  LandmarkList.swift
    //  LandmarkDemo
    //
    //  Created by IACD-013 on 2022/06/10.
    //

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    var fileredLandmarks: [Landmark]{
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
            List(fileredLandmarks) { landmark in
                NavigationLink{
                    LandMarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                    
                }
            }
            .listStyle(.plain)
            .navigationTitle("LandMarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
