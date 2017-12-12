//
//  Playlist.swift
//  Algorhythm
//
//  Created by Chris George on 4/16/15.
//  Copyright (c) 2015 chrisgeorge. All rights reserved.
//

import UIKit
import Foundation

struct Playlist {
    
    var title: String?
    var description: String?
    var icon: UIImage?
    var largeIcon: UIImage?
    var artists: [String] = []
    var backgroundColor: UIColor = UIColor.clearColor()
    
    
    
    init(index: Int) {
        let musicLibrary = MusicLibrary().library
        let playlistDictionary = musicLibrary[index]
        
        title = playlistDictionary["title"] as! String!
        description = playlistDictionary["description"] as! String!
        
        let iconName = playlistDictionary["icon"] as! String!
        icon = UIImage(named: iconName)
        let largeIconName = playlistDictionary["largeIcon"] as! String!
        largeIcon = UIImage(named: largeIconName)
        
        artists += playlistDictionary["artists"] as! [String]
        
        let colorDictionary = playlistDictionary["backgroundColor"] as! [String: CGFloat]!
        backgroundColor = rgbFromDictionary(colorDictionary)
    }
    
    func rgbFromDictionary(colorDictionary: [String: CGFloat]) -> UIColor {
        let red = colorDictionary["red"]!
        let green = colorDictionary["green"]!
        let blue = colorDictionary["blue"]!
        let alpha = colorDictionary["alpha"]!
        
        let color = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
        return color
    }
    
    
    
}