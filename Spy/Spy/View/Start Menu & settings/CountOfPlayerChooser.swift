//
//  CountOfPlayerChooser.swift
//  Spy
//
//  Created by Владислав Баранов on 24.03.2024.

import Foundation
import UIKit



class CountOfPlayerChooserView : ForPickCountOfPlayersAndImpostersClass {
    override func nextView() {
        let countOfSpyView = CountOfSpyView()
        pickerData = arrayOfPlayersLocal
        print(countOfSpy)
        print(countOfPlayers)
        navigationController?.pushViewController(countOfSpyView, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nextButton = createNextButton()
        let nameOfGame = createLabelSpy()
        let enterCountView = createLabelEnterCount(nameOfGameLabel: nameOfGame, textOnTheLabel: "Введите количество игроков")
        let pickerPlayerCount = createPickerView(upperView: enterCountView, lowerButton: nextButton)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countOfPlayers = row+3
        print("countOfPlayers ", countOfPlayers)
    }
}
