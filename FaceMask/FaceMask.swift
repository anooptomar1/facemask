//
//  FaceMask.swift
//  FaceMask
//
//  Created by Christopher Kriens on 2/3/18.
//  Copyright © 2018 Christopher Kriens. All rights reserved.
//

import UIKit
import Vision

public enum FaceMaskResult {
    case success(UIImage?)
    case notFound
    case failure(Error)
}

class FaceMask {

    var allowsUpscaling: Bool = false
    var preferredMargin: CGFloat = 0.0
    
    public func facemask(image: CGImage, radius: CGFloat, _ completion: @escaping (FaceMaskResult) -> Void) {
        
        let request = VNDetectFaceRectanglesRequest {  [weak self] request, error in
            guard let observations = request.results as? [VNFaceObservation] else {
                completion(.notFound)
                return
            }

            let faceImages = observations.map { observation -> UIImage in
                var size = CGSize(width: observation.boundingBox.width * CGFloat(image.width), height: observation.boundingBox.height * CGFloat(image.height))
                var origin = CGPoint(x: observation.boundingBox.origin.x * CGFloat(image.width), y: (1 - observation.boundingBox.minY) * CGFloat(image.height) - size.height)

                // We can't add more margin than the image has data
                let maximumMarginForImage = min(origin.x, origin.y) < self!.preferredMargin ? min(origin.x, origin.y) : self?.preferredMargin
                
                size.width += maximumMarginForImage ?? 0
                size.height += maximumMarginForImage ?? 0
                origin.x -= maximumMarginForImage ?? 0
                origin.y -= maximumMarginForImage ?? 0

                let boundingBox = CGRect(origin: origin, size: size)
                print(boundingBox)
                let croppedCGImage: CGImage = image.cropping(to: boundingBox)!
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
