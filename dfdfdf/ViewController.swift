//
//  ViewController.swift
//  dfdfdf
//
//  Created by Narek Arsenyan on 11.09.21.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        // Do any additional setup after loading the view.
    }

    @IBAction func add(_ sender: Any) {
        let node = SCNNode()  // apple developer SCNCone u ev ayln
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white  // specular incha esi erevi kjogem testi vaxt inq camerayi luysna brnum
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue    // diffuse incha
        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x,y,z)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
}

extension ViewController {
    
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
//        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)    // es rangei paher@ hatuk debilneri hamar bacatrel
        return CGFloat.random(in: firstNum..<secondNum)    // es rangei paher@ hatuk debilneri hamar bacatrel
    }
    
    
    
}

