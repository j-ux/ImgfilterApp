//
//  ViewController.swift
//  FiltersApp
//
//  Created by Jeffrey Osa on 2020-05-29.
//  Copyright © 2020 Jeffrey Osa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImgView: UIImageView!
    
    
    @IBOutlet weak var BlurRadius: UISlider!
    
    
    var defaultImg: UIImage? = nil
    
    
    override func viewDidLoad() {
     super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultImg = ImgView.image
    }
    

    @IBAction func ApplyFilterBtn(_ sender: UIButton) {
        var rawImg = CIImage(image: ImgView.image!)
                      var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputIntensityKey:BlurRadius.value]
                      ApplyFilters(filterName: "CIBoxBlur", filterParams:filterParams)
    }
    
    @IBAction func SepiaToneBtn(_ sender: UIButton) {
        var rawImg = CIImage(image: ImgView.image!)
               var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputIntensityKey:BlurRadius.value]
               ApplyFilters(filterName: "CISepiaTone", filterParams:filterParams)
               
    }
    
    @IBAction func ComicEffectBtn(_ sender: UIButton) {
    
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg]
        
        ApplyFilters(filterName:"CIComicEffect", filterParams:filterParams)
        
    }
    
    @IBAction func ThermalBtn(_ sender: UIButton) {
    
    var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg]
        ApplyFilters(filterName:"CIThermal", filterParams:filterParams)
        
    }
    
    @IBAction func XrayBtn(_ sender: UIButton) {
    
    var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg]
        ApplyFilters(filterName:"CIXRay", filterParams:filterParams)
        
    }
    @IBAction func MotionBlurBtn(_ sender: UIButton) {
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputAngleKey:BlurRadius.value,kCIInputRadiusKey:BlurRadius.value]
        ApplyFilters(filterName:"CIMotionBlur", filterParams:filterParams)
        
    }
    
    @IBAction func ResetImg(_ sender: UIButton) {
        
        var rawImg = CIImage(image:defaultImg!)
        ImgView.image = UIImage(ciImage: rawImg!)
        
    }
    
    func ApplyFilters(filterName:String, filterParams:[String:Any]){
        var filter = CIFilter(name:filterName, parameters: filterParams)
        let context = CIContext(options:nil)
        
        if let output = filter?.outputImage{
            if var cgiResult = context.createCGImage(output, from: output.extent){
                ImgView.image = UIImage(cgImage: cgiResult)
            }
        }
    }
}

