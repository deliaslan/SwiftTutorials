//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by Adem Deliaslan on 27.02.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate{ //SKPhysicsContactDelegate dünyamızın algılaması için ekledik
    
    //    var bird2 = SKSpriteNode()
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode(), box2 = SKSpriteNode(), box3 = SKSpriteNode(), box4 = SKSpriteNode(), box5 = SKSpriteNode()
    var gameStarted = false
    var originalPosition : CGPoint?
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum Collidertype: UInt32 {
        case Bird = 1
        case Box = 2
        case Ground = 4
        case Tree = 8
    }
    
    override func didMove(to view: SKView) {
        //        let texture = SKTexture(imageNamed: "bird")
        //        bird2 = SKSpriteNode(texture: texture)
        //        bird2.position = CGPoint(x: 0, y: 0)
        //        bird2.size = CGSize(width: 100, height: 100) // bu şekilde yaptığımızda her ekranda farklı şekilde görünecektir
        //        bird2.size = CGSize(width: self.frame.width/15, height: self.size.height/11)
        //        bird2.zPosition = 1
        //        self.addChild(bird2)
        
        //Physics Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame) // ekran sınırlarını belirliyoruz.
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self //kendi dünyamzı algılatmak için
        
        // Bird
        bird = childNode(withName: "bird") as! SKSpriteNode
        
        let birdTexture = SKTexture(imageNamed: "bird")
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 12) //nesnemizin sınırlarını belirliyoruz.
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.20
        originalPosition = bird.position
        
        //çarpışmaları algılamak içim
        bird.physicsBody?.contactTestBitMask = Collidertype.Bird.rawValue
        bird.physicsBody?.categoryBitMask = Collidertype.Bird.rawValue
        bird.physicsBody?.collisionBitMask = Collidertype.Box.rawValue
        
        //Boxes
        
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 6, height: boxTexture.size().height / 6)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.2
        
        box1.physicsBody?.collisionBitMask = Collidertype.Bird.rawValue //çarpışmayı algılama
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.2
        
        box2.physicsBody?.collisionBitMask = Collidertype.Bird.rawValue
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.2
        
        box3.physicsBody?.collisionBitMask = Collidertype.Bird.rawValue
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.2
        
        box4.physicsBody?.collisionBitMask = Collidertype.Bird.rawValue
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.2
        
        box5.physicsBody?.collisionBitMask = Collidertype.Bird.rawValue
        
        //Label
        scoreLabel.fontName = "Helvetica"
        scoreLabel.color = .brown
        scoreLabel.fontSize = 45
        scoreLabel.text = "0"
        
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 3)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
        
        
    }
    //kendi dünyamızdan birbirine değenler varmı
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.collisionBitMask == Collidertype.Bird.rawValue || contact.bodyB.collisionBitMask == Collidertype.Bird.rawValue {
//            print("Contacted") //test code
            score += 1
            scoreLabel.text = String(score)
            
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        bird.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 100)) //kuvvet uygulayarak y konumunda yükseltiyoruz.
//        bird.physicsBody?.affectedByGravity = true
        
        if gameStarted == false{
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false{
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false{
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                let dx = -(touchLocation.x - originalPosition!.x)
                                let dy = -(touchLocation.y - originalPosition!.y)
                                
                                let impulse = CGVector(dx: dx*3, dy: dy*3)
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if let birdPhysicsBody = bird.physicsBody {
            if birdPhysicsBody.velocity.dx <= 0 && birdPhysicsBody.velocity.dy <= 0 && birdPhysicsBody.angularVelocity <= 0 && gameStarted == true {
                bird.physicsBody?.affectedByGravity = false
                birdPhysicsBody.velocity = CGVector(dx: 0, dy: 0)
                bird.zPosition = 1
                bird.position = originalPosition!
                gameStarted = false
            }
        }
    }
}
