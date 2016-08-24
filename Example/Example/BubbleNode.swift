//
//  BubbleNode.swift
//  Example
//
//  Created by Neverland on 15.08.15.
//  Copyright (c) 2015 ProudOfZiggy. All rights reserved.
//

import Foundation

import UIKit
import SpriteKit
import QuartzCore

class BubbleNode: SIFloatingNode, UITextFieldDelegate {
    var labelNode = SKLabelNode(fontNamed: "")
    
    class func instantiate() -> BubbleNode! {
        let node = BubbleNode(circleOfRadius: 50)
        configureNode(node)
                return node
    }
    
    class func configureNode(node: BubbleNode!) {
        
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.touchesBegan(_:withEvent:)))
//        node.addGestureRecognizer(tap)
        

        
        node.name = "BubbleNode"
        
        
        let boundingBox = CGPathGetBoundingBox(node.path);
        let radius = boundingBox.size.width / 2.0;
        node.physicsBody = SKPhysicsBody(circleOfRadius: radius + 1.5)
        
        

//start //        let imageaaa:UIImage = UIImage(named: "SwFFSP5.jpg")!
//        let imageView: UIImageView = UIImageView(image: imageaaa)
//        imageView.frame = CGRectMake(0, 0, 50, 50)
//        imageView.clipsToBounds = true
//        var layer: CALayer = CALayer()
//        layer = imageView.layer
//        
//        layer.masksToBounds = true
//        layer.cornerRadius = CGFloat(1000)
//        
//        UIGraphicsBeginImageContext(imageView.bounds.size)
//        layer.renderInContext(UIGraphicsGetCurrentContext()!)
//        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        
//        let Texture = SKTexture(image: roundedImage)
//        let imageFromNodeTexture = SKSpriteNode(texture: Texture)
//        node.addChild(imageFromNodeTexture) //end
        
        /*
        //let image = SKSpriteNode(imageNamed: "att_open-graph_icon_1.png")
        
        let imageForCircles:SKSpriteNode = SKSpriteNode(imageNamed:"SwFFSP5.jpg")
        imageForCircles.name = "att"
        imageForCircles.size = CGSizeMake(radius+20, 50)
        
        node.addChild(imageForCircles) // works fine */
        
        //        node.fillColor = SKColor.blackColor()

        
        node.strokeColor = node.fillColor
        node.labelNode.text = "Hello"
        node.labelNode.position = CGPointZero
        node.labelNode.fontColor = SKColor.blackColor()
        node.labelNode.fontSize = 10
        node.labelNode.userInteractionEnabled = false
        node.labelNode.verticalAlignmentMode = .Center
        node.labelNode.horizontalAlignmentMode = .Center
        node.addChild(node.labelNode)
    }
    
    override func selectingAnimation() -> SKAction? {
        removeActionForKey(BubbleNode.removingKey)
        return SKAction.scaleTo(1.3, duration: 0.2)
    }
    
    override func normalizeAnimation() -> SKAction? {
        removeActionForKey(BubbleNode.removingKey)
        return SKAction.scaleTo(1, duration: 0.2)
    }
    
    override func removeAnimation() -> SKAction? {
        removeActionForKey(BubbleNode.removingKey)
        return SKAction.fadeOutWithDuration(0.2)
    }
    
    override func removingAnimation() -> SKAction {
        let pulseUp = SKAction.scaleTo(xScale + 0.13, duration: 0)
        let pulseDown = SKAction.scaleTo(xScale, duration: 0.3)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatActionForever(pulse)
        return repeatPulse
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
                let touch:UITouch? = touches.first
        if let touch = touch {
            let touchLocation = touch.locationInNode(self)
            let nodes = self.nodesAtPoint(touchLocation)
            
            for node in nodes {
                let nodePosition = node.zPosition
                
                if node.name == "BubbleNode" {
                    print("got bubble node position \(nodePosition)")

                }
            }
            
            
        }
    }
    
    
    
    
}