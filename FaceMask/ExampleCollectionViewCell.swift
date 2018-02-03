//
//  ExampleCollectionViewCell.swift
//  FaceMask
//
//  Created by Christopher Kriens on 2/3/18.
//  Copyright © 2018 Christopher Kriens. All rights reserved.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        updateImage(image: nil)
    }
    
    func updateImage(image: UIImage?) {
        if image != nil { imageView.image = image }
        let maskTest = FaceMask()
        
        maskTest.facemask(image: imageView.image!.cgImage!, radius: 200) { result in
            switch result {
            case .success(let face):
                self.imageView.image = face
            case .notFound:
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
