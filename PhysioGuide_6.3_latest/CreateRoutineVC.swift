//
//  CreateRoutineVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created: 2015-11-21.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit


class CreateRoutineVC: UIViewController, UICollectionViewDelegate, UITextFieldDelegate, ContainerViewControllerProtocol {
    
    // MARK: Properties
    
    //references to the container view controllers
    let routineClass = Routines()
    private var embeddedViewController1: ExerciseListTVC!
    private var embeddedViewController2: CurrentRoutineTVC!
    //
    
    @IBOutlet weak var ListContainer: UIView!
    @IBOutlet weak var CurrentRoutineContainer: UIView!
    
    @IBOutlet weak var nameYourRoutine: UILabel! // UILabel telling the user to enter name of routine
    @IBOutlet weak var routineName: UITextField! // UITextField for user to enter name into
    @IBOutlet weak var createButton: UIButton! // Button for user to click when they have entered name
    @IBOutlet weak var doneSelectingExercisesButton: UIButton!
    @IBOutlet weak var nameViewBox: UIView! // white UIView for the naming objects to sit in for a cleaner look
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // handle the test field's user inut through delegate callbacks
        routineName.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    //?
    func testFieldDidEndEditing(textField: UITextField) {
    }
    
    // MARK: Actions
    
    @IBAction func nameRoutine(sender: UIButton) {
        if embeddedViewController2.exercises.count > 0 { // This is the number of exercises in the CurrentRoutineTVC
        //user has clicked Done button after selecting their exercises
        //show the hidden objects so the user can name their routine
        nameViewBox.hidden = false
        //disable user interaction so they can't add/remove items while naming the routine
        doneSelectingExercisesButton.userInteractionEnabled = false
        ListContainer.userInteractionEnabled = false
        CurrentRoutineContainer.userInteractionEnabled = false
        
        //perhaps the create button is bugged somehow
        createButton.hidden = false
        createButton.userInteractionEnabled = true
        
        //fade them as well to let them know
        /*
        doneSelectingExercisesButton.alpha = 0.4
        ListContainer.alpha = 0.4
        CurrentRoutineContainer.alpha = 0.4
        */
        } else {
            // The user didn't select any exercises, so don't allow them to make one.
            print("You didn't select any exercises")
            self.displayAlertMessage("You must select at least one exercise.")
        }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ExerciseListSegue" {
            let containerViewController = segue.destinationViewController as! ExerciseListTVC
            containerViewController.delegate = self
        }
        //parent attempt
        if let vc = segue.destinationViewController as? CurrentRoutineTVC where segue.identifier == "CurrentRoutineSegue" {
            self.embeddedViewController2 = vc
        }
    }
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let vc  = segue.destinationViewController as? ExerciseListTVC where segue.identifier == "ExerciseListSegue" {
    self.embeddedViewController1 = vc
    }
    if let vc = segue.destinationViewController as? CurrentRoutineTVC where segue.identifier == "CurrentRoutineSegue" {
    self.embeddedViewController2 = vc
    }
    }
    */
    
    
    func addExercise(e: Exercise) -> Void {
        self.embeddedViewController2.addExercise(e)
    }
    
    var newRoutine = [Exercise]() // the empty exercise array to store the new routine in. Get the exercises from CurrentRoutineTVC
    @IBAction func createRoutine(sender: UIButton) {
        print("I was pressed")
        //need to send the current routine info to the server here.
        newRoutine = self.embeddedViewController2.saveRoutine() //this can now be passed to the run routine page or to the server
        var inc : Int = 0
        var routineBuilder : [String:String] = ["routineName" : routineName.text!, "username" : LocalSave.sharedLocalSave.localUser!]
        
        while(inc < 20 )
        {
            while(inc < newRoutine.count){
                let val = String(inc + 1)
            
                routineBuilder["exID"+val] = newRoutine[inc].id
                print (newRoutine[inc].name)
                inc++
            }
            let val = String(inc+1)
            routineBuilder["exID"+val] = "0"
            inc++
        }
        print (routineBuilder)


        routineClass.createRoutine(routineBuilder, completionHandler: { confirmation in

            if(confirmation == 1)
            {
                print("Holy shit it worked!")
            }else{
                print("Broked, contact rohm")
            }
        })
        
        let mm = MainMenuVC()
        mm.loadData()
        
        let mainSB = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainSB.instantiateViewControllerWithIdentifier("MainMenuVC")
        self.navigationController!.pushViewController(vc,animated:true)
        
        
    }
    
    //test alert
    
    func displayAlertMessage(UserMessage :String)
    {
        let alert = UIAlertController (title: "Error", message: UserMessage, preferredStyle: UIAlertControllerStyle.Alert);
        let passCondition = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil);
        alert.addAction(passCondition)
        self.presentViewController (alert, animated : true, completion: nil);
    }
    
}