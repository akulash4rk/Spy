//
//  CountOfSpyView.swift
//  Spy
//
//  Created by Владислав Баранов on 25.03.2024.
//

import Foundation
import UIKit

class CountOfSpyView : ForPickCountOfPlayersAndImpostersClass {
    override func viewDidLoad() {
        super.viewDidLoad()
        let nextButton = createNextButton()
        let nameOfGame = createLabelSpy()
        let enterCountView = createLabelEnterCount(nameOfGameLabel: nameOfGame, textOnTheLabel: "Введите количество шпионов")
        let pickerPlayerCount = createPickerView(upperView: enterCountView, lowerButton: nextButton)
        pickerData = arrayOfSpy
        currentPlayer = 1
    }
    
    override func nextView() {
        let gameView = WaitForNewRole()
        selectWords()
        print("Пикаем новое слово")
        navigationController?.pushViewController(gameView, animated: true)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countOfSpy = pickerData[row]
        print("countOfPlayers ", countOfPlayers)
        print("countOfSpy ", countOfSpy)
    }
}
