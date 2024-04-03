//
//  SettingsViewVC.swift
//  Spy
//
//  Created by Владислав Баранов on 02.04.2024.
//

import Foundation
import UIKit

class SettingsThemesView : ViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    let tableViewThemes = UITableView()
    let cellIdentifier = "CellIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.purpleMain.color
        createArrayOfThemes()
        tableViewThemes.backgroundColor = Colors.purpleMain.color
        tableViewThemes.delegate = self
        tableViewThemes.dataSource = self
        tableViewThemes.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableViewThemes)
        createtableViewThemes()
    }
    
    
    
    
    func createtableViewThemes(){
        tableViewThemes.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewThemes.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewThemes.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableViewThemes.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableViewThemes.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfThemes.count // Количество строк в таблице
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let switchView = UISwitch(frame: .zero)
        switchView.onTintColor = Colors.closeToRed.color
        cell.backgroundColor =  Colors.purpleMain.color
        switchView.addTarget(self, action: #selector(updateArrayOfThemes(_:)), for: .valueChanged)
        cell.accessoryView = switchView
        var stringForTextLabel = arrayOfThemes[indexPath.row]
        switchView.isOn = playingThemes[arrayOfThemes[indexPath.row]]!
        switchView.tag = indexPath.row
        cell.textLabel?.attributedText = NSAttributedString(
            string: stringForTextLabel,
            attributes: [
                NSAttributedString.Key.foregroundColor: Colors.closeToRed.color,
                NSAttributedString.Key.font: TextAttributes.body.font,
                NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
            ])
        
        cell.selectionStyle = .none

        return cell
    }
    
    
    @objc func updateArrayOfThemes(_ sender: UISwitch) {
        var selectedTheme = arrayOfThemes[sender.tag]
        if sender.isOn {
            playingThemes[arrayOfThemes[sender.tag]] = true
        } else {
            playingThemes[arrayOfThemes[sender.tag]] = false
        }
        print(arrayOfThemes)
        print(playingThemes)
    }

}




    
    
    

