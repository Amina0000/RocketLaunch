//
//  ViewController.swift
//  RocketLaungh
//
//  Created by Amina Karimova on 4/5/20.
//  Copyright © 2020 Amina Karimova. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var rocketContentview: UIView!
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var sucessLabel: UILabel!
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "launch", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        player = try? AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
    }

    @IBAction func powerButtonPressed(_ sender: Any) {
        rocketContentview.isHidden = false
        player.play()
        sucessLabel.isHidden = true
        let frame = rocketImageView.frame
        rocketImageView.frame.origin.y = 1000
        UIView.animate(withDuration: 3.5, animations: {

            self.rocketImageView.frame = frame
        }) { (_) in
            self.sucessLabel.isHidden = false
        }
    }
    
}

