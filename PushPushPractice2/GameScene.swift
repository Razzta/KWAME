//
//  GameScene.swift
//  PushPushPractice2
//
//  Created by Raza Qarizada on 2015-10-05.
//  Copyright (c) 2015 Raza Qarizada. All rights reserved.
//

import SpriteKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    //adding our objects and environemnt
    
    var bg = SKSpriteNode()
    
    var bg2 = SKSpriteNode()
    
    var figure = SKSpriteNode()
    
    var gameOverLabel = SKLabelNode()
    
    var worldNode = SKNode()
    
    var cameraNode = SKNode()
    
    var labelContainer = SKSpriteNode()
    
    enum ColliderType: UInt32 {
        
        case figure = 1
        case ground = 2
    }
    
   var gameOver = false
    
    override func didMoveToView(view: SKView) {
        
        // F I G U R E   S T A T I O N A R Y
        
        self.anchorPoint = CGPointMake(0.5, 0.5)
        // assigning the image to the object we created (figure)
        
        
        // texture is to represent the image
        let figureTexture3 = SKTexture(imageNamed: "f3.png")
        
        figure = SKSpriteNode(texture: figureTexture3)
        
        figure.position = CGPoint(x: CGRectGetMidX(self.frame), y: 222)
        
        
        figure.zPosition = 5;
        

        self.addChild(worldNode)
        
        
        
        // B A C K    G R O U N D
        
        let bgTexture = SKTexture(imageNamed: "bgCn3.png")
      
        
        bg = SKSpriteNode(texture: bgTexture)
        
        
        //  bg.position = CGPointMake(self.size.width/2, self.size.height/2)
        
        bg.position = CGPoint(x: CGRectGetMidX(self.frame), y: 10)
        
        
        bg.zPosition = 0;
        
        // we added the figure and background as part of a child of the Wolrd node(which is the parent node of this scene)
        self.worldNode.addChild(figure)
        self.worldNode.addChild(bg)
        
        
        // G R O U N D
        
        var ground = SKNode()
        ground.position = CGPointMake(0, -390)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.width, 1))
        ground.physicsBody!.dynamic = false
        
        ground.physicsBody!.categoryBitMask = ColliderType.figure.rawValue
        ground.physicsBody!.contactTestBitMask = ColliderType.figure.rawValue
        ground.physicsBody!.collisionBitMask = ColliderType.figure.rawValue
        
        self.addChild(ground)
        
    
    }
    
    
    // function defining what CG Node we want the world to be centered on (in this case the figure)
    
    func centerOnView(center:CGPoint) {
        
        
        self.worldNode.position = CGPoint(x: 0 , y: -center.y)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        // F I G U R E     P U S H E D
        
        figure.hidden = true
        
        let figureTexture = SKTexture(imageNamed: "f1.png")
        let figureTexture2 = SKTexture(imageNamed: "f2.png")
        
        //this creates the animation to the figure
        let animation = SKAction.animateWithTextures([figureTexture, figureTexture2], timePerFrame: 0.1)
        let makeFigureFlap = SKAction.repeatActionForever(animation)
        
        // this applies the texture to the figure
        figure = SKSpriteNode(texture: figureTexture)
        
        //giving the figure a location (insert the cordinates)
        figure.position = CGPoint(x: CGRectGetMidX(self.frame), y: 222)
        
        //this adds/applies the animation to the figure sprite
        figure.runAction(makeFigureFlap)
        
        //this fix the depth in which the figure will appear on the screen(higher number the more forward it is)
        figure.zPosition = 5;
        
        figure.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        
        figure.physicsBody?.dynamic = true
        
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1).reversedAction()
            
            
            figure.runAction(SKAction.repeatActionForever(action))
            
            //  self.addChild(figure)
        }
        
        
        // this adds the figure to the scene(screen)
        self.addChild(figure)
        
        
        
//        let physicsGround = SKPhysicsBody(edgeFromPoint: CGPoint(x: CGRectGetMinX(self.frame), y: CGRectGetMinY(self.frame)+65), toPoint: CGPoint(x: CGRectGetMaxX(self.frame), y: CGRectGetMinY(self.frame)+65))
//        
//        self.physicsBody = physicsBody
        
   
        
        
        
            }
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        
        
        gameOver == true
        
        self.speed = 0
        
        gameOverLabel.fontName = "Helvetica"
        gameOverLabel.fontSize = 22
        gameOverLabel.text = "lol u a faggot Reiss, tap and try again : *"
        gameOverLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        gameOverLabel.zPosition = 2;
        labelContainer.addChild(gameOverLabel)
        
        //         figure.removeFromParent()
        //
        //            let figureTexture4 = SKTexture(imageNamed: "dead.png")
        //
        //            figure = SKSpriteNode(texture: figureTexture4)
        //
        //            figure.position = CGPoint(x: CGRectGetMidX(self.frame), y: -280)
        //
        //
        //            figure.zPosition = 5;
        //
        //
        //            self.addChild(figure)
        
    }
    
    override func didFinishUpdate() {
        
        // calling the centerOnView function to pass on the figure to it
        
        self.centerOnView(figure.position)

    }
    override func didSimulatePhysics() {
        
    }

    
    override func update(currentTime: CFTimeInterval) {
        
        
        // checking where the figure position
        print(figure.position.y)
        if figure.position.y <= -2000 {
            print("game over")
        }
        
       
    }
}
