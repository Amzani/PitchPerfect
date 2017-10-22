//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Samir AMZANI on 21/10/2017.
//  Copyright © 2017 appyala. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play sound button pressed")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate:0.5)
        case .fast:
            playSound(rate:1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        print("stop button pressed")
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
        
        slowButton.contentMode = .center
        slowButton.imageView?.contentMode = .scaleAspectFit
        fastButton.contentMode = .center
        fastButton.imageView?.contentMode = .scaleAspectFit
        highButton.contentMode = .center
        highButton.imageView?.contentMode = .scaleAspectFit
        lowButton.contentMode = .center
        lowButton.imageView?.contentMode = .scaleAspectFit
        echoButton.contentMode = .center
        echoButton.imageView?.contentMode = .scaleAspectFit
        reverbButton.contentMode = .center
        reverbButton.imageView?.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
}
