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
    
    func createFirework(xMovement xMovement: CGFloat, x: Int, y: Int) {
        // 1) Create an SKNode that will act as the firework container, and place it at the X/Y position that was specified.
        let node = SKNode()
        node.position = CGPoint(x: x, y: y)
        
        // 2) Create a rocket sprite node, give it the name "firework" so we know that it's the important thing, then add it to the container node.
        let firework = SKSpriteNode(imageNamed: "rocket")
        firework.name = "firework"
        node.addChild(firework)
        
        // 3) Give the firework sprite node one of three random colors: cyan, green, or red. Use switch statement
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
        
        // 4) Create a UIBezierPath that will represent the movement of the firework.
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: xMovement, y: 1000))
        
        // 5) Tell the container node to follow that path, turning itself as needed.
        let move = SKAction.followPath(path.CGPath, asOffset: true, orientToPath: true, speed: 200)
        node.runAction(move)
        
        // 6) Create particles behind the rocket to make it look like the fireworks are lit.
        let emitter = SKEmitterNode(fileNamed: "fuse")!
        emitter.position = CGPoint(x: 0, y: -22)
        node.addChild(emitter)
        
        // 7) Add the firework to our fireworks array and to the scene
        fireworks.append(node)
        addChild(node)
    }
    
    func launchFireworks() {
        let movementAmount: CGFloat = 1800
        
        switch GKRandomSource.sharedRandom().nextIntWithUpperBound(4) {
        case 0:
            //fire five, straight up
            createFirework(xMovement: 0, x: 512, y: bottomEdge)
            createFirework(xMovement: 0, x: 512 - 200, y: bottomEdge)
            createFirework(xMovement: 0, x: 512 - 100, y: bottomEdge)
            createFirework(xMovement: 0, x: 512 + 100, y: bottomEdge)
            createFirework(xMovement: 0, x: 512 + 200, y: bottomEdge)
            
        case 1:
            //fire five, in a fan
            createFirework(xMovement: 0, x: 512, y: bottomEdge)
            createFirework(xMovement: -200, x: 512 - 200, y: bottomEdge)
            createFirework(xMovement: -100, x: 512 - 100, y: bottomEdge)
            createFirework(xMovement: 100, x: 512 + 100, y: bottomEdge)
            createFirework(xMovement: 200, x: 512 + 200, y: bottomEdge)
            
        case 2:
            //fire five, from the left to the right
            createFirework(xMovement: movementAmount, x: leftEdge, y: bottomEdge + 400)
            createFirework(xMovement: movementAmount, x: leftEdge, y: bottomEdge + 300)
            createFirework(xMovement: movementAmount, x: leftEdge, y: bottomEdge + 200)
            createFirework(xMovement: movementAmount, x: leftEdge, y: bottomEdge + 100)
            createFirework(xMovement: movementAmount, x: leftEdge, y: bottomEdge)
            
        case 3:
            //fire five, from the right to the left
            createFirework(xMovement: -movementAmount, x: rightEdge, y: bottomEdge + 400)
            createFirework(xMovement: -movementAmount, x: rightEdge, y: bottomEdge + 300)
            createFirework(xMovement: -movementAmount, x: rightEdge, y: bottomEdge + 200)
            createFirework(xMovement: -movementAmount, x: rightEdge, y: bottomEdge + 100)
            createFirework(xMovement: -movementAmount, x: rightEdge, y: bottomEdge)
            
        default:
            break
        }
    }
}
