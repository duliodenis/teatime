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
    
    @IBAction func startTimer(_ sender: UIButton) {
        
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
            "Herbal"
        ]
    }
    
}


// MARK: - PickerView Delegate and Data Source Protocol Implementation

extension TeaTimeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
}
