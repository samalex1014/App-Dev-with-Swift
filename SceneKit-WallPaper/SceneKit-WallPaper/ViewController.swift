//
//  ViewController.swift
//  SceneKit-WallPaper
//
//  Created by Smith, Sam on 12/11/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = [.vertical]

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else {
            print("ERROR")
            return
        }
        
        let paper = createWallPaper(anchorPlane: planeAnchor)
        
        node.addChildNode(paper)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
    }
    
    func createWallPaper(anchorPlane: ARPlaneAnchor) -> SCNNode {
        let node = SCNNode()
        
        
        if(anchorPlane.extent.x > 0) {
            let geometry = SCNPlane(width: CGFloat(anchorPlane.extent.x), height: CGFloat(anchorPlane.extent.y))
            node.geometry = geometry
        } else {
            let geometry = SCNPlane(width: CGFloat(anchorPlane.extent.z), height: CGFloat(anchorPlane.extent.y))
            node.geometry = geometry
        }

        
        node.eulerAngles.y = -Float.pi / 2
        node.opacity = 0.5
        
        print("Found Wall")
        
        node.geometry?.firstMaterial?.diffuse.contents = UIColor(named: "Red")
        
        return node
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
