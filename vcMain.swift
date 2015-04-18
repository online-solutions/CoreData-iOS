//
//  vcMain.swift
//  CoreData
//
//  Created by KhanhPhung on 18/4/15.
//  Copyright (c) 2015 Online Solutions. All rights reserved.
//

import UIKit
import CoreData

class vcMain: UIViewController {
    
    @IBOutlet var txtUsername:UITextField!
    @IBOutlet var txtPassword:UITextField!

    @IBAction func btnSave(){
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        
        newUser.setValue("Test username", forKey: "username")
        newUser.setValue("Test password", forKey: "password")
        
        context.save(nil)
        
        println(newUser)
        println("Object saved")
    }
    
    @IBAction func btnLoad(){
        println("btnLoad clicked")
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest (entityName: "Users")
        request.returnsObjectsAsFaults = false;
        
        var results: NSArray = context.executeFetchRequest(request, error: nil)!
        
        if(results.count > 0){
            for res in results{
                println("results")
                println(res)
            }
        } else {
            println("No user return")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
