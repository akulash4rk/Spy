import UIKit


//MARK: - Enums
enum TextAttributes {
    case title
    case subtitle
    case body
}


//I haven't got any patterns of application in my colors, becouse of that names so strange <3
enum Colors {
    case purpleMain
    case semiVinous
    case closeToRed
    case closeToOrange
}



//MARK: - Estensions
extension Colors {
    var color: UIColor {
        switch self {
        case .purpleMain:
            return UIColor(red: 34/255, green: 9/255, blue: 44/255, alpha: 1)
        case .semiVinous:
            return UIColor(red: 135/255, green: 35/255, blue: 65/255, alpha: 1)
        case .closeToRed:
            return UIColor(red: 190/255, green: 49/255, blue: 68/255, alpha: 1)
        case .closeToOrange:
            return UIColor(red: 240/255, green: 89/255, blue: 65/255, alpha: 1)
        }
    }
}

extension TextAttributes {
    var font: UIFont {
        switch self {
        case .title:
            return UIFont(name: "Rockwell-Bold", size: 80)!
        case .subtitle:
            return UIFont(name: "Rockwell-Bold", size: 40)!
        case .body:
            return UIFont(name: "Rockwell", size: 20)!
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .title, .subtitle, .body:
            return .black
        }
    }
    
    var strokeColor: UIColor {
        switch self {
        case .title, .subtitle, .body:
            return .white
        }
    }
    
    var strokeWidth: CGFloat {
        switch self {
        case .title, .subtitle, .body:
            return -3
        }
    }
}

func createLabelSpyMain(currentView : UIView) -> UILabel{
    let spyLabel = UILabel()
    currentView.addSubview(spyLabel)
    spyLabel.attributedText = NSAttributedString(
        string: "Шпион",
        attributes: [
            NSAttributedString.Key.foregroundColor: Colors.semiVinous.color,
            NSAttributedString.Key.font: TextAttributes.title.font,
        ])
    spyLabel.shadowOffset = CGSize(width: 10, height: 10)
    spyLabel.shadowColor = ThemeColors.shared.color(for: "alwaysBlack")
    return spyLabel
}



func configureButton(currentButton: UIButton, textOnTheButton: String) ->UIButton{
    currentButton.backgroundColor = Colors.semiVinous.color
    currentButton.layer.cornerRadius = 20
    currentButton.clipsToBounds = true
    
    
    let labelOnTheButton = UILabel()
    print(currentButton.subviews)
    labelOnTheButton.removeFromSuperview()
    currentButton.addSubview(labelOnTheButton)

    labelOnTheButton.attributedText = NSAttributedString(
        string: textOnTheButton,
        attributes: [
            NSAttributedString.Key.foregroundColor: ThemeColors.shared.color(for: "alwaysBlack"),
            NSAttributedString.Key.font: TextAttributes.subtitle.font,
            NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
            ])
        
//
    
    labelOnTheButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        labelOnTheButton.centerXAnchor.constraint(equalTo: currentButton.centerXAnchor, constant: 3),
        labelOnTheButton.centerYAnchor.constraint(equalTo: currentButton.centerYAnchor)
    ])
    
    
    return currentButton
}
