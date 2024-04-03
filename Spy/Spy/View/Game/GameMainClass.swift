import Foundation
import UIKit
class GameMainClass: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Colors.closeToRed.color
        return collectionView
    }()
    var spyOnTheTable = countOfSpy
    var originalNavigationBarTintColor = UIColor()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        originalNavigationBarTintColor = (self.navigationController?.navigationBar.tintColor)!
        self.navigationController?.navigationBar.tintColor = Colors.purpleMain.color
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.tintColor = originalNavigationBarTintColor
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.closeToRed.color
        savedPlayer = countOfPlayers
        savedSpy = countOfSpy
        countOfPlayersOnTheTable = countOfPlayers
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CellForCollectionViewInGame.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        startTimer()
    }
    // MARK: - Settings CollecitonView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countOfPlayersOnTheTable
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellForCollectionViewInGame
      
        let array = Array(1...countOfPlayers)
        
        cell.label.text = "Игрок #\(array[indexPath.row])"
        cell.imageView.image = UIImage(named: "Player")
        cell.layer.cornerRadius = 15
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 8) / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CellForCollectionViewInGame else { return }
        print("Cell clicked")
        

        cell.isUserInteractionEnabled = false
        
        UIView.transition(with: cell, duration: 0.3, options: [.transitionFlipFromRight], animations: {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
        
        print(arrayOfPlayers)
        print(arrayOfPlayers[indexPath.row+1])
        
        let viewOfEndGame = EndOfGameClass()
        let menu = MainMenuViewController()
        let pickerOfPlayers = CountOfPlayerChooserView()
        let pickerOfSpy = CountOfSpyView()
        
        if arrayOfPlayers[indexPath.row+1] == true { // Если игрок шпион
            cell.label.text = "Шпион"
            cell.imageView.image = UIImage(named: "Spy")
            cell.createEliminatedLabel()
            spyOnTheTable -= 1
            print("countOfSpy ", countOfSpy)
        } else {
            cell.label.text = "Мирный"
            cell.createMissEliminatedLabel()
            countOfPlayersOnTheTable -= 1
            print("countOfPlayersOnTheTable ", countOfPlayersOnTheTable)
        }
        
        
        if countOfPlayersOnTheTable - countOfSpy == 0 {
            print("Spy Win")
            print("countOfPlayers ", countOfPlayersOnTheTable)
            whoWin = "Spy"
            navigationController?.setViewControllers([menu, pickerOfPlayers, pickerOfSpy, viewOfEndGame], animated: true)
        }
        if (spyOnTheTable == 0)  {
            print("countOfSpy ", countOfSpy)
            print("Players Win")
            whoWin = "Player"
            navigationController?.setViewControllers([menu, pickerOfPlayers, pickerOfSpy, viewOfEndGame], animated: true)
        }
        
    }



    

    
    
    //MARK: - Start Timer
    func startTimer(){
        if timerTime != 0 {
            //making view black
            let timerView = UIView()
            view.addSubview(timerView)
            timerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            timerView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                timerView.topAnchor.constraint(equalTo: view.topAnchor),
                timerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                timerView.leftAnchor.constraint(equalTo: view.leftAnchor),
                timerView.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
            
            
            //setup timer
            let timerLabel = UILabel()
            timerView.addSubview(timerLabel)
            timerLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                timerLabel.heightAnchor.constraint(equalToConstant: 300),
                timerLabel.widthAnchor.constraint(equalToConstant: 300),
            ])
            
            
            timerView.addSubview(timerLabel)
            timerLabel.textAlignment = .center
            timerLabel.attributedText = NSAttributedString(
                string: "\(timerTime)",
                attributes: [
                    NSAttributedString.Key.foregroundColor:  Colors.closeToRed.color,
                    NSAttributedString.Key.font: TextAttributes.title.font,
                    NSAttributedString.Key.strokeColor: ThemeColors.shared.color(for: "alwaysWhite"),
                ])
            timerLabel.shadowColor = ThemeColors.shared.color(for: "alwaysBlack")
            timerLabel.shadowOffset = CGSize(width: 5, height: 5)
            var remainingTime = timerTime
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                remainingTime -= 1
                timerLabel.text = "\(remainingTime)"
                
                
                
                if remainingTime == 0 {
                    timer.invalidate()
                    timerLabel.removeFromSuperview()
                    var counter = 0.5
                    
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                        counter -= 0.1
                        timerView.backgroundColor = UIColor.black.withAlphaComponent(counter)
                        if counter <= 0{
                            timerView.removeFromSuperview()
                            timerLabel.removeFromSuperview()
                        }
                    }
                }
                
            }
        }


    }
    
}
