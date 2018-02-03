//
//  FaceMask.swift
//  FaceMask
//
//  Created by Christopher Kriens on 2/3/18.
//  Copyright © 2018 Christopher Kriens. All rights reserved.
//

import UIKit
import Vision

class FaceMask {

    public enum FaceCropResult {
        case success(UIImage?)
        case notFound
        case failure(Error)
    }
    
    public func facemask(image: CGImage, radius: CGFloat, _ completion: @escaping (FaceCropResult) -> Void) {
        
        let request = VNDetectFaceRectanglesRequest { request, error in
            guard let observations = request.results as? [VNFaceObservation] else {
                return
            }

            let faceImages = observations.map { observation -> UIImage in
                let size = CGSize(width: observation.boundingBox.width * CGFloat(image.width), height: observation.boundingBox.height * CGFloat(image.height))
                let origin = CGPoint(x: observation.boundingBox.origin.x * CGFloat(image.width), y: (1 - observation.boundingBox.minY) * CGFloat(image.height) - size.height)

                let boundingBox = CGRect(origin: origin, size: size)

                let croppedCGImage: CGImage = (image.cropping(to: boundingBox))!
                return UIImage(cgImage: croppedCGImage)
            }

            completion(.success(faceImages.first))
        }

        do {
            try VNImageRequestHandler(cgImage: image, options: [:]).perform([request])
        } catch let error {
            completion(.failure(error))
        }
    }
}
