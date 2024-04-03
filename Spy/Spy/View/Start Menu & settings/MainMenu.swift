//
//  MainMenu.swift
//  Spy
//
//  Created by Владислав Баранов on 23.03.2024.
//

import Foundation
import UIKit


class MainMenuViewController : UIViewController{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.purpleMain.color
        createArrayOfThemes()
        let settingsButton = createSettingsButton()
        let startButton = createStartButton(settingsButton: settingsButton)
        let labelSpy = createLabelSpy(startButton: startButton)
        createImageSpy(title: labelSpy)
    }

    
    
    //MARK: - Creating buttons
    func createStartButton(settingsButton : UIButton) -> UIButton{
        var startButton = UIButton()
        view.addSubview(startButton)
        startButton = configureButton(currentButton: startButton, textOnTheButton: "Начать игру")
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: settingsButton.topAnchor, constant: -16),
            startButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            startButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            startButton.heightAnchor.constraint(equalToConstant: view.bounds.height/4 - 128)
        ])
        
        startButton.addTarget(self, action: #selector(startGameButtonPressed), for: .touchUpInside)
        
        return startButton
    }
    
    
    func createSettingsButton() -> UIButton{
        var settingsButton = UIButton()
        view.addSubview(settingsButton)
        settingsButton = configureButton(currentButton: settingsButton, textOnTheButton: "Настройка")
        
        
        
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64    ),
            settingsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            settingsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            settingsButton.heightAnchor.constraint(equalToConstant: view.bounds.height/4 - 128)
        ])
        
        settingsButton.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
        
        return settingsButton
    }

    
    
    //MARK: - Main label
    
    func createLabelSpy(startButton : UIButton) -> UILabel{
        
        
        let spyLabel = createLabelSpyMain(currentView: view)
        
        
        spyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spyLabel.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -16),
            spyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        return spyLabel
    }
    
    
    //MARK: - Image
    
    func createImageSpy(title: UILabel) -> UIImageView{
        let imageSpy = UIImageView()
        view.addSubview(imageSpy)
        imageSpy.image = UIImage(named: "Spy-semiVinious")
        
        imageSpy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageSpy.widthAnchor.constraint(equalToConstant:  view.bounds.width-32),
            imageSpy.heightAnchor.constraint(equalToConstant:  view.bounds.width-32),
            imageSpy.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -16),
            imageSpy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        imageSpy.layer.cornerRadius = 5
        //imageSpy.layer.clipsToBounds = true
        
        return imageSpy
        
    }
    
    
    //MARK: - Button Pressed
    
    @objc func startGameButtonPressed(){
        let viewForChoose = CountOfPlayerChooserView()
       // view.window?.rootViewController = viewForChoose
        navigationController?.pushViewController(viewForChoose, animated: true)
    }
    
    @objc func settingsButtonPressed(){
        let settingsView = SettingsViewController()
        navigationController?.pushViewController(settingsView, animated: true)
    }
}

