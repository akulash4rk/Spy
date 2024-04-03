
import Foundation
import UIKit

class ThemeColors {
    static let shared = ThemeColors()
    
    private var lightModeColors: [String: UIColor] = [
        "background": UIColor.white,
        "text": UIColor.black,
        "alwaysBlack" : UIColor.black, //костыль, знаю
        "alwaysWhite": UIColor.white
    ]
    private var darkModeColors: [String: UIColor] = [
        "background": UIColor.black,
        "text": UIColor.white,
        "alwaysBlack": UIColor.black,
        "alwaysWhite": UIColor.white
        
    ]
    private init() {}
    func color(for key: String) -> UIColor? {
        if #available(iOS 13.0, *) {
            if UITraitCollection.current.userInterfaceStyle == .dark {
                return darkModeColors[key]
            }
        }
        
        
        return lightModeColors[key]
    }
}
