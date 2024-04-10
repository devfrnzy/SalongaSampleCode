//
//  SongListPopup.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// Shows all the Songs related to current Word.
/// For this Sample Project, this will only display a list of songs without relation to the word.
struct SongListPopup: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject var songListViewModel = SongListViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black.opacity(0.2))
                .onTapGesture {
                    coordinator.dismissFullScreenCover()
                }
            VStack {
                Text("Song List")
                    .popupTitle()
                List {
                    ForEach(songListViewModel.songs, id:\.self) { song in
                        SongItemView(song: song)
                    }
                }
                .listRowInsets(EdgeInsets())
                .listStyle(.plain)
                .frame(maxHeight: 300)
                .padding(.bottom, 20)
                CapsuleButton("OK", fontSize: 17) {
                    coordinator.dismissFullScreenCover()
                }
                .padding(.horizontal, 60)
                
            }
            .padding(20)
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .background {
                Image("popupBG")
                    .resizable()
                    .cornerRadius(30)
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 5)
                    .foregroundColor(.gray)
                
            }
        }
        .presentationBackground(.black.opacity(0.2))
    }
}
