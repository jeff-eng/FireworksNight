//
//  GameScene.swift
//  Project20
//
//  Created by Jeffrey Eng on 8/25/16.
//  Copyright (c) 2016 Jeffrey Eng. All rights reserved.
//

import GameplayKit
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
        // create SKSpriteNode instance for background
        let background = SKSpriteNode(imageNamed: "background")
        // position in center
        background.position = CGPoint(x: 512, y: 384)
        // specify blend mode
        background.blendMode = .Replace
        // define the z-position as -1 so it is behind everything else in the scene
        background.zPosition = -1
        // add node to scene as child
        addChild(background)
        
        // create and run the timer
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(6, target: self, selector: #selector(launchFireworks), userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
