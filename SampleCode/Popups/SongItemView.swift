//
//  SongItemView.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import SwiftUI

/// Serves as the Song row of the SongListPopup
struct SongItemView: View {
    @State var song: Song
    
    var body: some View {
        ZStack {
            HStack {
                Image(song.albumImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 50)
                VStack(alignment: .leading) {
                    Text(song.title)
                    Text(song.artist)
                }
                .font(.custom("Fredoka-Medium", size: 12))
            }
        }
        .background(.clear)
        .onTapGesture {
            //TODO: Proceed to Song Link to Apple Music
        }
    }
}

#Preview {
    SongItemView(song: Song(title: "Test Song", artist: "USHER", songURLString: "-", albumImageName: "albumCoverSample"))
}
