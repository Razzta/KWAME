//
//  0_Intoducer.swift
//  PushPushPractice2
//
//  Created by Raza Qarizada on 2015-10-07.
//  Copyright © 2015 Raza Qarizada. All rights reserved.
//

import SpriteKit

class Introducer: SKScene {
    
    var logoSprite:SKSpriteNode?
    var isLoading = false
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor.grayColor()
        
        let atlas = SKTextureAtlas(named: "SampleAssets")
        logoSprite = SKSpriteNode(texture: atlas.textureNamed("logo"))
        logoSprite!.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        addChild(logoSprite!)
        
     //   let animInitial:SKAction = SKAction.group([SKAction.scaleTo(1, duration: 0.8), SKAction.fadeAlphaTo(1, duration: 0.6)])
        
      
    }
    
}