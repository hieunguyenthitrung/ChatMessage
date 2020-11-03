//
//  MessageViewController.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/1/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import Foundation
import SDWebImage

class MessageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var tabCollectionView: UICollectionView!
    @IBOutlet weak var favoriteView: UIView!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    @IBOutlet weak var userCollectionView: UICollectionView!
    
    //------------------------------------PROPERTIES
    let COLOR_BACKGROUND = UIColor.init(displayP3Red: 249.0/255.0, green: 74.0/255.0, blue: 60.0/255.0, alpha: 1)
    
    
    let tabTitle : Array = ["Message", "Online", "Group"]
    let heightTabCell : CGFloat = 50
    let widthTabCell : CGFloat = UIScreen.main.bounds.size.width/2.5
    let tabSelected = 0
    
    var favoriteList = [User]()
    let heightFavoriteCell : CGFloat = 65
    let widthFavoriteCell : CGFloat = UIScreen.main.bounds.size.width/4.5
    
    var messageUsers = [History]()
    let heightUserCell : CGFloat = 85
    let widthUserCell : CGFloat = UIScreen.main.bounds.size.width
    
    //MARK: ------------------------------------VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //Header bar
        //For title in navigation bar
        self.navigationController?.navigationBar.barTintColor = COLOR_BACKGROUND
        self.navigationController?.view.tintColor = UIColor.white
        self.view.backgroundColor = COLOR_BACKGROUND

//        //For back button in navigation bar
        let backButton = UIBarButtonItem(image: UIImage(named: "icon_back"),
                                      style: .plain,
                                      target: navigationController,
                                      action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        //Tabbar
        self.tabView.backgroundColor = COLOR_BACKGROUND;
        
        //Favorite
        self.favoriteView.layer.cornerRadius = 40
        
        let JSON = """
        [{"userId":"U01","name": "Anna","avatar": "https://avatarfiles.alphacoders.com/161/161909.jpg"},
        {"userId": "U02","name": "Bella","avatar": "https://avatarfiles.alphacoders.com/233/233304.jpg"},
        {"userId": "U03","name": "Chrisitna","avatar": "https://james-camerons-avatar.fandom.com/wiki/Stephen_Lang?file=Lang.jpg"},
        {"userId": "U04", "name": "Tom", "avatar": "https://en.wikipedia.org/wiki/Tom_Hardy#/media/File:Tom_Hardy_by_Gage_Skidmore.jpg"},
        {"userId": "U05", "name": "Candy", "avatar": "https://avatarfiles.alphacoders.com/161/161909.jpg"},
        {"userId": "U09", "name": "Lora", "avatar": "https://avatarfiles.alphacoders.com/161/161909.jpg"},
        {"userId": "U06", "name": "Mickey", "avatar": "https://avatarfiles.alphacoders.com/161/161909.jpg"},
        {"userId": "U07", "name": "Mimi", "avatar": "https://avatarfiles.alphacoders.com/161/161909.jpg"},
        {"userId": "U08", "name": "Peter", "avatar": "https://avatarfiles.alphacoders.com/161/161909.jpg"}]
        """

        var jsonData = JSON.data(using: .utf8)!
        favoriteList = try! JSONDecoder().decode([User].self, from: jsonData)
        
        //UsersView
        self.userView.layer.cornerRadius = 40
        self.userView.layer.masksToBounds = true

        let JSON_HISTORY = """
        [   {"historyId": "H01U01", "createTime" : "20201102150000000", "loveStatus" : false, "isNew" : false, "message" : "Now start parsing the json data by the dictionary and array properties it exactly works.", "userId" : "U01"},
            {"historyId": "H02U02", "createTime" : "20201101150000000", "loveStatus" : false, "isNew" : false, "message" : "Then here how we parse that JSON.", "userId" : "U02"},
            {"historyId": "H03U03", "createTime" : "20201102150000000", "loveStatus" : false, "isNew" : false, "message" : "Browse other questions tagged. Not the answer you're looking for? ", "userId" : "U03"},
            {"historyId": "H04U04", "createTime" : "20201103150000000", "loveStatus" : false, "isNew" : false, "message" : "So, how do we parse using that?", "userId" : "U04"},
            {"historyId": "H05U05", "createTime" : "20201102150000000", "loveStatus" : false, "isNew" : false, "message" : "The Json returns the data into the dictionary and array format, so treat the json data like it, it makes you easier to understand.", "userId" : "U05"},
            {"historyId": "H06U06", "createTime" : "20201103150000000", "loveStatus" : false, "isNew" : false, "message" : "We defined a Category enum that also conforms to the Decodable protocol.", "userId" : "U06"},
            {"historyId": "H07U07", "createTime" : "20201103150000000", "loveStatus" : false, "isNew" : false, "message" : "By making use of a JSONDecoder we can make JSON parsing really simple:", "userId" : "U07"},
            {"historyId": "H08U08", "createTime" : "20201103150000000", "loveStatus" : false, "isNew" : false, "message" : "It’s not required to define each property", "userId" : "U08"},
        ]
        """
        jsonData = JSON_HISTORY.data(using: .utf8)!
        messageUsers = try! JSONDecoder().decode([History].self, from: jsonData)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        
        return UIStatusBarStyle.default
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.userCollectionView.scrollToItem(at: IndexPath(row: self.messageUsers.count - 1, section: 0), at: .bottom, animated: true)
        self.perform(#selector(addDataAfter30Seconds), with: nil, afterDelay: 30)
    }
    
    @objc func addDataAfter30Seconds(){
        let currentDate = Utils.currentDate()
        let JSON_HISTORY = """
                {"historyId": "%@", "createTime" : "%@", "loveStatus" : false, "isNew" : true, "message" : "%@ - Now start parsing the json data by the dictionary and array properties it exactly works.", "userId" : "%@"}
        """
        let number = Int.random(in: 1...9)
        let userId = String(format: "U0%d", number)
        let historyId = String(format: "H0%d%@", number,userId)
        let jsonString = String(format: JSON_HISTORY, historyId, currentDate, currentDate, userId)
        
        let jsonData = jsonString.data(using: .utf8)!
        let message = try! JSONDecoder().decode(History.self, from: jsonData)


        if let index = self.messageUsers.firstIndex(where: {$0.userId == message.userId}){
            self.messageUsers.remove(at: index)
            removeWithAnimation(updates: [index], newHistory: message)
        }else{
            messageUsers.append(message)
            self.insertWithAnimation(insertions: [self.messageUsers.count - 1])
        }

        self.perform(#selector(addDataAfter30Seconds), with: nil, afterDelay: 30)
    }
    
    func insertWithAnimation(insertions: [Int]){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.userCollectionView!.performBatchUpdates({
            self.userCollectionView.insertItems(at: insertions.map({ IndexPath(row: $0, section: 0) }))
            
        }, completion: { (Bool) in
            CATransaction.commit()
            self.userCollectionView.scrollToItem(at: IndexPath(row: self.messageUsers.count - 1, section: 0), at: .bottom, animated: true)
        })
    }
    
    func removeWithAnimation(updates: [Int], newHistory: History){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.userCollectionView!.performBatchUpdates({
            self.userCollectionView.deleteItems(at: updates.map({ IndexPath(row: $0, section: 0) }))
        }, completion: { (Bool) in
            CATransaction.commit()
            self.messageUsers.append(newHistory)
            self.insertWithAnimation(insertions: [self.messageUsers.count - 1])
            self.userCollectionView.scrollToItem(at: IndexPath(row: self.messageUsers.count - 1, section: 0), at: .bottom, animated: true)
        })
    }
    
}
