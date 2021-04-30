//
//  ViewController.swift
//  FeatureCreature
//
//  Created by Sanjidah Abdullah on 4/30/21.
//  Copyright © 2021 Sanjidah Abdullah. All rights reserved.
//

import UIKit
import SafariServices
import AVFoundation
class ViewController: UIViewController, SPTAudioStreamingPlaybackDelegate, SPTAudioStreamingDelegate {
    var auth = SPTAuth.defaultInstance()!
    var session:SPTSession!
    var player: SPTAudioStreamingController?
    var loginUrl: URL?
    //var myplaylists = [SPTPartialPlaylist]()
    
    
    @IBOutlet weak var logButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAfterFirstLogin), name: NSNotification.Name(rawValue: "loginSuccessfull"), object: nil)

    }

    func setup () {
        let redirectURL = "featurecreature://returnafterlogin"
        let clientID = "b61afd3bed734244bfcbe6bc9ca8f3c1"
        auth.redirectURL = URL(string: redirectURL)
        auth.clientID = "b61afd3bed734244bfcbe6bc9ca8f3c1"
        auth.requestedScopes = [SPTAuthStreamingScope, SPTAuthPlaylistReadPrivateScope, SPTAuthPlaylistModifyPublicScope, SPTAuthPlaylistModifyPrivateScope]
        loginUrl = auth.spotifyWebAuthenticationURL()
        
      // searchButtn.alpha = 0
    }
    
    // May not need this since we are not playing music in our app
    func initializaPlayer(authSession:SPTSession){
        if self.player == nil {
            self.player = SPTAudioStreamingController.sharedInstance()
            self.player!.playbackDelegate = self
            self.player!.delegate = self
            try! player?.start(withClientId: auth.clientID)
            self.player!.login(withAccessToken: authSession.accessToken)
        }
    }
    
    @objc func updateAfterFirstLogin () {
        let userDefaults = UserDefaults.standard
        if let sessionObj:AnyObject = userDefaults.object(forKey: "SpotifySession") as AnyObject? {
            let sessionDataObj = sessionObj as! Data
            let firstTimeSession = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
            self.session = firstTimeSession
            initializaPlayer(authSession: session)
           }
    }
    
    func audioStreamingDidLogin(_ audioStreaming: SPTAudioStreamingController!) {
    // after a user authenticates a session, the SPTAudioStreamingController is then initialized and this method called
    print("logged in")
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if UIApplication.shared.openURL(loginUrl!){
            if auth.canHandle(auth.redirectURL) {
            //to do something
            }
        }
    }

}
