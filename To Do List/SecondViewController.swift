//
//  SecondViewController.swift
//  To Do List
//
//  Created by Yacov Shemesh on 10/10/15.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var taskTextField: UITextField!
	
	
	@IBAction func addTaskButton(sender: AnyObject) {
		if taskTextField.text != "" {
			toDoList.append(taskTextField.text!)
			taskTextField.text = ""
			
			//Store to permanent storage
			NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		taskTextField.delegate = self
	}
	
	//Remove keyboard
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	//Remove keyboard
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		taskTextField.resignFirstResponder()
		return true
	}
}

