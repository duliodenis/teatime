//
//  TeaTimeViewController.swift
//  Tea Time
//
//  Created by Dulio Denis on 11/25/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class TeaTimeViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var teaPickerView: UIPickerView!
    
    var pickerData:[String] = [String]()
    var teaSteepTimeUI:[String] = [String]()
    var teaSteepTime:[Int] = [Int]()
    var steepTime:Int = 0
    var timer:Timer = Timer()
    
    @IBAction func startTimer(_ sender: UIButton) {
        startStopTimer()
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teaPickerView.delegate = self
        teaPickerView.dataSource = self
        setupPickerData()
    }
    
    
    func setupPickerData() {
        // http://www.artoftea.com/what-is-tea/recommended-steep-times/
        pickerData = [
            "White Tea",
            "Chinese Green",
            "Japanese Green",
            "Black",
            "Darjeeling",
            "Oolong",
            "Herbal",
            "Mate"
        ]
        
        // Arrays for UI Label and Timer number of seconds
        teaSteepTimeUI = ["3:00", "3:00", "3:00", "5:00", "3:00", "5:00", "7:00", "4:00"]
        teaSteepTime   = [180,    180,    180,    300,    180,    300,    420,    240]
    }
    
    
    func startStopTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decrementSteepTime), userInfo: nil, repeats: true)
    }
    
    
    func decrementSteepTime() {
        steepTime -= 1
        timerLabel.text = displaySteepTime(time: steepTime)
    }
    
    func displaySteepTime(time:Int) -> String {
        let minutes = (time / 60) % 60
        let seconds = time % 60
        
        if seconds < 10 {                   // formatting:
            return "\(minutes):0\(seconds)" // leading zero for single digit seconds
        }
        return "\(minutes):\(seconds)"      // else just use two digits
    }
    
}


// MARK: - PickerView Delegate and Data Source Protocol Implementation

extension TeaTimeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Data Source Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        timerLabel.text = teaSteepTimeUI[row]
        steepTime = teaSteepTime[row]
    }
    
}
