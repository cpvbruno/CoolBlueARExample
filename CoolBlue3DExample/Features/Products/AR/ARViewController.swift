//
//  ARViewController.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    private var placed = false
    private let tvFileName = "tv.scn"
    private let tvNodeName = "tv"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLighting()
        addTapGestureToSceneView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpSceneView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func setUpSceneView() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
        
        sceneView.delegate = self
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    }
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    @IBAction func backClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func addTapGestureToSceneView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ARViewController.addShipToSceneView(withGestureRecognizer:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func addShipToSceneView(withGestureRecognizer recognizer: UIGestureRecognizer) {
        let tapLocation = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        
        guard let hitTestResult = hitTestResults.first else { return }
        let translation = hitTestResult.worldTransform.translation
        let x = translation.x
        let y = translation.y
        let z = translation.z
        
        guard let tvScene = SCNScene(named: tvFileName),
            let tvNode = tvScene.rootNode.childNode(withName: tvNodeName, recursively: false)
            else { return }
        
        
        tvNode.position = SCNVector3(x,y,z)
        sceneView.scene.rootNode.addChildNode(tvNode)
        placed = true
    }
}

extension float4x4 {
    var translation: float3 {
        let translation = self.columns.3
        return float3(translation.x, translation.y, translation.z)
    }
}

extension ARViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        if !placed {
            let width = CGFloat(planeAnchor.extent.x)
            let height = CGFloat(planeAnchor.extent.z)
            let plane = SCNPlane(width: width, height: height)
            
            plane.materials.first?.diffuse.contents = UIColor.transparentLightBlue
            
            let planeNode = SCNNode(geometry: plane)
            
            let x = CGFloat(planeAnchor.center.x)
            let y = CGFloat(planeAnchor.center.y)
            let z = CGFloat(planeAnchor.center.z)
            planeNode.position = SCNVector3(x,y,z)
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as?  ARPlaneAnchor,
            let planeNode = node.childNodes.first,
            let plane = planeNode.geometry as? SCNPlane
            else { return }
        if !placed {
            let width = CGFloat(planeAnchor.extent.x)
            let height = CGFloat(planeAnchor.extent.z)
            plane.width = width
            plane.height = height
            
            let x = CGFloat(planeAnchor.center.x)
            let y = CGFloat(planeAnchor.center.y)
            let z = CGFloat(planeAnchor.center.z)
            planeNode.position = SCNVector3(x, y, z)
        }
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
