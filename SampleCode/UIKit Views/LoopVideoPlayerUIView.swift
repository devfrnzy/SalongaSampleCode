//
//  LoopVideoPlayerUIView   .swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation
import AVKit

/// A UIKit View which plays a video on loop based on the given file name and extension
/// Best used as a background video.
class LoopVideoPlayerUIView: UIView {
    
    
    deinit {
        /// Remove self as an observer on all notifications in order to prevent Zombie Objects
        NotificationCenter.default.removeObserver(self)
    }
    
    
    private let playerLayer = AVPlayerLayer()
    let fileName: String
    let fileExtension: String
    
    
    init(frame: CGRect, fileName: String, fileExtension: String) {
        self.fileName = fileName
        self.fileExtension = fileExtension
        super.init(frame: frame)
        setupPlayer()
    }
    
    func setupPlayer() {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("DEBUG: File does not exist")
            return
        }
        
        let player = AVPlayer(url: fileURL)
        player.actionAtItemEnd = .none
        player.play()
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)

        layer.addSublayer(playerLayer)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: .zero, completionHandler: nil)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
