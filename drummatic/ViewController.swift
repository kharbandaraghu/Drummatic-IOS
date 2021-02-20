//
//  ViewController.swift
//  drummatic
//
//  Created by Raghav Kharbanda on 2020-12-31.
//

import UIKit
import AVFoundation
var player: AVAudioPlayer?

class ViewController: UIViewController {


    @IBOutlet var beatButton: [UIButton]!
    @IBAction func bIn(_ sender: UIButton) {
        (sender as UIButton).backgroundColor = UIColor.darkGray
        playSound(nam: (sender.titleLabel?.text)!)
    }
    
    @IBAction func bpress(_ sender: UIButton) {
        (sender as UIButton).backgroundColor = UIColor.clear
    }
    

    func playSound(nam: String) {
        guard let url = Bundle.main.url(forResource: "sounds/"+nam, withExtension: "aif") else {
            print("url not found")
            return
        }

        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)

            /// change fileTypeHint according to the type of your audio file (you can omit this)

            /// for iOS 11 onward, use :
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /// else :
            /// player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)

            // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // set border arounf
        for i in beatButton{
            i.layer.borderColor = UIColor.darkGray.cgColor
            i.layer.borderWidth = 3.0
            i.layer.cornerRadius = 20.0
        }
        
    }


}

