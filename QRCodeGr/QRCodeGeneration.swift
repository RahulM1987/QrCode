//
//  QRCodeGeneration.swift
//  QRCodeGr
//
//  Created by Rahul Morade on 24/10/18.
//  Copyright © 2018 Rahul Morade. All rights reserved.
//

import UIKit
import CoreImage

class QRCodeGeneration: NSObject {
    
    override init() {
        super.init()
    }
    
    func generateQRCode(isString: String, scale: CGFloat) -> UIImage {
        let stringData = isString.data(using: String.Encoding.utf8)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(stringData, forKey: "inputMessage")
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        let sdsendImage = filter?.outputImage
        let transf = sdsendImage?.transformed(by: CGAffineTransform(scaleX: scale, y: scale))
        let image = UIImage(ciImage: transf!, scale: scale, orientation: UIImageOrientation.down)
        return image
    }
    
    func detectQRCode(_ image: UIImage?) -> [CIFeature]? {
        if let image = image, let ciImage = CIImage.init(image: image){
            var options: [String: Any]
            let context = CIContext()
            options = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
            let qrDetector = CIDetector(ofType: CIDetectorTypeQRCode, context: context, options: options)
            if ciImage.properties.keys.contains((kCGImagePropertyOrientation as String)){
                options = [CIDetectorImageOrientation: ciImage.properties[(kCGImagePropertyOrientation as String)] ?? 1]
            }else {
                options = [CIDetectorImageOrientation: 1]
            }
            let features = qrDetector?.features(in: ciImage, options: options)
            return features
        }
        return nil
    }
}
