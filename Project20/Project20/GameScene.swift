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
    
    func createFirework(xMovement xMovement: CGFloat, x: Int, y: Int) {
        // 1) Create an SKNode that will act as the firework container, and place it at the X/Y position that was specified
        let node = SKNode()
        node.position = CGPoint(x: x, y: y)
        
        // 2) Create a rocket sprite node, give it the name "firework" so we know that it's the important thing, then add it to the container node
        let firework = SKSpriteNode(imageNamed: "rocket")
        firework.name = "firework"
        node.addChild(firework)
        
        // 3) Give the firework sprite node one of three random colors: cyan, green or red.  Use a switch statement for each color according the random number
        switch GKRandomSource.sharedRandom().nextIntWithUpperBound(3) {
        case 0:
            firework.color = UIColor.cyanColor()
            firework.colorBlendFactor = 1
        
        case 1:
            firework.color = UIColor.greenColor()
            firework.colorBlendFactor = 1
            
        case 2:
            firework.color = UIColor.redColor()
            firework.colorBlendFactor = 1
        
        default:
            break
        }
        
        // 4) Create a UIBezierPath that will represent the movement of the firework
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: xMovement, y: 1000))
        
        // 5) Tell the container node to follow the path, turn itself as needed.
        let move = SKAction.followPath(path.CGPath, asOffset: true, orientToPath: true, speed: 200)
        node.runAction(move)
        
        // 6) Create particles behind the rocket to make it look like the fireworks are lit.
        let emitter = SKEmitterNode(fileNamed: "fuse")!
        emitter.position = CGPoint(x: 0, y: -22)
        node.addChild(emitter)
        
        // 7) Add the firework to our fireworks array and also to the scene
        fireworks.append(node)
        addChild(node)
    }
}
