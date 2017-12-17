//
//  SmileLoaderView.swift
//
//  Code generated using QuartzCode 1.63.0 on 17/12/17.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class SmileLoaderView: UIView, CAAnimationDelegate {

    var updateLayerValueForCompletedAnimation : Bool = false
    var completionBlocks = [CAAnimation: (Bool) -> Void]()
    var layers = [String: CALayer]()



    //MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperties()
        setupLayers()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupProperties()
        setupLayers()
    }



    func setupProperties(){

    }

    func setupLayers(){
        self.backgroundColor = UIColor(red:1, green: 0.195, blue:0.158, alpha:0)

        let rotationRef = CAShapeLayer()
        rotationRef.frame = CGRect(x: 5.5, y: 5.5, width: 89, height: 89)
        rotationRef.path = rotationRefPath().cgPath
        self.layer.addSublayer(rotationRef)
        layers["rotationRef"] = rotationRef
        let eye1 = CAShapeLayer()
        eye1.frame = CGRect(x: 16, y: 17, width: 12, height: 12)
        eye1.path = eye1Path().cgPath
        rotationRef.addSublayer(eye1)
        layers["eye1"] = eye1
        let eye2 = CAShapeLayer()
        eye2.frame = CGRect(x: 61.58, y: 17, width: 12, height: 12)
        eye2.path = eye2Path().cgPath
        rotationRef.addSublayer(eye2)
        layers["eye2"] = eye2

        let smile = CAShapeLayer()
        smile.frame = CGRect(x: 18.5, y: 18.5, width: 63, height: 63)
        smile.path = smilePath().cgPath
        self.layer.addSublayer(smile)
        layers["smile"] = smile

        resetLayerProperties(forLayerIdentifiers: nil)
    }

    func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
        CATransaction.begin()
        CATransaction.setDisableActions(true)

        if layerIds == nil || layerIds.contains("rotationRef"){
            let rotationRef = layers["rotationRef"] as! CAShapeLayer
            rotationRef.fillColor   = nil
            rotationRef.strokeColor = UIColor(red:0.404, green: 0.404, blue:0.404, alpha:0).cgColor
            rotationRef.lineWidth   = 10
        }
        if layerIds == nil || layerIds.contains("eye1"){
            let eye1 = layers["eye1"] as! CAShapeLayer
            eye1.fillColor   = UIColor(red:0.99, green: 1, blue:1, alpha:1).cgColor
            eye1.strokeColor = UIColor(red:0.404, green: 0.404, blue:0.404, alpha:1).cgColor
            eye1.lineWidth   = 0
        }
        if layerIds == nil || layerIds.contains("eye2"){
            let eye2 = layers["eye2"] as! CAShapeLayer
            eye2.fillColor   = UIColor(red:0.99, green: 1, blue:1, alpha:1).cgColor
            eye2.strokeColor = UIColor(red:0.404, green: 0.404, blue:0.404, alpha:1).cgColor
            eye2.lineWidth   = 0
        }
        if layerIds == nil || layerIds.contains("smile"){
            let smile = layers["smile"] as! CAShapeLayer
            smile.lineCap     = kCALineCapRound
            smile.fillColor   = nil
            smile.strokeColor = UIColor(red:0.99, green: 1, blue:1, alpha:1).cgColor
            smile.lineWidth   = 12
        }

        CATransaction.commit()
    }

    //MARK: - Animation Setup

    func addLoaderAnimation(){
        resetLayerProperties(forLayerIdentifiers: ["rotationRef", "smile"])

        let fillMode : String = kCAFillModeForwards

        ////An infinity animation

        ////RotationRef animation
        let rotationRefTransformAnim      = CAKeyframeAnimation(keyPath:"transform.rotation.z")
        rotationRefTransformAnim.values   = [0,
                                             -720 * CGFloat.pi/180]
        rotationRefTransformAnim.keyTimes = [0, 1]
        rotationRefTransformAnim.duration = 2.69
        rotationRefTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)

        let rotationRefAnchorPointAnim       = CAKeyframeAnimation(keyPath:"anchorPoint")
        rotationRefAnchorPointAnim.values    = [NSValue(cgPoint: CGPoint(x: 0.5, y: 0.5)), NSValue(cgPoint: CGPoint(x: 0.5, y: 0.5))]
        rotationRefAnchorPointAnim.keyTimes  = [0, 1]
        rotationRefAnchorPointAnim.duration  = 1.3
        rotationRefAnchorPointAnim.beginTime = 2.69

        let rotationRefLoaderAnim : CAAnimationGroup = QCMethod.group(animations: [rotationRefTransformAnim, rotationRefAnchorPointAnim], fillMode:fillMode)
        rotationRefLoaderAnim.repeatCount = Float.infinity
        layers["rotationRef"]?.add(rotationRefLoaderAnim, forKey:"rotationRefLoaderAnim")

        ////Smile animation
        let smileStrokeEndAnim      = CAKeyframeAnimation(keyPath:"strokeEnd")
        smileStrokeEndAnim.values   = [0.5, 1]
        smileStrokeEndAnim.keyTimes = [0, 1]
        smileStrokeEndAnim.duration = 1.34

        let smileStrokeStartAnim            = CAKeyframeAnimation(keyPath:"strokeStart")
        smileStrokeStartAnim.values         = [0, 0.5]
        smileStrokeStartAnim.keyTimes       = [0, 1]
        smileStrokeStartAnim.duration       = 1.34
        smileStrokeStartAnim.beginTime      = 1.34
        smileStrokeStartAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)

        let smileTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
        smileTransformAnim.values         = [-225 * CGFloat.pi/180,
                                             -765 * CGFloat.pi/180]
        smileTransformAnim.keyTimes       = [0, 1]
        smileTransformAnim.duration       = 2.69
        smileTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)

        let smileAnchorPointAnim       = CAKeyframeAnimation(keyPath:"anchorPoint")
        smileAnchorPointAnim.values    = [NSValue(cgPoint: CGPoint(x: 0.5, y: 0.5)), NSValue(cgPoint: CGPoint(x: 0.5, y: 0.5))]
        smileAnchorPointAnim.keyTimes  = [0, 1]
        smileAnchorPointAnim.duration  = 1.3
        smileAnchorPointAnim.beginTime = 2.69

        let smileLoaderAnim : CAAnimationGroup = QCMethod.group(animations: [smileStrokeEndAnim, smileStrokeStartAnim, smileTransformAnim, smileAnchorPointAnim], fillMode:fillMode)
        smileLoaderAnim.repeatCount = Float.infinity
        layers["smile"]?.add(smileLoaderAnim, forKey:"smileLoaderAnim")
    }

    //MARK: - Animation Cleanup

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        if let completionBlock = completionBlocks[anim]{
            completionBlocks.removeValue(forKey: anim)
            if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
                updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
                removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
            }
            completionBlock(flag)
        }
    }

    func updateLayerValues(forAnimationId identifier: String){
        if identifier == "loader"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["rotationRef"]!.animation(forKey: "rotationRefLoaderAnim"), theLayer:layers["rotationRef"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["smile"]!.animation(forKey: "smileLoaderAnim"), theLayer:layers["smile"]!)
        }
    }

    func removeAnimations(forAnimationId identifier: String){
        if identifier == "loader"{
            layers["rotationRef"]?.removeAnimation(forKey: "rotationRefLoaderAnim")
            layers["smile"]?.removeAnimation(forKey: "smileLoaderAnim")
        }
    }

    func removeAllAnimations(){
        for layer in layers.values{
            layer.removeAllAnimations()
        }
    }

    //MARK: - Bezier Path

    func rotationRefPath() -> UIBezierPath{
        let rotationRefPath = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 89, height: 89))
        return rotationRefPath
    }

    func eye1Path() -> UIBezierPath{
        let eye1Path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 12, height: 12))
        return eye1Path
    }

    func eye2Path() -> UIBezierPath{
        let eye2Path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 12, height: 12))
        return eye2Path
    }

    func smilePath() -> UIBezierPath{
        let smilePath = UIBezierPath()
        smilePath.move(to: CGPoint(x: 53.774, y: 53.774))
        smilePath.addCurve(to: CGPoint(x: 53.774, y: 9.226), controlPoint1:CGPoint(x: 66.075, y: 41.472), controlPoint2:CGPoint(x: 66.075, y: 21.528))
        smilePath.addCurve(to: CGPoint(x: 9.226, y: 9.226), controlPoint1:CGPoint(x: 41.472, y: -3.075), controlPoint2:CGPoint(x: 21.528, y: -3.075))
        smilePath.addCurve(to: CGPoint(x: 9.226, y: 53.774), controlPoint1:CGPoint(x: -3.075, y: 21.528), controlPoint2:CGPoint(x: -3.075, y: 41.472))
        smilePath.addCurve(to: CGPoint(x: 53.774, y: 53.774), controlPoint1:CGPoint(x: 21.528, y: 66.075), controlPoint2:CGPoint(x: 41.472, y: 66.075))

        return smilePath
    }


}

