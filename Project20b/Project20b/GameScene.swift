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

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
