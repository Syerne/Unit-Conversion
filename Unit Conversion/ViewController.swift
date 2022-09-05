//
//  ViewController.swift
//  Unit Conversion
//
//  Created by YE002 on 31/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var quantityTypeSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationScene: MainViewController = segue.destination as! MainViewController
        
        switch quantityTypeSegment.selectedSegmentIndex {
        case 0:
            destinationScene.fromSegmentIndexOne = "Celsius"
            destinationScene.fromSegmentIndexTwo = "Fahrenheit"
            destinationScene.toSegmentIndexOne = "Fahrenheit"
            destinationScene.toSegmentIndexTwo = "Celsius"
        case 1:
            destinationScene.fromSegmentIndexOne = "Litre"
            destinationScene.fromSegmentIndexTwo = "MilliLitre"
            destinationScene.toSegmentIndexOne = "MilliLitre"
            destinationScene.toSegmentIndexTwo = "Litre"
        case 2:
            destinationScene.fromSegmentIndexOne = "Meter"
            destinationScene.fromSegmentIndexTwo = "Centimeter"
            destinationScene.toSegmentIndexOne = "Centimeter"
            destinationScene.toSegmentIndexTwo = "Meter"
        default:
            break
        }
    }
}

