import UIKit
class CellForCollectionViewInGame: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(
            string: "",
            attributes: [
                NSAttributedString.Key.foregroundColor:  Colors.purpleMain.color,
                NSAttributedString.Key.font: TextAttributes.body.font,
                NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
            ])
        
        return label
    }()
    
    
    let eliminatedLabel :UILabel = {
        let eliminatedLabel = UILabel()
        
        eliminatedLabel.textAlignment = .center
        eliminatedLabel.translatesAutoresizingMaskIntoConstraints = false
        eliminatedLabel.attributedText = NSAttributedString(
            string: "Ликвидирован",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(ciColor: .red),
                NSAttributedString.Key.font: TextAttributes.body.font,
                NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
            ])
        
        
        return eliminatedLabel
    }()
    
    let missEliminatedLabel : UILabel = {
        let missEliminatedLabel = UILabel()
        
        missEliminatedLabel.textAlignment = .center
        missEliminatedLabel.translatesAutoresizingMaskIntoConstraints = false
        missEliminatedLabel.attributedText = NSAttributedString(
            string: "Убит по ошибке",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(ciColor: .red),
                NSAttributedString.Key.font: TextAttributes.body.font,
                NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
            ])
        
        
        return missEliminatedLabel
    }()
    
    
    func createEliminatedLabel(){
        addSubview(eliminatedLabel)
        
        NSLayoutConstraint.activate([
            eliminatedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            eliminatedLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            eliminatedLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.2),
            eliminatedLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
        eliminatedLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/4)
    }
    
    func createMissEliminatedLabel(){
        addSubview(missEliminatedLabel)
        
        NSLayoutConstraint.activate([
            missEliminatedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            missEliminatedLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            missEliminatedLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.2),
            missEliminatedLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
        missEliminatedLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/4)
    }
    
    let viewForLabel : UIView = {
        let viewForLabel = UIView()
        viewForLabel.backgroundColor = Colors.closeToRed.color
        viewForLabel.layer.borderWidth = 1
        viewForLabel.layer.borderColor = ThemeColors.shared.color(for: "alwaysBlack")?.cgColor
        viewForLabel.translatesAutoresizingMaskIntoConstraints = false
        viewForLabel.layer.cornerRadius = 15
        return viewForLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.semiVinous.color
        // Добавление subviews и установка констрейнтов
        addSubview(imageView)
        addSubview(viewForLabel)
        viewForLabel.addSubview(label)
        
        
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            viewForLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewForLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewForLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewForLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewForLabel.heightAnchor.constraint(equalToConstant: label.frame.height+30),
            
            label.centerYAnchor.constraint(equalTo: viewForLabel.centerYAnchor, constant: 0),
            label.centerXAnchor.constraint(equalTo: viewForLabel.centerXAnchor),
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
