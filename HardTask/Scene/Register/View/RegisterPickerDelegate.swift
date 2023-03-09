//
//  RegisterPickerDelegate.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit

extension RegisterView: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func loadCountries(array: [Countries]){
        self.arrCountries = array
        self.codePicker.reloadAllComponents()
        self.countryPicker.reloadAllComponents()
    }
    
    func loadCities(array: [cities]){
        self.arrCites = array
        self.cityPicker.reloadAllComponents()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == codePicker || pickerView == countryPicker{
            return arrCountries.count
        }else{
            return arrCites.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if arrCountries.count > 0  {
            if pickerView == codePicker{
                return "+\(arrCountries[row].code)"
            }else if pickerView == countryPicker{
                return arrCountries[row].name
            }else if arrCites.count > 0{
                return arrCites[row].text
            }else {
                return ""
            }
        }else{
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if arrCountries.count > 0  {
            if pickerView == codePicker{
                tf_Code.text = "+\(arrCountries[row].code)"
            }else if pickerView == countryPicker{
                tf_Country.text = "\(arrCountries[row].name)"
                tf_City.text = ""
                presenter?.getCities(countryID: arrCountries[row].countryId)
            }else if arrCites.count > 0{
                tf_City.text = "\(arrCites[row].text)"
            }else {
                return
            }
        }else{}
    }
}
