//
//  GameView.swift
//  Spy
//
//  Created by Владислав Баранов on 23.03.2024.
//

import UIKit


class ShowRoleAndWord : UIViewController {
    
    override func viewDidLoad(){
        
        self.view.backgroundColor = Colors.closeToRed.color
        let labelRole = createLabelRoleConstant()
        let imageOfRole = createMyRoleImage(upperView: labelRole)
        let nameOfRole = createMyRoleLabel(upperImage: imageOfRole)
        let myWordLabel = showWordLabel(upperLabel: nameOfRole)
        print(arrayOfPlayers)
    }
    
    func createLabelRoleConstant() -> UIView{
        
        var roleLabel = UILabel()
        var viewForRoleLabel = UIView()
        view.addSubview(viewForRoleLabel)
        
        
        viewForRoleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForRoleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            viewForRoleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            viewForRoleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
        
        viewForRoleLabel.backgroundColor = Colors.semiVinous.color
        
        viewForRoleLabel.addSubview(roleLabel)
        
        viewForRoleLabel.layer.cornerRadius = 10
        viewForRoleLabel.clipsToBounds = true
        
        
        roleLabel.attributedText = NSAttributedString(
            string: "Ваша роль",
            attributes: [
                NSAttributedString.Key.foregroundColor: ThemeColors.shared.color(for: "alwaysBlack"),
                NSAttributedString.Key.font: TextAttributes.subtitle.font,
                NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
            ])
        roleLabel.textAlignment = .center
        roleLabel.lineBreakMode = .byWordWrapping
        roleLabel.numberOfLines = 3
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roleLabel.leftAnchor.constraint(equalTo: viewForRoleLabel.leftAnchor, constant: 16),
            roleLabel.rightAnchor.constraint(equalTo: viewForRoleLabel.rightAnchor, constant: -16),
            roleLabel.centerYAnchor.constraint(equalTo: viewForRoleLabel.centerYAnchor, constant: 3),
        ])
        
        viewForRoleLabel.heightAnchor.constraint(equalTo: roleLabel.heightAnchor, constant: 20).isActive = true
    
        
        return viewForRoleLabel
    }
    
    
    
    func createMyRoleImage(upperView : UIView) -> UIImageView{
        
        var imageOfRole = UIImageView()
        view.addSubview(imageOfRole)
        

             imageOfRole.image = UIImage(named: "Player")
        if (arrayOfPlayers[currentPlayer] == true)  && (willRoleShowToSpy == true)  { // если игрок шпион
            imageOfRole.image = UIImage(named: "Spy")
        }
        
        imageOfRole.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageOfRole.widthAnchor.constraint(equalToConstant:  view.bounds.width-32),
            imageOfRole.heightAnchor.constraint(equalToConstant:  view.bounds.width-32),
            imageOfRole.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 16),
            imageOfRole.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        return imageOfRole
    }
    
    
    
    func createMyRoleLabel(upperImage: UIImageView) -> UILabel{
        var myRoleLabel = UILabel()
        view.addSubview(myRoleLabel)
        
        myRoleLabel.attributedText = NSAttributedString(
                string: "Мирный",
                attributes: [
                    NSAttributedString.Key.foregroundColor: Colors.semiVinous.color,
                    NSAttributedString.Key.font: TextAttributes.title.font,
                ])
            
        if (arrayOfPlayers[currentPlayer] == true) && (willRoleShowToSpy == true) { // если игрок шпион
            myRoleLabel.attributedText = NSAttributedString(
                string: "Шпион",
                attributes: [
                    NSAttributedString.Key.foregroundColor: Colors.semiVinous.color,
                    NSAttributedString.Key.font: TextAttributes.title.font,
                ])
        }
        
        
        myRoleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myRoleLabel.topAnchor.constraint(equalTo: upperImage.bottomAnchor, constant: 16),
            myRoleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        myRoleLabel.shadowColor = ThemeColors.shared.color(for: "alwaysBlack")
        myRoleLabel.shadowOffset = CGSize(width: 5, height: 5)
        
        return myRoleLabel
    }
    
    func showWordLabel(upperLabel: UILabel){
        var myWordLabel = UILabel()
        myWordLabel.numberOfLines = 3
        myWordLabel.textAlignment = .center
        var stringForLabel : String = ""
        view.addSubview(myWordLabel)
            stringForLabel = randomPlayingElement.wordForInocent
        if (arrayOfPlayers[currentPlayer] == true) { //if player is a spy
            stringForLabel = randomPlayingElement.wordForImposter
        }
        if (arrayOfPlayers[currentPlayer] == true) && (willWordShowToSpy == false) { //if player is a spy
            stringForLabel = "Попробуй не спалиться"
        }
        
        
        myWordLabel.attributedText = NSAttributedString(
            string: stringForLabel,
            attributes: [
                NSAttributedString.Key.foregroundColor: Colors.semiVinous.color,
                NSAttributedString.Key.font: TextAttributes.subtitle.font,
            ])
    
        myWordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myWordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myWordLabel.topAnchor.constraint(equalTo: upperLabel.bottomAnchor, constant: 16),
            myWordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            myWordLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
        
        
        myWordLabel.shadowColor = ThemeColors.shared.color(for: "alwaysBlack")
        myWordLabel.shadowOffset = CGSize(width: 5, height: 5)
        
    }
    
}
