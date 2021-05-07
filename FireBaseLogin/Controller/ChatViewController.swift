//
//  ChatViewController.swift
//  FireBaseLogin
//
//  Created by Sheick on 3/29/21.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    var messages : [Message] = [Message(Sender: "ironman@avenge.com", Body: "Hi"), Message(Sender: "thor@avenge.com", Body: "Hi thee")]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    //    navigationItem.hidesBackButton = true
//        title = "Chat Screen"
    @IBAction func buttonPressed(_ sender: Any) {
        //Optional binding
        
        if let messageSender = Auth.auth().currentUser?.email, let messageBody = textField.text{
            
            db.collection("NewMessages").addDocument(data: [
                "sender" : messageSender,
                "body" : messageBody
            
            ]) { (error) in
                if let e = error {
                    print("Unsucessful")
                }else{
                    print("Successful")
                }
            }
            
            
        }
    }
 
    

    @IBAction func signOutPressed(_ sender: Any) {
        

    do {
        try Auth.auth().signOut()
        navigationController?.popToRootViewController(animated: true)
        
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
      
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ChatViewController: UITableViewDataSource{
    
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return messages.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        
        cell.textLabel?.text = messages[indexPath.row].Body
        
        return cell
        
        
    }
}
