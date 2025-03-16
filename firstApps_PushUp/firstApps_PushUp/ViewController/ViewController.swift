//
//  ViewController.swift
//  firstApps_PushUp
//
//  Created by foxset on 13.03.2025.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    private let buttonInfo = UIButton(frame: CGRect(x: 100, y: 650, width: 200, height: 70))
    
    private let pickerView = UIPickerView()
    private let timeMinutes = ["10 мин", "30 мин", "40 мин", "50 мин", "60 мин"]
    private let timeSeconds = ["10 сек", "20 сек", "30 сек", "40 сек", "50 сек", "60 сек"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupPickerView()
        setupButtonInfo()
    }
    
    private func setupButtonInfo() {
        buttonInfo.setTitle("Начать Тренировку", for: .normal)
        buttonInfo.backgroundColor = .blue
        buttonInfo.addTarget(self, action: #selector(buttonInfoAction), for: .touchUpInside)
        buttonInfo.layer.cornerRadius = 25
        view.addSubview(buttonInfo)
    }
    
    private func setupPickerView() {
        view.backgroundColor = .systemBackground
        
        pickerView.backgroundColor = .systemGray6
        pickerView.layer.cornerRadius = 40
        pickerView.clipsToBounds = true
        
        let pickerSize = CGSize(width: view.frame.width * 0.8, height: 200)
        pickerView.frame = CGRect(
            x: (view.frame.width - pickerSize.width) / 2,
            y: (view.frame.height - pickerSize.height) / 2,
            width: pickerSize.width,
            height: pickerSize.height
        )
        
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
    }
    
    @objc private func buttonInfoAction() {
        print("Начать Тренировку")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? timeMinutes.count : timeSeconds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let text = component == 0 ? timeMinutes[row] : timeSeconds[row]
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.systemFont(ofSize: 40, weight: .black)
        ]
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UIView.animate(withDuration: 0.2) {
            pickerView.alpha = 0.7
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                pickerView.alpha = 1.0
            }
        }
        
        let minutes = timeMinutes[pickerView.selectedRow(inComponent: 0)]
        let seconds = timeSeconds[pickerView.selectedRow(inComponent: 1)]
        print("Выбрано время: \(minutes) и \(seconds)")
    }
}

#Preview {
    let previewIphone11 = ViewController()
    previewIphone11.view.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
    return previewIphone11
}

/*
 let viewController = ViewController()
  // астраиваем размер для превью
 viewController.view.frame = CGRect(x: 0, y: 0, width: 414, height: 896) // Размер iPhone 14
 return viewController
 */
