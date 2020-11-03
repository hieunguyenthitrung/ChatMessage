//
//  DetailMessageViewController.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/3/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import Foundation
import SDWebImage

class DetailMessageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bgTextView: UIView!
    @IBOutlet weak var historyCollectionView: UICollectionView!
    @IBOutlet weak var bottomLayoutHistoryView: NSLayoutConstraint!
    @IBOutlet weak var inputTextView: UITextView!
    
    //------------------------------------PROPERTIES
    let COLOR_BACKGROUND = UIColor.init(displayP3Red: 249.0/255.0, green: 74.0/255.0, blue: 60.0/255.0, alpha: 1)
    var histories = [History]()
    let currentUserId = "U01"
    let customFlowLayout = CustomFlowLayout()
    
    //MARK: ------------------------------------VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        //Header bar
        //For title in navigation bar
        self.navigationController?.navigationBar.barTintColor = COLOR_BACKGROUND
        self.navigationController?.view.tintColor = UIColor.white
        self.view.backgroundColor = COLOR_BACKGROUND

        
        containerView.backgroundColor = COLOR_BACKGROUND
        self.historyView.layer.cornerRadius = 40
        self.historyView.layer.masksToBounds = true
        
        self.bgTextView.layer.masksToBounds = true
        self.bgTextView.layer.cornerRadius = 20
        
        self.bottomLayoutHistoryView.constant = 30
        
        let JSON_HISTORY = """
        [   {"historyId": "H01U01", "createTime" : "20201102150000000", "loveStatus" : false, "isNew" : false, "message" : "Now start parsing the json data by the dictionary and array properties it exactly works.", "userId" : "U01"},
            {"historyId": "H02U01", "createTime" : "20201101150000000", "loveStatus" : false, "isNew" : false, "message" : "Then here how we parse that JSON.", "userId" : "U02"},
            {"historyId": "H03U01", "createTime" : "20201102150000000", "loveStatus" : false, "isNew" : false, "message" : "Browse other questions tagged. Not the answer you're looking for? ", "userId" : "U01"},
            {"historyId": "H04U01", "createTime" : "20201103150000000", "loveStatus" : false, "isNew" : false, "message" : "So, how do we parse using that?", "userId" : "U01"},
            {"historyId": "H05U01", "createTime" : "20201102150000000", "loveStatus" : false, "isNew" : false, "message" : "The Json returns the data into the dictionary and array format, so treat the json data like it, it makes you easier to understand.", "userId" : "U02"},
            {"historyId": "H06U01", "createTime" : "20201103150000000", "loveStatus" : false, "isNew" : false, "message" : "We defined a Category enum that also conforms to the Decodable protocol.", "userId" : "U02"},
            {"historyId": "H07U01", "createTime" : "20201103150000000", "loveStatus" : false, "isNew" : false, "message" : "By making use of a JSONDecoder we can make JSON parsing really simple:", "userId" : "U01"},
            {"historyId": "H08U01", "createTime" : "20201103150000000", "loveStatus" : false, "isNew" : false, "message" : "It’s not required to define each property", "userId" : "U02"},
        ]
        """
        let jsonData = JSON_HISTORY.data(using: .utf8)!
        histories = try! JSONDecoder().decode([History].self, from: jsonData)
        
        customFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // .fromContentInset is default
        customFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        customFlowLayout.minimumInteritemSpacing = 10
        customFlowLayout.minimumLineSpacing = 10

        historyCollectionView.collectionViewLayout = customFlowLayout
        historyCollectionView.contentInsetAdjustmentBehavior = .always
        
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }

    }

    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
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

    }
}


extension DetailMessageViewController {
    
    //MARK:-------------------------------TAB COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return histories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let his = self.histories[indexPath.row]
        if(his.userId == currentUserId){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryRightCollectionViewCell", for: indexPath) as! HistoryRightCollectionViewCell
            
            cell.setContentsForCell(his)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryLeftCollectionViewCell", for: indexPath) as! HistoryLeftCollectionViewCell
            
            cell.setContentsForCell(his)
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}


