//
//  ViewController.swift
//  TechHelpApp
//
//  Created by RAY ANNE TUHY on 8/21/19.
//  Copyright © 2019 RAYE TUHY. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var textFeildTo: UITextField!
    @IBOutlet weak var textFeildSubject: UITextField!
    @IBOutlet weak var textViewBody: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func buttonHanderSendEmail(_ sender: Any) {
        let mailComposeViewController = configureMailComposer()
        let mailComposeVC = MFMailComposeViewController()
        //mailComposeVC.mailcomposeDelegate = self
        //mailComposeVc.setToReciients([self.textFeildTo.text!])
        //mailComposeVC.setSubject(self.textFeildSubject.text!)
        //
        mailComposeVC.mailComposeDelegate = self
        
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
            
        } else {
            print("Can't send email")
        }
    }
    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        //mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([self.textFeildTo.text!])
        mailComposeVC.setSubject(self.textFeildSubject.text!)
        mailComposeVC.setMessageBody(self.textViewBody.text!, isHTML: false)
        return mailComposeVC
    }
    //MARK: - MFMail compose method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Swift.Error?) {
        controller.dismiss(animated: true) { () -> Void in }
    }



}
