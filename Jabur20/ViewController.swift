//
//  ViewController.swift
//  Jabur20
//
//  Created by Franz Blauth on 02/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    var datePicker: UIDatePicker!
    var textView: UITextView!
    var datePickerConstraints = [NSLayoutConstraint]()
    var blurEffectView: UIView!
    var finalDatePicker = Date()
    var stringDate: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
    }
    
    func showDatePicker() {
        datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.locale = Locale.init(identifier: "pt-br")
        datePicker.timeZone = TimeZone(abbreviation: "UTC")
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.tintColor =  UIColor(named: "color_54007D")
        datePicker.addTarget(self, action: #selector(dateSet), for: .valueChanged)
        showFinalDate()
    }
    
    func showFinalDate(){
        textView = UITextView(frame: CGRect(x: 16.0, y: 120.0, width: 150.0, height: 30.0))
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.textAlignment = NSTextAlignment.justified
        textView.textColor = UIColor(named: "color_33163D")
        textView.textAlignment = .center
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.font = .systemFont(ofSize: 16)
        addDatePickerToSubview()
    }
    
    func addDatePickerToSubview() {
        guard let datePicker = datePicker else { return }
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurEffectView)
        self.view.addSubview(datePicker)
        self.view.addSubview(textView)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        centerDatePicker()
        view.bringSubviewToFront(datePicker)
    }
    
    func centerDatePicker() {
        guard let datePicker = datePicker else { return }
        datePickerConstraints.append(datePicker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor))
        datePickerConstraints.append(datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        NSLayoutConstraint.activate(datePickerConstraints)
    }
    
    @objc func dateSet() {
        finalDatePicker = datePicker.date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd-MM-yyyy"
        stringDate = dateFormat.string(from: finalDatePicker)
        blurEffectView.removeFromSuperview()
        datePicker.removeFromSuperview()

        // finalDatePicker ==> Date Format
        // stringDate ==> Date String Format
          textView.text = stringDate //
    }

}

