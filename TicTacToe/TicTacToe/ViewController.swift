//
//  ViewController.swift
//  TicTacToe
//
//  Created by Zülal Sarıoğlu on 20.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case Nought
        case Cross
    }
    
    @IBOutlet weak var lblTurn: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var firsTurn = Turn.Cross
    var currentturn = Turn.Cross
    var NOUGHT = "O"
    var CROSS =  "X"
    var board =  [UIButton]()
    
    var noughtsScore =  0
    var crossScore =  0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }


    @IBAction func boardTopAction(_ sender: UIButton) {
        addToBoard(sender)
        if checkVictory(CROSS) {
            crossScore += 1
            resultAlert(title: "Cross Victory")
        }
        
        if checkVictory(NOUGHT){
            noughtsScore += 1
            resultAlert(title: "Nought is victory")
        }
    
        if (fullBoard()){
            resultAlert(title: "Draw")
            
        }
    }
    
    func initBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    
 
    }
    
    func checkVictory (_ s : String) -> Bool{
        if (thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s)){
            return true
        }
        if (thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s)){
            return true
        }
        if (thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s)){
            return true
        }
        
        if (thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s)){
            return true
        }
        if (thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s)){
            return true
        }
        if (thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s)){
            return true
        }
        if (thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s)){
            return true
        }
        if (thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s)){
            return true
        }
            return false
        
    }
    func thisSymbol(_ button : UIButton , _ symbol : String) -> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    func resultAlert(title: String){
        let message = "\nNought" + String(noughtsScore) + "\n\nCross" + String(crossScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "reset", style: .default, handler: { _  in
            self.resetBoard() }))
        self.present(ac, animated: true)
        }
    
    func resetBoard(){
        for button in board{
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
           
        }
        currentturn = firsTurn
           
           if currentturn == Turn.Nought {
               lblTurn.text = NOUGHT
           } else {
               lblTurn.text = CROSS
           }
       
    }
     
    func addToBoard(_ sender: UIButton) {
        
        if(sender.title(for: .normal) == nil)
        {
            if(currentturn == Turn.Nought){
                sender.setTitle(NOUGHT, for: .normal)
                currentturn = Turn.Cross
                lblTurn.text = CROSS
            }
            else if(currentturn == Turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                currentturn = Turn.Nought
                lblTurn.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }
}

