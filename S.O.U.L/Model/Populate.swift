//
//  Populate.swift
//  S.O.U.L
//
//  Created by Mateus Cavanholi on 05/06/2019.
//  Copyright © 2019 Mateus Cavanholi. All rights reserved.
//

import Foundation

class Populate {
    var sceneList = [Scene]()
    var pathList  = [Path]()
    
    init() {
        self.sceneList = popScene()
        self.pathList = popPath()
    }
    
    func popScene() -> [Scene] {
        // Populate Scene Data Base
        var sceneList = [Scene]()
        sceneList.append(Scene(index : 1, text : "The calm and refreshing breeze that accompanied you at the beginning of the journey had turn into a strong storm by the time the day ended.\nTo make matters worse, as the last ray of sun vanished and darkness surrounded you, you came to long and thin bridge.", path : [1, 0]))
        sceneList.append(Scene(index : 2, text : "Beneath the bridge, a deep chasm opened. If there were any river down there, it was impossible to know. Darkness had already settled and the howling wind made deafened any sound the river could make.\nYou remember a small village, just a few houses really, quite a long way back.", path : [2, 3]))
        sceneList.append(Scene(index : 16, text : "As you step ahead a sudden gust of wind make you almost tumble forward.", path : [4, 5], skill : "sight"))
        sceneList.append(Scene(index : 17, text : "As you turn around a sudden gust of wind make you almost tumble backward.", path : [6, 7], skill : "sight"))
        sceneList.append(Scene(index : 3, text : "The wind is strong and the bridge swings madly with each step you take. You’re halfway now, turn around is no longer an option.", path : [8, 9], skill : "ref"))
        sceneList.append(Scene(index : 6, text : "Two thirds of the way, you brave your way across.\nOne fifth left, almost there. \nAlmost there, almost.", path : [10, 0]))
        sceneList.append(Scene(index : 8, text : "The sound barely made to your ears.\nAs the bridge disappeared under your feet, you tried keep hold of the railing, but the rotten hope gave way as you began the painful descent. \nAt least you will know if there is a river down there or not.", path : [11, 0]))
        sceneList.append(Scene(index : 7, text : "As you inch your way across the bridge, you become more and more uneasy about it.\nFor a brief moment you look back, you can barely see the start of it, and the end is so close.", path : [12, 0]))
        sceneList.append(Scene(index : 9, text : "You barely heard the sound.\nBut your body acted before you could think and when you realise you were holding yourself on the precarious rope that once was the bridge railing.\nWith no time to think, you rush your way up.", path : [13, 0]))
        sceneList.append(Scene(index : 10, text : "With a racing heart and nearly breathless you made your way up to safety.\nYour body aches and and your hans are bleeding, but nothing matter now. \nThe road was firm ahead of you, solid ground. There shouldn’t be any more surprise until the end.", path : [14, 0]))
        sceneList.append(Scene(index : 4, text : "To cross the bridge under this weather is madness. It is better to make your way back to the village.", path : [15, 0]))
        sceneList.append(Scene(index : 11, text : "On the next day, long after the storm had ended, you return to the bridge.\nIt lies broken, the rotten ropes had snapped with the wind force.\nYou consider yourself lucky, for it could have failed while you were crossing.", path : [16, 0]))
        sceneList.append(Scene( index : 12, text : "Sadly, there is no other way across. \nYour journey came to an end you didn’t expected.\nBut far from the be the worse finale.", path : [17, 0]))
        sceneList.append(Scene(index : 5, text : "Fearing the worst you throw your body against the wind.\nYou overdue it and fall to your knees, but you fall on safe and solid ground.\nAs you stand up you see a small path leading alongside the cliff.", path : [18, 0]))
        sceneList.append(Scene(index : 13, text : "You follow the narrow path, so close to the chasm it is scary, but no sudden gust of wind hit you again and soon you found yourself walking away from it.\nAt the end, you see a small hut, it looks abandoned, there is no door. But it is a good enough place to spend the night, a far closer than the village.", path : [19, 0]))
        sceneList.append(Scene(index : 14, text : "The sun shines bright and the stormy wind turned back into a pleasant breeze by next morning.\nThe bridge is still there, still looking dangerous, but safe enough, if the wind hadn’t blow it away, you are quite sure it would hold yourself.", path : [20, 0]))
        sceneList.append(Scene(index : 15, text : "With great care you inch your way across it. With the bridge swing with each step, each plank cracking under your feet.\nBut no bad surprises happen and you make your way across safely.\nThe next bridge you would have to cross, it will be a firm stone one at the end of your journey.", path : [14, 0]))
        return sceneList
    }
    
    func popPath() -> [Path] {
        // Populate Path Data Base
        var pathList = [Path]()
        pathList.append(Path(index: 1, text: "Continue", target: 2))
        pathList.append(Path(index: 2, text: "Cross the Bridge", target: 16))
        pathList.append(Path(index: 3, text: "Return to the Village", target: 17))
        pathList.append(Path(index: 4, text: "Cross the Bridge", target: 3))
        pathList.append(Path(index: 5, text: "/Damn it!/", target: 5))
        pathList.append(Path(index: 6, text: "Return to the Village", target: 4))
        pathList.append(Path(index: 7, text: "/Oh Crap!/", target: 5))
        pathList.append(Path(index: 8, text: "/There’s no return now/", target: 6))
        pathList.append(Path(index: 9, text: "/!/", target: 7))
        pathList.append(Path(index: 10, text: "/Snap!/", target: 8))
        pathList.append(Path(index: 11, text: "/death is just another Journey/", target: 1))
        pathList.append(Path(index: 12, text: "/Snap!/", target: 9))
        pathList.append(Path(index: 13, text: "/No time to think now!/", target: 10))
        pathList.append(Path(index: 14, text: "/the Journey continues/", target: 1))
        pathList.append(Path(index: 15, text: "Continue", target: 11))
        pathList.append(Path(index: 16, text: "The Journey Ends", target: 12))
        pathList.append(Path(index: 17, text: "/there is always a new Journey/", target: 1))
        pathList.append(Path(index: 18, text: "Follow the Path", target: 13))
        pathList.append(Path(index: 19, text: "Continue", target: 14))
        pathList.append(Path(index: 20, text: "Cross the Bridge", target: 15))
        
        return pathList
    }
}


