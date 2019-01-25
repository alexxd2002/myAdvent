//
//  Main_VC_Code.swift
//  myAdvent
//
//  Created by Alexander Meinecke on 19.10.18.
//  Copyright © 2018 Alexander Meinecke. All rights reserved.
//

import UIKit

extension Main_ViewController {
    /**
     Die Funktion gibt den Monat und den Tag zurück
     
     * month -> Für Monat
     * day -> Für Tag
     
     - parameter feedback: day / month
    */
    func dayMonth(feedback: String) -> Int {
        let date = Date()
        let calender = Calendar.current
        
        //Dekleration der Variablen Tag / Montat
        let day = calender.component(.day, from: date)
        let month = calender.component(.month, from: date)
        
        //Parameter Ausgabe
        if feedback == "day" {
            print(day)
            return day
        } else if feedback == "month" {
            print(month)
            return month
        } else {
            print("Falscher Parameter!")
            return 0
        }
        
    }
    
    /**
     Die Funktion prüft, ob der Wert in das Muster passt
     
     * day: 0 -> Passt nicht
     * day: 1-24 & month: 12 -> Passt
     * day: > 24 & month != 12 -> Passt nicht
     
    */
    func checkDate() -> Bool {
        //Check
        if dayMonth(feedback: "day") == 0 || dayMonth(feedback: "day") > 24 || dayMonth(feedback: "month") != 12 {
            print("Passt nicht")
            return false
        } else {
            print("Passt")
            return false
        }
    }
    
    /**
     Die Funktion gibt die Werte im Lable "day" zurück
     
     * true -> Tag
     * false -> Emoji
     
    */
    func outputLbl() {
        if checkDate() {
            day.text = "Tür \(dayMonth(feedback: "day"))"
        } else {
            day.text = "\(dayMonth(feedback: "day")).\(dayMonth(feedback: "month"))"
        }
    }
    
    /**
     Die Funktion gibt den Werten abhängig "Haptic Feedback"
    */
    func hapticCheck() {
        let Generator = UINotificationFeedbackGenerator()
        
        //Feedback
        if checkDate() {
            Generator.notificationOccurred(.success)
        } else {
            Generator.notificationOccurred(.error)
        }
    }
    
    /**
     Die Funktion gibt eine Animation die Ausgeführ wird, wenn checkDate() -> false
    */
    func animFail() {

        
        //Basiswerte
        let ausschlag: CGFloat = 30.0
        let X = openOut.center.x
        let Y = openOut.center.y
        
        //Animation
        let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 3
            animation.autoreverses = true
            animation.fromValue = CGPoint(x: X - ausschlag, y: Y)
            animation.toValue = CGPoint(x: X + ausschlag, y: Y)
            openOut.layer.add(animation, forKey: "position")
            
        
        
    }
    
    /**
     Die Funkton benachrichtigt den User, wenn er auf den "Öffnenbutton" klickt und es gerade kein Datum für diese App ist, dass es gerade nicht geht.
     
     * Gibt Datum aus
     * Sagt, dass die Person warten soll, bis die WZ (Anfang Dezember) da ist
     
    */
    func alertFail() {
        //Überschrift
        let emoji = ["ʕ•ᴥ•ʔ", "(◕‿-)", "(>‿◠)✌", "(≧◡≦)"]
        let output = emoji.randomElement()
        
        let alert = UIAlertController(title: "\(output!)", message: "Warte bitte bis der Dezember begonnen hat und Weihnachten vor der Tür steht ", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /**
     Führt "Fail-Funlktonen aus, wenn checkDate() -> false"
     
     * Funktion animFail()
     * Funktion alertFail()
     
    */
    func buttonCheck() {
        
        //Check
        if !checkDate() {
            
            //animFail()
            //alertFail()
            print("*Achtung*: \tbuttonCheck() ist nicht vollständig ausgefürt worden")
            

        }
    }
    
    /**
     Funktion öffnet Tür wenn dateCheck() -> true
     (_ACHTUNG Testzweck: Öffnung erfolgt immer!!!_)
    */
    func openDoor() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = main.instantiateViewController(withIdentifier: "MainVC")
        let door = main.instantiateViewController(withIdentifier: "TurVC")
        
        
        mainVC.dismiss(animated: true, completion: nil)
        self.present(door, animated: true, completion: nil)
    }

}
