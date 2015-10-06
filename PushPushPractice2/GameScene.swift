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
    
    var figure = SKSpriteNode()
    
    
    override func didMoveToView(view: SKView) {
        
        // F I G U R E   S T A T I O N A R Y
        
        
        // assigning the image to the object we created (figure)
        
        
        // texture is to represent the image
        let figureTexture3 = SKTexture(imageNamed: "f3.png")
        
        figure = SKSpriteNode(texture: figureTexture3)
        
        figure.position = CGPoint(x: CGRectGetMidX(self.frame), y: 222)

        
        figure.zPosition = 5;
        
        
        self.addChild(figure)
        
        
        
        // B A C K    G R O U N D
        
        let bgTexture = SKTexture(imageNamed: "bgCn3.png")
        
        bg = SKSpriteNode(texture: bgTexture)
        
      //  bg.position = CGPointMake(self.size.width/2, self.size.height/2)
        
        bg.position = CGPoint(x: CGRectGetMidX(self.frame), y: 10)
        
     //   bg.size.height = self.frame.height
        
        bg.zPosition = 0;
        
        self.addChild(bg)
        
        
        
        
     
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
        
        
        
        let physicsGround = SKPhysicsBody(edgeFromPoint: CGPoint(x: CGRectGetMinX(self.frame), y: CGRectGetMinY(self.frame)+65), toPoint: CGPoint(x: CGRectGetMaxX(self.frame), y: CGRectGetMinY(self.frame)+65))
        
        self.physicsBody = physicsBody
        
      
        
       
    }
    override func didSimulatePhysics() {
        //
        centerOnNode(figure)

    }
    func centerOnNode(node: SKNode) {
        var cameraPosition: CGPoint = (node.scene?.convertPoint(node.position, fromNode: node.parent!))!
        cameraPosition.x = 700
        
        let posX = node.parent?.position.x
        let posY = node.parent?.position.y
        
        node.parent?.position = CGPointMake(posX! - cameraPosition.x, posY! - cameraPosition.y)
        print("Following Player")
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        }
    }
