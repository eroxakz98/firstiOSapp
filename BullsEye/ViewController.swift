 //
//  ViewController.swift
//  BullsEye
//
//  Created by ernurashirbay on 16.06.2021.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue = 0
    @IBOutlet weak var targetLabel: UILabel!
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    var round = 0
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        startNewRound()
        startNewGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        // Do any additional setup after loading the view.
    }
    func updateLabel(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String (round)
    }
    
    func startNewRound(){
        round += 1 //счетчик раундов
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value of slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() { //Эта функция предназначена для Popup алертов
        
        let difference = abs(targetValue - currentValue)
//        предназначено для высчитывания разницы между значениями target и slider
//       let creates constants, var creates variables
        var points = 100 - difference
        let title: String
        if difference == 0 {
            title = "Идеально"
            points += 100
        } else if difference < 5 {
            title = "Почти попал"
            if difference == 1 {
                points += 50
            }
        } else {
            title = "даже не близко..."
        }
        
        score += points
//        score+=points means score = score + points
        
        
        let message = "Ты набрал \(points) очков"
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Круто!", style: .default, handler: {
            action in
            self.startNewRound()  //Swift closure
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    @IBAction func knockKnock() { //Эта функция предназначена для Popup алертов
        
        let alert = UIAlertController(title: "Knock, Knock!", message: "Who is there?", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Little old lady", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

