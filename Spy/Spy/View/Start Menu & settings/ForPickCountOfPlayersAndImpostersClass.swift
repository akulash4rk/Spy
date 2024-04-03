//
//  CountOfPlayerChooser.swift
//  Spy
//
//  Created by Владислав Баранов on 24.03.2024.

import UIKit



class ForPickCountOfPlayersAndImpostersClass : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.purpleMain.color

    }
    
    //MARK: - Create Labels
    
    func createLabelSpy() -> UILabel{
        let spyLabel = createLabelSpyMain(currentView: view)
        
        spyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            spyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return spyLabel
    }
    
    func createLabelEnterCount(nameOfGameLabel: UILabel, textOnTheLabel: String) -> UIView{
        let viewForLabelCount = UIView()
        let enterCount = UILabel()
        view.addSubview(viewForLabelCount)
        
        
        viewForLabelCount.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForLabelCount.topAnchor.constraint(equalTo: nameOfGameLabel.bottomAnchor, constant: 16),
            viewForLabelCount.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            viewForLabelCount.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
        
        viewForLabelCount.backgroundColor = Colors.semiVinous.color
        
        viewForLabelCount.addSubview(enterCount)
        
        viewForLabelCount.layer.cornerRadius = 10
        viewForLabelCount.clipsToBounds = true
        
        
        enterCount.attributedText = NSAttributedString(
            string: textOnTheLabel,
            attributes: [
                NSAttributedString.Key.foregroundColor: ThemeColors.shared.color(for: "alwaysBlack"),
                NSAttributedString.Key.font: TextAttributes.subtitle.font,
                NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
            ])
        enterCount.textAlignment = .center
        enterCount.lineBreakMode = .byWordWrapping
        enterCount.numberOfLines = 3
        enterCount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterCount.leftAnchor.constraint(equalTo: viewForLabelCount.leftAnchor, constant: 16),
            enterCount.rightAnchor.constraint(equalTo: viewForLabelCount.rightAnchor, constant: -16),
            enterCount.centerYAnchor.constraint(equalTo: viewForLabelCount.centerYAnchor, constant: 3),
        ])
        
        viewForLabelCount.heightAnchor.constraint(equalTo: enterCount.heightAnchor, constant: 20).isActive = true
        
        return viewForLabelCount
    }
    
    //MARK: - Button
    
    func createNextButton() -> UIButton{
        var nextButton = UIButton()
        view.addSubview(nextButton)
        
        nextButton = configureButton(currentButton: nextButton, textOnTheButton: "Далее")
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64    ),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nextButton.heightAnchor.constraint(equalToConstant: view.bounds.height/4 - 128)
        ])
        nextButton.addTarget(self, action: #selector(createNewView), for: .touchUpInside)
        return nextButton
    }
    
    @objc func createNewView(){
        nextView()
    }
    
    //костыль!
    func nextView(){
    }
    
    //MARK: - Picker
    var arrayOfPlayersLocal = Array(3...12)
    var arrayOfSpy = Array(1...findMaxSpy())
    var pickerData : [Int] = Array(3...12)
    
    func createPickerView(upperView: UIView, lowerButton: UIButton) -> UIPickerView{
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
        
        pickerView.tintColor = Colors.closeToRed.color
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 16),
            pickerView.bottomAnchor.constraint(equalTo: lowerButton.topAnchor, constant: 16),
            pickerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            pickerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
        return pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let labelInRow = UILabel()
        labelInRow.attributedText = NSAttributedString(
            string: String(pickerData[row]),
            attributes: [
                NSAttributedString.Key.foregroundColor: ThemeColors.shared.color(for: "alwaysBlack"),
                NSAttributedString.Key.font: TextAttributes.subtitle.font,
                NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
            ])
        labelInRow.textAlignment = .center
        labelInRow.textColor = Colors.closeToRed.color
        labelInRow.shadowColor = ThemeColors.shared.color(for: "alwaysBlack")
        labelInRow.shadowOffset = CGSize(width: 5, height: 5)
        return labelInRow
    }

    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 75
    }
    

}
