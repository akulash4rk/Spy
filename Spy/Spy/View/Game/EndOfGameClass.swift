

import Foundation
import UIKit


class EndOfGameClass : UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.purpleMain.color
        
        let menuButton = createMenuButton()
        let restartButton = createRetartButton(menuButton: menuButton)
        let labelOfWinner = createLabelOfWinner(restartButton: restartButton)
        createImageOfWinner(title: labelOfWinner)
    }
    
    
    
    //MARK: - Creating buttons
    func createRetartButton(menuButton : UIButton) -> UIButton{
        var restartButton = UIButton()
        view.addSubview(restartButton)
        restartButton = configureButton(currentButton: restartButton, textOnTheButton: "Еще раз")
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            restartButton.bottomAnchor.constraint(equalTo: menuButton.topAnchor, constant: -16),
            restartButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            restartButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            restartButton.heightAnchor.constraint(equalToConstant: view.bounds.height/4 - 128)
        ])
        
        restartButton.addTarget(self, action: #selector(restartGameButtonPressed), for: .touchUpInside)
        
        return restartButton
    }
    
    
    func createMenuButton() -> UIButton{
        var menuButton = UIButton()
        view.addSubview(menuButton)
        menuButton = configureButton(currentButton: menuButton, textOnTheButton: "Меню")
        
        
        
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64    ),
            menuButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            menuButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            menuButton.heightAnchor.constraint(equalToConstant: view.bounds.height/4 - 128)
        ])
        
        menuButton.addTarget(self, action: #selector(menuButtonPressed), for: .touchUpInside)
        
        return menuButton
    }
    
    
    
    //MARK: - Main label
    
    func createLabelOfWinner(restartButton : UIButton) -> UILabel{
        
        
        let spyLabel = UILabel()
        view.addSubview(spyLabel)
        var spyLabelText = ""
        
        print(whoWin)
        if whoWin == "Spy" {
            spyLabelText = "Шпионы победили!"
            print("1")
        } else {
            spyLabelText = "Мирные победили!"
            print("2")
        }
        
        spyLabel.attributedText = NSAttributedString(
            string: spyLabelText,
            attributes: [
                NSAttributedString.Key.foregroundColor:  Colors.closeToRed.color,
                NSAttributedString.Key.font: TextAttributes.subtitle.font,
                NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
            ])
        
        spyLabel.textAlignment = .center
        spyLabel.numberOfLines = 2
        spyLabel.lineBreakMode = .byWordWrapping
        
        
        
        spyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spyLabel.bottomAnchor.constraint(equalTo: restartButton.topAnchor, constant: -16),
            spyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spyLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            spyLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
        
        return spyLabel
    }
    
    
    //MARK: - Image
    
    func createImageOfWinner(title: UILabel) -> UIImageView{
        let imageSpy = UIImageView()
        view.addSubview(imageSpy)
        if whoWin == "Spy" {
            imageSpy.image = UIImage(named: "Spy-semiVinious")
        } else {
            imageSpy.image = UIImage(named: "Player")
        }
        
        imageSpy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageSpy.widthAnchor.constraint(equalToConstant:  view.bounds.width-32),
            imageSpy.heightAnchor.constraint(equalToConstant:  view.bounds.width-32),
            imageSpy.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -16),
            imageSpy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        imageSpy.layer.cornerRadius = 5
        
        return imageSpy
        
    }
    
    
    //MARK: - Button Pressed
    
    @objc func restartGameButtonPressed(){
        let viewForChoose = WaitForNewRole()
        let mainMenu = MainMenuViewController()
        restartGame()
        selectWords()
        navigationController?.setViewControllers([mainMenu, viewForChoose], animated: true)
        
        
    }
    
    @objc func menuButtonPressed(){
        let mainMenu = MainMenuViewController()
        navigationController?.setViewControllers([mainMenu], animated: true)
    }
}

