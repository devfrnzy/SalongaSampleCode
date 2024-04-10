//
//  SongSample.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation

/// For this sample code, the only purpose of this is to generate songs. This does not exist on the current Lyrically project.
class SongSample {
    class func songs() -> [Song]{
        let songA = Song(title: "You'll Be In My Heart", artist: "Phil Collins", songURLString: "-", albumImageName: "albumCoverSample")
        let songB = Song(title: "Friends on the Other Side", artist: "Keith David", songURLString: "-", albumImageName: "albumCoverSample")
        let songC = Song(title: "A Whole New World", artist: "Lea Salonga, Brad Kane", songURLString: "-", albumImageName: "albumCoverSample")
        let songD = Song(title: "Life is a Highway", artist: "Rascal Flatts", songURLString: "-", albumImageName: "albumCoverSample")
        let songE = Song(title: "Let It Go", artist: "Idina Menzel", songURLString: "-", albumImageName: "albumCoverSample")
        let songF = Song(title: "Part of Your World", artist: "Jodi Benson", songURLString: "-", albumImageName: "albumCoverSample")
        let songG = Song(title: "I2I", artist: "Tevin Campbell", songURLString: "-", albumImageName: "albumCoverSample")
        
        return [songA, songB, songC, songD, songE, songF, songG]
    }
}
