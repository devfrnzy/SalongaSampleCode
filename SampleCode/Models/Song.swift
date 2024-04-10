//
//  Song.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation

// Contains the details of the song that a Word would be initially connected to.
// For the purpose of this Sample, this is a separate entity without connection to the Word object and will only be used for display.
struct Song: Hashable {
    let title: String
    let artist: String
    let songURLString: String
    let albumImageName: String
}
