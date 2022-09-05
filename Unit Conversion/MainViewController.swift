
import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet var fromSegment: UISegmentedControl!
    
    @IBOutlet var toSegment: UISegmentedControl!
    
    @IBOutlet var numberTextFieldLabel: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var Calculate: UIButton!
    
    // segments are index based; index start from zero
    var fromSegmentIndexOne = String()
    var fromSegmentIndexTwo = String()
    
    var toSegmentIndexOne = String()
    var toSegmentIndexTwo = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fromSegment.setTitle(fromSegmentIndexOne, forSegmentAt: 0)
        fromSegment.setTitle(fromSegmentIndexTwo, forSegmentAt: 1)
        
        toSegment.setTitle(toSegmentIndexOne, forSegmentAt: 0)
        toSegment.setTitle(toSegmentIndexTwo, forSegmentAt: 1)
    }
    
    
    @IBAction func CalculateResult(_ sender: UIButton) {
        if numberTextFieldLabel.text == "" {
            resultLabel.text = "Enter Number"
        } else {
            if isDoubles(ArrayOfStrings: numberTextFieldLabel.text!) {
                let answer = performCalculation(From: fromSegment.titleForSegment(at: fromSegment.selectedSegmentIndex)!, To: toSegment.titleForSegment(at: toSegment.selectedSegmentIndex)!, TextField: Double(numberTextFieldLabel.text!)!)
                resultLabel.text = answer
            }
            else {
                resultLabel.text = "Enter valid number"
            }
        }
    }
    
    // keyboard show and hide
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

func isDoubles(ArrayOfStrings strs: String ...) -> Bool {
    var isDouble = true
    for str in strs {
        let DoubleCheck: Double? = Double(str)
        if DoubleCheck == nil {
            isDouble = false
        }
    }
    print(isDouble)
    return isDouble
}

func performCalculation(From from: String, To to: String, TextField number: Double) -> String {
    if from == to {
        return "selected same unit for conversion"
    }
    else if from == "Celsius" && to == "Fahrenheit" {
        let result = "\(round(number * (9/5)) + 32) \(to)"
        return result
    }
    else if from == "Fahrenheit" && to == "Celsius" {
        let result = "\(round(number - 32) * (5/9)) \(to)"
        return result
    }
    else if from == "Litre" && to == "MilliLitre" {
        let result = "\(round(number * 1000)) \(to)"
        return result
    }
    else if from == "MilliLitre" && to == "Litre" {
        let result = "\(round(number / 1000)) \(to)"
        return result
    }
    else if from == "Meter" && to == "Centimeter" {
        let result = "\(round(number * 100)) \(to)"
        return result
    }
    else if from == "Centimeter" && to == "Meter" {
        let result = "\(round(number / 100)) \(to)"
        return result
    }
    else{
        return "Wrong !"
    }
    
}
