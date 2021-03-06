//
//  MoveToCategoryViewController.swift
//  What2Cook
//
//  Created by Hye Lim Joun on 5/10/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit

class MoveToCategoryViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
  var fridgeViewController: FridgeViewController?
  
  @IBOutlet weak var categoryTextField: UITextField!
  @IBOutlet weak var categoryDropDown: UIPickerView!
  
  @IBAction func onBack(_ sender: UIButton) {
    self.view.removeFromSuperview()
  }
  
  @IBAction func onDone(_ sender: UIButton) {
    let categoryName = categoryTextField.text
    fridgeViewController?.moveIngredients(ingredients: (fridgeViewController?.ingredients)!, categoryName: categoryName!)
    self.view.removeFromSuperview()
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    let rowCount = fridgeViewController?.sections.count
    return rowCount!
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    let rowTitle = fridgeViewController?.sections[row].category
    return rowTitle
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let chosenCategory = self.fridgeViewController?.sections[row].category
    self.categoryTextField.text = chosenCategory
    self.categoryDropDown.isHidden = true
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    self.categoryDropDown.isHidden = false
    dismissKeyboard()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
  }
}
