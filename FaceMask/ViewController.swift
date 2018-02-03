//
//  ViewController.swift
//  FaceMask
//
//  Created by Christopher Kriens on 1/30/18.
//  Copyright © 2018 Christopher Kriens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var faceImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let maskTest = FaceMask()
        maskTest.facemask(image: faceImageView.image!.cgImage!, radius: 200) { result in
            switch result {
            case .success(let face):
                self.faceImageView.image = face
            case .notFound:
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

