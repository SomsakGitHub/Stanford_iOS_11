//
//  Swift1VC.swift
//  Stanford_iOS_11
//
//  Created by somsak on 28/10/2563 BE.
//

import UIKit

class Swift1VC: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var flipCount = 0 {
        didSet {
            self.flipCountLabel.text = "\(self.flipCount)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc func dismissOnTapOutside(){
       self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var cardButton: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(text: "Button1", on: sender)
    }
    
    @IBAction func touchCollection(_ sender: UIButton) {
        
        var dialogMessage = UIAlertController()
        
        if let cardCollection = cardButton.index(of: sender) {
            dialogMessage = UIAlertController(title: "UIAlertController", message: "\(cardCollection)", preferredStyle: .alert)
        }else{
            dialogMessage = UIAlertController(title: "UIAlertController", message: "not value", preferredStyle: .alert)
        }
        
        self.present(dialogMessage, animated: true, completion:{
           dialogMessage.view.superview?.isUserInteractionEnabled = true
           dialogMessage.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        })
    }
    
    func flipCard(text: String, on button: UIButton){
        if button.currentTitle == text {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }else{
            button.setTitle(text, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }
        
        self.flipCount += 1
    }
}
