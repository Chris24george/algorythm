//
//  ViewController.swift
//  Algorhythm
//
//  Created by Chris George on 4/14/15.
//  Copyright (c) 2015 chrisgeorge. All rights reserved.
//

import UIKit

class PlaylistMasterViewController: UIViewController {
    
    @IBOutlet weak var playlistImageView0: UIImageView!
    @IBOutlet weak var playlistImageView1: UIImageView!
    @IBOutlet weak var playlistImageView2: UIImageView!
    @IBOutlet weak var playlistImageView3: UIImageView!
    @IBOutlet weak var playlistImageView4: UIImageView!
    @IBOutlet weak var playlistImageView5: UIImageView!
    
    var playlistsArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistsArray += [playlistImageView0, playlistImageView1, playlistImageView2, playlistImageView3, playlistImageView4, playlistImageView5]
        
        for index in 0..<playlistsArray.count {
            let playlist = Playlist(index: index)
            let playlistImageView = playlistsArray[index]
            playlistImageView.image = playlist.icon
            playlistImageView.backgroundColor = playlist.backgroundColor
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showPlaylistDetailSegue" {
            let playlistImageView = sender!.view as! UIImageView
            let playlistDetailController = segue.destinationViewController as! PlaylistDetailViewController
            
            if let index = find(playlistsArray, playlistImageView) {
                playlistDetailController.playlist = Playlist(index: index)
            }
        }
    }

    
    
    @IBAction func showPlaylistDetail(sender: AnyObject) {
        performSegueWithIdentifier("showPlaylistDetailSegue", sender: sender)
    }
    
    
    
    
}


