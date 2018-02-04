//
//  ExampleCollectionViewController.swift
//  FaceMask
//
//  Created by Christopher Kriens on 2/3/18.
//  Copyright © 2018 Christopher Kriens. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ExampleCollectionViewController: UICollectionViewController {

    var exampleData: [String] = ["mila-kunis-face-wallpaper-51808-53513-hd-wallpapers",
                                 "celeb_wallpaper_004",
                                 "_thumb_d32ca8a1-338a-498c-9d2c-e607d8acd634",
                                 "actor-christian-bale-long-hairs-smile-beard-face-eyes-normal",
                                 "josh_hartnett_actor_male_young_dark_brooding_mole_18757_1400x1050",
                                 "68549144-female-wallpapers",
                                 "best-halloween-costumes-inspired-by-characters-natalie-portman-leon-the-professional",
                                 "881604180",
                                 "GettyImages-672811306",
                                 "3783427",
                                 "nintchdbpict000189244267",
                                 "nicolascage-faceoff-crazy",
                                 "tdih-march14-HD",
                                 "Face-Surgery-Head-4",
                                 "Gifts-Barack-Obama-Fans"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        collectionView!.register(UINib(nibName: "ExampleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "exampleCollectionViewCell")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return exampleData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exampleCollectionViewCell", for: indexPath) as? ExampleCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.updateImage(image: UIImage(named: exampleData[indexPath.row]))

        cell.imageView.layer.cornerRadius = cell.frame.width/2
        cell.imageView.clipsToBounds = true
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
