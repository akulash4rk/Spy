//
//  SettingsViewVC.swift
//  Spy
//
//  Created by Владислав Баранов on 02.04.2024.
//

import Foundation
import UIKit

class SettingsTimeViewController : ViewController, UITableViewDelegate, UITableViewDataSource {

    var arrayOfTime = [0, 30, 60, 90, 120, 150, 180]
    
    
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
        return arrayOfTime.count // Количество строк в таблице
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.backgroundColor =  Colors.purpleMain.color
        var stringForTextLabel = arrayOfTime[indexPath.row]
        
        cell.textLabel?.attributedText = NSAttributedString(
            string: "\(stringForTextLabel) секунд",
            attributes: [
                NSAttributedString.Key.foregroundColor: Colors.closeToRed.color,
                NSAttributedString.Key.font: TextAttributes.body.font,
                NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
            ])
        if stringForTextLabel == 0 {
            cell.textLabel?.text = "По одному высказыванию"
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        timerTime = arrayOfTime[indexPath.row]
        navigationController?.popViewController(animated: true)
    }

    


}




    
    
    

