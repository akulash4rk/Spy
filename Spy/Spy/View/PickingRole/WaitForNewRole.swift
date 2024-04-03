//
//  WaitForNewRole.swift
//  Spy
//
//  Created by Владислав Баранов on 23.03.2024.
//

import Foundation
import UIKit


class WaitForNewRole : UIViewController{
    
    var numberOfPlayerLabel = UIView()
    var showMyRoleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.purpleMain.color
        showMyRoleButton = createShowMyRoleButton(textOnTheLabel: "Показать роль")
        numberOfPlayerLabel =  createLabelEnterCount(textOnTheLabel: "Игрок № \(currentPlayer)")
    }
    
    func createShowMyRoleButton(textOnTheLabel : String) -> UIButton{
        var myRoleShowButton = UIButton()
        view.addSubview(myRoleShowButton)
        myRoleShowButton = configureButton(currentButton: myRoleShowButton, textOnTheButton: textOnTheLabel)
        
        myRoleShowButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myRoleShowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64    ),
            myRoleShowButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            myRoleShowButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            myRoleShowButton.heightAnchor.constraint(equalToConstant: view.bounds.height/4 - 128)
        ])
        
        myRoleShowButton.addTarget(self, action: #selector(showRole), for: .touchUpInside)
        
        
        return myRoleShowButton
    }
    
    func createLabelEnterCount(textOnTheLabel: String) -> UIView{
        let viewForLabelCount = UIView()
        let enterCount = UILabel()
        view.addSubview(viewForLabelCount)
        
        
        viewForLabelCount.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForLabelCount.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
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
    
    @objc func showRole(){
        let showRoleView = ShowRoleAndWord()
        present(showRoleView, animated: true)
        
        showMyRoleButton.removeFromSuperview()
        
        if currentPlayer<countOfPlayers{
        showMyRoleButton = createShowMyRoleButton(textOnTheLabel: "Далее")
        showMyRoleButton.removeTarget(self, action: #selector(showRole), for: .touchUpInside)
        showMyRoleButton.addTarget(self, action: #selector(nextRole), for: .touchUpInside)}
        else
        {
            showMyRoleButton = createShowMyRoleButton(textOnTheLabel: "Начать игру")
            showMyRoleButton.removeTarget(self, action: #selector(showRole), for: .touchUpInside)
            showMyRoleButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        }
        
        
        
    }
    
    @objc func nextRole(){
        showMyRoleButton.removeFromSuperview()
        showMyRoleButton.removeTarget(self, action: #selector(nextRole), for: .touchUpInside)
            showMyRoleButton = createShowMyRoleButton(textOnTheLabel: "Показать роль")
            showMyRoleButton.addTarget(self, action: #selector(showRole), for: .touchUpInside)
            currentPlayer += 1
            numberOfPlayerLabel.removeFromSuperview()
            numberOfPlayerLabel = createLabelEnterCount(textOnTheLabel: "Игрок № \(currentPlayer)")
    }
    
    
    @objc func startGame(){
        let gameView = GameMainClass()
        navigationController?.pushViewController(gameView, animated: true)
        
    }
}
