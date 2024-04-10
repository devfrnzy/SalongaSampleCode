//
//  SongListViewModel.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import Foundation

/// This view model only serves as a replacement for the actual view model which has networking.  For the purpose of this sample code, this will be the only content of it.
class SongListViewModel: ObservableObject {
    @Published var songs = SongSample.songs()
}
