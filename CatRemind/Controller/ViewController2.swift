//
//  ViewController2.swift
//  CatRemind
//
//  Created by Guillermo Ramos  on 3/6/19.
//  Copyright © 2019 Guillermo Ramos . All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController2: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    //variable to hold retrieved value
    
    
    //Database reference
    let ref: DatabaseReference! = Database.database().reference()
    var databaseHandle: DatabaseHandle?
    
    
    //GUI outlets
    @IBOutlet weak var muchFood: UITextField!
    @IBOutlet weak var foodKind: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    
    //GUI actions
    @IBAction func submitNewFood(_ sender: Any)
    {
        
        //To store size of food given by user
        guard let newSize = Double(muchFood.text!)
        else
        {
            print("Not a number!")
            return
        }
        //To store food kind given by user
        let newFoodKind = foodKind.text!
        
        var daysLeft: Double

        //instance of CatFood object
        let newFood = CatFood(size: newSize, type: newFoodKind)
        
        //Logic statements to determine output
        if(foodKind.text == "dry")
        {
            daysLeft = newFood.whenDryRunsOut()
            self.ref.child("daysLeft").setValue(daysLeft)
            
        }
        else if(foodKind.text == "wet")
        {
            daysLeft = newFood.whenWetRunsOut()
            self.ref.child("daysLeft").setValue(daysLeft)
            
        }
        //get data from firebase
        databaseHandle = ref.child("daysLeft").observe(.value, with: {snapshot in
            let days = snapshot.value as! Double
            
            self.displayLabel.text = "\(days) days until the food runs out"
            
        })
        
    }
    
    @IBAction func showCurrentFood(_ sender: Any)
    {
        databaseHandle = ref.child("daysLeft").observe(.value, with: {snapshot in
            let days = snapshot.value as! Double
            
            self.displayLabel.text = "\(days) days until the food runs out"
            
        })
    }
}
