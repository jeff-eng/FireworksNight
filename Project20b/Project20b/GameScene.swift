//
//  GameScene.swift
//  Project20b
//
//  Created by Jeffrey Eng on 8/26/16.
//  Copyright (c) 2016 Jeffrey Eng. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gameTimer: NSTimer!
    var fireworks = [SKNode]()
    
    let leftEdge = -22
    let bottomEdge = -22
    let rightEdge = 1024 + 22
    
    var score: Int = 0 {
        didSet {
            //put code here
        }
    }
    
    override func didMoveToView(view: SKView) {
        // create SKSpriteNode instance
        let background = SKSpriteNode(imageNamed: "background")
        // set the sprite node's position
        background.position = CGPoint(x: 512, y: 384)
        // define the blend mode as Replace
        background.blendMode = .Replace
        // set the z-position of the background to -1
        background.zPosition = -1
        // add the node to the scene
        addChild(background)
        
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(6, target: self, selector: #selector(launchFireworks), userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func launchFireworks() {
        
    }
}
