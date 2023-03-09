//
//  RegisterView.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit


class RegisterView: UIView{
    
    var arrCites = [cities]()
    var arrCountries = [Countries]()
    var presenter: RegisterPresenter?
    
    lazy var codePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    lazy var countryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    lazy var cityPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayoutUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    lazy var containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var view_FullName: UIView = {
       var view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tf_fullName: UITextField = {
       var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Full Name".localize()
        textfield.borderStyle = .none
        return textfield
    }()

    lazy var view_Password: UIView = {
       var view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var tf_Password: UITextField = {
       var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Password".localize()
        textfield.borderStyle = .none
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    lazy var stackViewForMobile: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var view_Code: UIView = {
       var view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var tf_Code: UITextField = {
       var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Code".localize()
        textfield.borderStyle = .none
        textfield.inputView = codePicker
        return textfield
    }()
    lazy var img_dropDownCode: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dropdown")
        image.contentMode = .center
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var view_Mobile: UIView = {
       var view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var tf_Mobile: UITextField = {
       var textfield = UITextField()
        textfield.keyboardType = .numberPad
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Mobile".localize()
        textfield.borderStyle = .none
        textfield.addTarget(self, action: #selector(endEdit(_:)), for: UIControl.Event.editingDidEnd)
        return textfield
    }()
    
   
    
    
    lazy var view_Email: UIView = {
       var view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var tf_Email: UITextField = {
       var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Email".localize()
        textfield.borderStyle = .none
        textfield.keyboardType = .emailAddress
        textfield.addTarget(self, action: #selector(endEdit(_:)), for: UIControl.Event.editingDidEnd)
        return textfield
    }()
    
    @objc func endEdit(_ textField: UITextField){
        if textField == tf_Mobile {
            guard textField.text!.isValidMobile() else {
                presenter?.view!.showToast(message: "Enter Valid Mobile".localize())
                return
            }
            
        }else if textField == tf_Email{
                
            guard textField.text!.isValidMobile() else {
                presenter?.view!.showToast(message: "Enter Valid Email".localize())
                return
            }
        }
        
    }
        
    lazy var view_Country: UIView = {
       var view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var tf_Country: UITextField = {
       var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Country".localize()
        textfield.borderStyle = .none
        textfield.inputView = countryPicker
        return textfield
    }()
    lazy var img_dropDownCountry: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dropdown")
        image.contentMode = .center
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var view_City: UIView = {
       var view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var tf_City: UITextField = {
       var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "City".localize()
        textfield.borderStyle = .none
        textfield.inputView = cityPicker
        return textfield
    }()
    lazy var img_dropDownCity: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dropdown")
        image.contentMode = .center
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var stackViewForTerms: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var lbl_Clicking: UILabel = {
        var label = UILabel()
        label.text = "By clicking register you agree to".localize()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var btn_terms: UIButton =  {
       let button = UIButton()
        button.setTitle("Terms and Conditions".localize(), for: UIControl.State.normal)
        button.setTitleColor(.red, for: UIControl.State.normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(action_openTerms), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    @objc func action_openTerms(){
        presenter?.view!.openTermsPage()
    }
    
    
    lazy var btn_Language: UIButton =  {
       let button = UIButton()
        if SharedHandler.getCurrentLanguage() == "en"{
            button.setTitle("اللغة العربية", for: UIControl.State.normal)
        }else{
            button.setTitle("English", for: UIControl.State.normal)
        }
        button.backgroundColor = .loadingColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(changeLanguage), for: UIControl.Event.touchUpInside)
        return button
    }()
    @objc func changeLanguage(){
        if SharedHandler.getCurrentLanguage() == "en"{
            
            AppLanguage.shared.set(index: .arabic)
            UserDefaults.standard.set("ar", forKey: "currentLang")
            presenter?.view!.restartApplication()
        }else{
            
            AppLanguage.shared.set(index: .english)
            UserDefaults.standard.set("en", forKey: "currentLang")
            presenter?.view!.restartApplication()
        }
        
        
    }
    
}
