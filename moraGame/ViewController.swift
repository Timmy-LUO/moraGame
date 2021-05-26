//
//  ViewController.swift
//  moraGame
//
//  Created by 羅承志 on 2021/5/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winLoseLabel: UILabel!
    
    @IBOutlet weak var oppositeImageView: UIImageView!
    @IBOutlet weak var oppositeScoreLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var stoneButton: UIButton!
    @IBOutlet weak var userScoreLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameOverImageView: UIImageView!
    
    //user方顯示之圖片
    let paperImage = UIImage(named: "03")
    let scissorImage = UIImage(named: "01")
    let stoneImage = UIImage(named: "02")
    //opposite方圖片array
    let computerImages = ["03", "01", "02"]
    //宣告user, opposite分數
    var userScoreNumber = 0
    var oppositeScoreNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameOverImageView.isHidden = true
    }
    //computer方的隨機圖片
    func oppositeRandom() {
        oppositeImageView.image = UIImage(named: computerImages.randomElement()!)
        //將圖片鏡像翻轉
        oppositeImageView.transform = CGAffineTransform(scaleX: 1, y: -1)
    }
    //設定達成五分為獲勝
    func finalResult() {
        if userScoreNumber == 5 {
            winLoseLabel.textColor = UIColor.green
            winLoseLabel.text = "YOU WIN"
            gameOverImageView.isHidden = false
            paperButton.isHidden = true
            scissorButton.isHidden = true
            stoneButton.isHidden = true
        } else if oppositeScoreNumber == 5 {
            winLoseLabel.textColor = UIColor.red
            winLoseLabel.text = "YOU LOSE"
            gameOverImageView.isHidden = false
            paperButton.isHidden = true
            scissorButton.isHidden = true
            stoneButton.isHidden = true
        }
    }
    
    @IBAction func selectPaper(_ sender: UIButton) {
        userImageView.image = paperImage
        oppositeRandom()
        if oppositeImageView.image == UIImage(named: computerImages[0]) {
            winLoseLabel.text = "DRAW"
        } else if oppositeImageView.image == UIImage(named: computerImages[1]) {
            winLoseLabel.text = "YOU LOSE"
            oppositeScoreNumber += 1
            oppositeScoreLabel.text = "\(oppositeScoreNumber)"
        } else if oppositeImageView.image == UIImage(named: computerImages[2]) {
            winLoseLabel.text = "YOU WIN"
            userScoreNumber += 1
            userScoreLabel.text = "\(userScoreNumber)"
        }
        finalResult()
    }
    
    @IBAction func selectScissor(_ sender: UIButton) {
        userImageView.image = scissorImage
        oppositeRandom()
        if oppositeImageView.image == UIImage(named: computerImages[0]) {
            winLoseLabel.text = "YOU WIN"
            userScoreNumber += 1
            userScoreLabel.text = "\(userScoreNumber)"
        } else if oppositeImageView.image == UIImage(named: computerImages[1]) {
            winLoseLabel.text = "DRAW"
        } else if oppositeImageView.image == UIImage(named: computerImages[2]) {
            winLoseLabel.text = "YOU LOSE"
            oppositeScoreNumber += 1
            oppositeScoreLabel.text = "\(oppositeScoreNumber)"
        }
        finalResult()
    }
    
    @IBAction func selectStone(_ sender: UIButton) {
        userImageView.image = stoneImage
        oppositeRandom()
        if oppositeImageView.image == UIImage(named: computerImages[2]) {
            winLoseLabel.text = "DRAW"
        } else if oppositeImageView.image == UIImage(named: computerImages[0]) {
            winLoseLabel.text = "YOU LOSE"
            oppositeScoreNumber += 1
            oppositeScoreLabel.text = "\(oppositeScoreNumber)"
        } else if oppositeImageView.image == UIImage(named: computerImages[1]) {
            winLoseLabel.text = "YOU WIN"
            userScoreNumber += 1
            userScoreLabel.text = "\(userScoreNumber)"
        }
        finalResult()
    }
    
    @IBAction func restart(_ sender: UIButton) {
        gameOverImageView.isHidden = true
        userScoreNumber = 0
        userScoreLabel.text = "\(userScoreNumber)"
        oppositeScoreNumber = 0
        oppositeScoreLabel.text = "\(oppositeScoreNumber)"
        winLoseLabel.text = "Start！"
        winLoseLabel.textColor = UIColor.black
    }
}

