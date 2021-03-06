//
//  Exercise.swift
//  PhysioGuide_7
//
//  Created by Thomas Breen on 2015-11-22.
//  Copyright © 2015 Team STAR. All rights reserved.
//
//  This is a class that specifies the name, icon, and youtube URL for each exercise.

import UIKit

class Exercise {
    // MARK: Attributes
    
    let exerciseDict: [String:String] = ["1" : "Back Extensions", "2" : "Biceps Curl", "3" : "Calf Raise", "4" : "Cat Stretch", "5" : "Crunch", "6" : "Front and Back Neck Stretch", "7" : "Back Hyperextensions", "8" : "Jogging", "9" : "Jumping Jacks", "10" : "Knees to Chest", "11" : "Lateral Raise", "12" : "Leg Raises", "13" : "Lunges", "14" : "Modified Hurdler's Stretch", "15" : "Push-ups", "16" : "Quadriceps", "17" : "Reclined Hamstrings", "18" : "Runner's Lunge", "19" : "Russian Twist", "20" : "Shoulders Overhead", "21" : "Shoulders Posterior", "22" : "Shoulder Shrugs", "23" : "Side Hip Abductor", "24" : "Side Lunge", "25" : "Side Neck", "26" : "Side Trunk", "27" : "Spinal Twist", "28" : "Squats", "29" : "Upright Row", "30" : "Wall Calf Stretch"]
    
    let exIDDict: [String:String] = ["Back Extensions" : "1", "Biceps Curl" : "2","Calf Raise" : "3", "Cat Stretch" : "4", "Crunch" : "5", "Front and Back Neck Stretch" : "6", "Back Hyperextensions" : "7", "Jogging" : "8", "Jumping Jacks" : "9", "Knees to Chest" : "10", "Lateral Raise" : "11", "Leg Raises" : "12", "Lunges" : "13", "Modified Hurdler's Stretch" : "14", "Push-ups" : "15", "Quadriceps" : "16", "Reclined Hamstrings" : "17", "Runner's Lunge" : "18", "Russian Twist" : "19", "Shoulders Overhead" : "20", "Shoulders Posterior" : "21", "Shoulder Shrugs" : "22", "Side Hip Abductor" : "23", "Side Lunge" : "24", "Side Neck" : "25", "Side Trunk" : "26", "Spinal Twist" : "27", "Squats" : "28", "Upright Row" : "29", "Wall Calf Stretch" : "30"]
    
    let videoLinks : [String:String] = ["1" : "Z5uZ2Yr8bjY", "2" : "nj4qeipu6ic", "3" : "YF_OLR7tC70", "4" : "DJ9mt7WGxoY", "5" : "3NqsYksrh8U", "6" : "--CkUdvonHM", "7" : "skt2jpiO9K0", "8" : "xZ743T6ETFw", "9" : "BvXfzmkrVcE", "10" : "kbk6cBaAkNE", "11" : "AlOLjU5eoz8", "12" : "ekhduu0U4To", "13" : "BqFqA5r5eKY", "14" : "PueUqzq2Ddw", "15" : "ihYVrZ4lEGk", "16" : "pD88G_xDDGc", "17" : "-dnR5jnYt4A", "18" : "lw1Zcfq8uLc", "19" : "OliUe8K2-g8", "20" : "0_clMt1FRDI", "21" : "3IfDrM8hr4A", "22" : "51VfOKeagfw", "23" : "rDpP-EbBks8", "24" : "Oe-0GdCParQ", "25" : "qA8pkXa4sKA", "26" : "IDCDHX4PUy0", "27" : "lH8qdxViuy8", "28" : "10yQ6m7w__E", "29" : "oOdmnsVX_Pg", "30" : "QhBZt5rb1e0"]
    
    //let vidAddress : [String:String] =
    
    var name: String
    var icon: UIImage?
    var link: String // the URL
    var id: String?
    
    // MARK Initialization
    
    init? (name: String, link: String) {
        self.name = name
        self.icon = UIImage(named: exIDDict[name]!) //name
        self.id = exIDDict[name]
        self.link = videoLinks[self.id!]!
        
        print (exerciseDict.values)
        
        // Init fails if there's no name or URL
        if (name.isEmpty || link.isEmpty) {
            return nil
        }
    }
}