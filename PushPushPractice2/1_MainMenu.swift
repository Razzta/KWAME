//
//  1_MainMenu.swift
//  PushPushPractice2
//
//  Created by Raza Qarizada on 2015-10-07.
//  Copyright © 2015 Raza Qarizada. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "BG.png")
     //   background.posByCanvas(0.5, y: 0.5)
        background.xScale = 1.2
        background.yScale = 1.2
        background.zPosition = -1
        addChild(background)
        
    }
   
    
}
