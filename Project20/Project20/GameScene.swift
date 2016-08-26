//
//  GameScene.swift
//  Project20
//
//  Created by Jeffrey Eng on 8/25/16.
//  Copyright (c) 2016 Jeffrey Eng. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var gameTimer: NSTimer!
    var fireworks: [SKNode]()
    
    // constants defining where we launch fireworks from
    let leftEdge = -22
    let bottomEdge = -22
    let rightEdge = 1024 + 22
    
    // track player's score and update with a property observer
    var score: Int = 0 {
        didSet {
            "Score: \(score)"
        }
    }
    
    override func didMoveToView(view: SKView) {

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
