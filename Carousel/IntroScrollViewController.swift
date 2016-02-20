//
//  IntroScrollViewController.swift
//  Carousel
//
//  Created by Frank Yoo on 2/12/16.
//  Copyright © 2016 Frank Yoo. All rights reserved.
//

import UIKit

class IntroScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
//    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
//    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
//    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
//    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        let ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        introScrollView.contentSize = CGSize(width: 320, height: 1136)
        introScrollView.delegate = self
        
//        introScrollView.sendSubviewToBack(imageView)
        
//        var farenheight = convertValue(25, r1Min: 0, r1Max: 100, r2Min: 32, r2Max: 212)
//        var celsius = convertValue(212, r1Min: 32, r1Max: 212, r2Min: 0, r2Max: 100)
//        print("F \(farenheight)")
//        print("C \(celsius)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = Float(scrollView.contentOffset.y)
        
//        content offset: 0->568
//        x offset: -30->0
//        y offset: -285->0
        
        let tx1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -65, r2Max: 0)
        let ty1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        let scale1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        let rotation1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx1), CGFloat(ty1))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale1), CGFloat(scale1))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation1) * M_PI / 180))
        
        
        let tx2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 40, r2Max: 0)
        let ty2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -280, r2Max: 0)
        let scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(tx2), CGFloat(ty2))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(scale2), CGFloat(scale2))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(rotation2) * M_PI / 180))
        
        let tx3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        let ty3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -415, r2Max: 0)
        let scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        let rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(tx3), CGFloat(ty3))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(scale3), CGFloat(scale3))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(rotation3) * M_PI / 180))
        
        let tx4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 85, r2Max: 0)
        let ty4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        let scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        let rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(scale4), CGFloat(scale4))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(rotation4) * M_PI / 180))
        
        let tx5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -115, r2Max: 0)
        let ty5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        let scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(scale5), CGFloat(scale5))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(rotation5) * M_PI / 180))
        
        let tx6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -100, r2Max: 0)
        let ty6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -480, r2Max: 0)
        let scale6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(scale6), CGFloat(scale6))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(rotation6) * M_PI / 180))

        
//        print("content offset: \(scrollView.contentOffset.y)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
