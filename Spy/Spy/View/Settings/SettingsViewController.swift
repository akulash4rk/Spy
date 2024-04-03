import UIKit
class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView()
    let cellIdentifier = "CellIdentifier"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = Colors.purpleMain.color
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableView)
        createTableView()
    }
    
    func createTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // Количество строк в таблице
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor =  Colors.purpleMain.color
        var stringForTextLabel = ""
        // Создание названий для строк
        if indexPath.row == 0 {
            let switchView = UISwitch(frame: .zero)
            switchView.onTintColor = Colors.closeToRed.color
            stringForTextLabel = "Показывать роль"
            switchView.isOn = willRoleShowToSpy
            switchView.addTarget(self, action: #selector(showRole(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        }
        if indexPath.row == 1 {
            let switchView = UISwitch(frame: .zero)
            switchView.onTintColor = Colors.closeToRed.color
            stringForTextLabel = "Показывать слово шпиону"
            switchView.isOn = willWordShowToSpy
            switchView.addTarget(self, action: #selector(showWordToSpy(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        }
        if indexPath.row == 2 {
            stringForTextLabel = "Время"
        }
        if indexPath.row == 3 {
            
            stringForTextLabel = "Темы"
        }
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            let chooseTime = SettingsTimeViewController()
            navigationController?.pushViewController(chooseTime, animated: true)
        }
        if indexPath.row == 3 {
            let pickTheme = SettingsThemesView()
            navigationController?.pushViewController(pickTheme, animated: true)
        }
    }
    // MARK: - Action Methods
    
    //In this methods checking for minimum one on switch
    //If player try off all switches, we set to on other
    
    @objc func showRole(_ sender: UISwitch) {
        if sender.isOn {
            willRoleShowToSpy = true
            if let indexPath = tableView.indexPath(for: sender.superview as! UITableViewCell) {
                let indexPathForSecondSwitch = IndexPath(row: 1, section: indexPath.section)
                if let cell = tableView.cellForRow(at: indexPathForSecondSwitch) {
                    if let secondSwitch = cell.accessoryView as? UISwitch {
                        secondSwitch.isOn = true
                        willWordShowToSpy = true
                    }
                }
            }
        } else {
            willRoleShowToSpy = false
            if let indexPath = tableView.indexPath(for: sender.superview as! UITableViewCell) {
                let indexPathForSecondSwitch = IndexPath(row: 1, section: indexPath.section)
                if let cell = tableView.cellForRow(at: indexPathForSecondSwitch) {
                    if let secondSwitch = cell.accessoryView as? UISwitch {
                        secondSwitch.isOn = true
                        willWordShowToSpy = true
                    }
                }
            }
        }
    }

    
    
    
    @objc func showWordToSpy(_ sender: UISwitch) {

        if sender.isOn {
            willWordShowToSpy = true
        } else {
            willWordShowToSpy = false
            if let indexPath = tableView.indexPath(for: sender.superview as! UITableViewCell) {
                let indexPathForFirstSwitch = IndexPath(row: 0, section: indexPath.section)
                if let cell = tableView.cellForRow(at: indexPathForFirstSwitch) {
                    if let firstSwitch = cell.accessoryView as? UISwitch {
                        firstSwitch.isOn = true
                        willRoleShowToSpy = true
                    }
                }
            }
        }
    }

}
