//
//  ViewController.swift
//  CardGame
//
//  Created by Raza on 04/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalScore: UILabel!
    @IBOutlet var cardCollectionView: UICollectionView!
    private let spacing:CGFloat = 16
   
    var isDeckplay = false
    static var firstValue: Int?
    static var currentValue: Int?
    private var deckIndex: Int = 0
    private var isFirstLoad: Bool = true
    private var cards: [CardModel] = [
        CardModel(id: 1, imageName: "Card1", score: 1),
        CardModel(id: 2, imageName: "card2", score: 2),
        CardModel(id: 3, imageName: "Card3", score: 3),
        CardModel(id: 4, imageName: "Card4", score: 4),
        CardModel(id: 7, imageName: "Card7", score: 7),
        CardModel(id: 8, imageName: "Card8", score: 8),
        CardModel(id: 9, imageName: "Card9", score: 9),
        CardModel(id: 10, imageName: "Card10", score: 10),
        CardModel(id: 6, imageName: "Card6", score: 6),
        CardModel(id: 3, imageName: "Card3", score: 3),
        CardModel(id: 4, imageName: "Card4", score: 4),
        CardModel(id: 5, imageName: "Card5", score: 5),
        CardModel(id: 1, imageName: "Card1", score: 1),
        CardModel(id: 5, imageName: "Card5", score: 5),
        CardModel(id: 6, imageName: "Card6", score: 6),
        CardModel(id: 2, imageName: "card2", score: 2),
        
    ]
    
    private var deckCards : [DeckModel] = [
        DeckModel(dId: 1, dImageName: "Card1", score: 1),
        DeckModel(dId: 3, dImageName: "Card3", score: 3),
        DeckModel(dId: 4, dImageName: "Card4", score: 4),
        DeckModel(dId: 5, dImageName: "Card5", score: 5),
        DeckModel(dId: 6, dImageName: "Card6", score: 6),
        DeckModel(dId: 7, dImageName: "Card7", score: 7),
        DeckModel(dId: 8, dImageName: "Card8", score: 8),
        DeckModel(dId: 9, dImageName: "Card9", score: 9),
        DeckModel(dId: 10, dImageName: "Card10", score: 10),
        DeckModel(dId: 1, dImageName: "Card1", score: 1),
        DeckModel(dId: 2, dImageName: "card2", score: 2),
        DeckModel(dId: 3, dImageName: "Card3", score: 3),
        DeckModel(dId: 4, dImageName: "Card4", score: 4),
        DeckModel(dId: 5, dImageName: "Card5", score: 5),
        DeckModel(dId: 3, dImageName: "Card3", score: 3),
        DeckModel(dId: 6, dImageName: "Card6", score: 6),
        DeckModel(dId: 8, dImageName: "Card8", score: 8),
        DeckModel(dId: 10, dImageName: "Card10", score: 10),
        //        DeckModel(dId: 1, dImageName: "Card1"),
        //        DeckModel(dId: 7, dImageName: "Card7"),
        //        DeckModel(dId: 1, dImageName: "Card1"),
        //        DeckModel(dId: 3, dImageName: "Card3"),
        //        DeckModel(dId: 4, dImageName: "Card4"),
        //        DeckModel(dId: 5, dImageName: "Card5"),
        //        DeckModel(dId: 6, dImageName: "Card6"),
        //        DeckModel(dId: 7, dImageName: "Card7"),
        //        DeckModel(dId: 8, dImageName: "Card8"),
        //        DeckModel(dId: 9, dImageName: "Card9"),
        //        DeckModel(dId: 10, dImageName: "Card10"),
        //        DeckModel(dId: 1, dImageName: "Card1"),
        //        DeckModel(dId: 2, dImageName: "card2"),
        //        DeckModel(dId: 3, dImageName: "Card3"),
        //        DeckModel(dId: 4, dImageName: "Card4"),
        //        DeckModel(dId: 5, dImageName: "Card5"),
        //        DeckModel(dId: 3, dImageName: "Card3"),
        //        DeckModel(dId: 6, dImageName: "Card6"),
        //        DeckModel(dId: 8, dImageName: "Card8"),
        //        DeckModel(dId: 10, dImageName: "Card10"),
        //        DeckModel(dId: 1, dImageName: "Card1"),
        //        DeckModel(dId: 7, dImageName: "Card7"),
    ]
    
    private var selectedIndexPaths: [IndexPath] = []
    private var totalScoreValue: Int = 0 {
        didSet {
            totalScore.text = "Total Score: \(totalScoreValue)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        reloadCards()
        
        for i in 1...40 {
            let deckImageName = "DeckImage\(i)"
            let defaultScore = 1
            let newDeckCard = DeckModel(dId: i, dImageName: deckImageName, score: defaultScore)
            deckCards.append(newDeckCard)
        }
    }
    
    private func setupCollectionView() {
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
    }
    
    
    private func reloadCards() {
        if isFirstLoad {
            // Shuffle the cards on initial load
            cards.shuffle()
            isFirstLoad = false
        } else {
            // Sort in ascending order on subsequent loads
            cards.sort { $0.id < $1.id }
        }
        cardCollectionView.reloadData()
    }
    
    //                if selectedIndexPaths.contains(indexPath) {
    //                    return
    //                }
                    // selected index are equla
                    // 3 show 3 bar
                    //40 + 36 + 32 + 28 + 24 + 20 + 16 + 12 + 8 + 4
                    // 220 + total score
    
            func handleCardSelection(indexPath: IndexPath) {
    
//                if selectedIndexPaths.count == 1 && selectedIndexPaths[0] == indexPath {
//                        print("Same card clicked twice: \(indexPath)")
//                        return // Ignore if the same card is clicked twice
//                    }
                
                if let lastSelectedIndexPath = selectedIndexPaths.last, lastSelectedIndexPath == indexPath {
                      print("Same card clicked twice consecutively: \(indexPath)")
                      return // Ignore if the same card is clicked again consecutively
                  }

                selectedIndexPaths.append(indexPath)
                print("Selected Index Paths: \(selectedIndexPaths)")
    
                if selectedIndexPaths.count >= 2 {

                    let firstIndexPath = selectedIndexPaths[selectedIndexPaths.count - 2]
                    let secondIndexPath = selectedIndexPaths[selectedIndexPaths.count - 1]
                    
                  
    //-1 index selected index are equla then
                    let firstCard = cards[firstIndexPath.item]
                    let secondCard = cards[secondIndexPath.item]
                    print(" First Card \(firstCard)")
                    print(" Second Card \(secondCard)")
                    if firstCard.imageName == secondCard.imageName {
                        // Cards match
                        let score = firstCard.score + secondCard.score
                        totalScoreValue += score
    
                        showScoreAlert(score: score)
    
                        print("Cards matched at \(firstIndexPath.item) and \(secondIndexPath.item)!")
                        hideCards([firstIndexPath, secondIndexPath])
                        
                       
                        selectedIndexPaths.removeAll()
                    } else {
                        // Cards do not match,
                        print("click card\(firstCard.imageName)")
                        print("click card\(secondCard.imageName)")
                        print("No match, waiting for next selection.")
                    }
    
                } else if selectedIndexPaths.count == 3 {
    
                    let thirdIndexPath = selectedIndexPaths[2]
                    let thirdCard = cards[thirdIndexPath.item]
    
                    let secondIndexPath = selectedIndexPaths[1]
                    let secondCard = cards[secondIndexPath.item]
    
                    if thirdCard.imageName == secondCard.imageName {
                        // Third card matches with the second card
                        print("Third card matches with the second card at index \(secondIndexPath.item) and \(thirdIndexPath.item)!")
                        hideCards([secondIndexPath, thirdIndexPath])
                    } else {
                            // No match found, deselect all cards after 1-second delay
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                for indexPath in self.selectedIndexPaths {
                                    self.cardCollectionView.deselectItem(at: indexPath, animated: true)
                                }
                            }
                        }
    
                        // Clear selected index paths
                        //            selectedIndexPaths.removeAll()
                    }
    
}


    // Show an alert with the score and animate it
    func showScoreAlert(score: Int) {
        let alert = UIAlertController(title: "Card Game!", message: "Score: \(score)", preferredStyle: .alert)
        
        // Add an OK action
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
           
        // Present the alert
        present(alert, animated: true) {
            UIView.animate(withDuration: 0.3) {
                alert.view.transform = CGAffineTransform.identity
            }
        }
        
    }
    func hideCards(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if let cell = cardCollectionView.cellForItem(at: indexPath) as? CardCollectionViewCell {
                cell.setBlackImage()
                cell.isUserInteractionEnabled = false
            }
        }
    }

      func updateMatchingCells() {
          for indexPath in selectedIndexPaths {
              if let cell = cardCollectionView.cellForItem(at: indexPath) as? CardCollectionViewCell {
                  cell.setBlackImage()
                  
              }
          }
      }

    @IBAction func deckBtn(_ sender: Any) {
//       
//        if isDeckplay {
//            isDeckplay = true
//        } else {
//            isDeckplay = false
//        }
        
        if let firstBlackImageIndexPath = cardCollectionView.indexPathsForVisibleItems.first(where: {
            if let cell = cardCollectionView.cellForItem(at: $0) as? CardCollectionViewCell {
                return cell.cardImage.image == UIImage(named: "blackImage")
            }
            return false
        }) {
            if let cell = cardCollectionView.cellForItem(at: firstBlackImageIndexPath) as? CardCollectionViewCell {
                if deckIndex < deckCards.count {
                    let newDeckModel = deckCards[deckIndex]
                    let newImageName = newDeckModel.dImageName
                    let newScore = newDeckModel.score
                    
                    // Update the card's image and score
                    cards[firstBlackImageIndexPath.item].imageName = newImageName
                    cards[firstBlackImageIndexPath.item].score = newScore
                    cell.cardImage.image = UIImage(named: newImageName)
                    cell.isUserInteractionEnabled = true
                    deckIndex += 1
                }
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  //     return cards.count
        if isDeckplay {
            return deckCards.count
        } else {
            return cards.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        let card = cards[indexPath.item]
        cell.cardImage.image = UIImage(named: card.imageName)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       
        handleCardSelection(indexPath: indexPath)
        guard let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell else {return}
        UIView.animate(withDuration: 0.2, animations: {
            cell.cardImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.2, animations: {
                cell.cardImage.transform = CGAffineTransform.identity
            })
            
        }
    }
}


extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: collectionWidth/4-20, height: collectionWidth/3)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func sideSpace(){
        let layout = UICollectionViewFlowLayout()
        
            layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
            self.cardCollectionView?.collectionViewLayout = layout
    }
}











//      func handleCardSelection(indexPath: IndexPath) {
//          if let selectedIndex = selectedIndexPaths.firstIndex(of: indexPath) {
//              // Card was already selected, do nothing or handle if needed
//              return
//          }
//
//          selectedIndexPaths.append(indexPath)
//
//          if selectedIndexPaths.count == 2 {
//
//              let firstIndexPath = selectedIndexPaths[0]
//              let secondIndexPath = selectedIndexPaths[1]
//
//              let firstCard = cards[firstIndexPath.item]
//              let secondCard = cards[secondIndexPath.item]
//
//
//              // Check if both cards are blocked images
//                     if isBlockedImage(imageName: firstCard.imageName) && isBlockedImage(imageName: secondCard.imageName) {
//                         // Both cards are blocked images, do not count the score
//                         print("Both cards are blocked images. No score update.")
//                         // Deselect the cards after a short delay to show they are blocked
//                         DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                             self.cardCollectionView.deselectItem(at: firstIndexPath, animated: true)
//                             self.cardCollectionView.deselectItem(at: secondIndexPath, animated: true)
//                         }
//                     } else if firstCard.imageName == secondCard.imageName {
//                         // Cards match, calculate and update the score
//                         let score = firstCard.score + secondCard.score
//                         totalScoreValue += score
//
//                         // Update the collection view cells
//                         updateMatchingCells()
//
//                         // Print debugging information
//                         print("Cards matched!")
//                         print(" ImageName: \(firstCard.imageName) Score: \(firstCard.score)")
//                         print(" ImageName: \(secondCard.imageName) Score: \(secondCard.score)")
//                         print("Total Score: \(totalScoreValue)")
//                     } else {
//                         // Cards do not match, deselect cards
//                         DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                             self.cardCollectionView.deselectItem(at: firstIndexPath, animated: true)
//                             self.cardCollectionView.deselectItem(at: secondIndexPath, animated: true)
//                         }
//                     }
//
//                     // Clear selected index paths
//                     selectedIndexPaths.removeAll()
//                 }
//      }
//
//    func isBlockedImage(imageName: String) -> Bool {
//        // Define your blocked image names here
//        let blockedImageNames = ["blackImage"]
//        return blockedImageNames.contains(imageName)
//    }
//
