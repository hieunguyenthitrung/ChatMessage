//
//  DetailViewController.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen Thi Trung on 5/22/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var detailTableView: UITableView!
    var followers = [Users]()
    var currentUser : Users?
    var info = [NSDictionary]()
    var followerCount = 0
    var hiddenSections = Set<Int>()
    
    //MARK: String
    let SECTION1 = "Information"
    let SECTION2 = "Followers"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = self.currentUser!.login
        
        self.hiddenSections.insert(0)
        self.hiddenSections.insert(1)
        self.getUserInformation()
        self.getFollowers()
    }
    
    @objc
    func getUserInformation() {
        LibraryAPI.sharedInstance.getUserInformation(userURL: self.currentUser!.url!, callBack: { (data, Message) -> Void in
            if(data != nil){
                let user = try! JSONDecoder().decode(UserInfo.self, from: data as! Data )
                if user.name != nil{
                    self.info.append(NSDictionary(objects: [user.name!], forKeys: ["Name:" as NSCopying]))
                }
                if user.company != nil{
                    self.info.append(NSDictionary(objects: [user.company!], forKeys: ["Company:" as NSCopying]))
                }
                if user.location != nil{
                    self.info.append(NSDictionary(objects: [user.location!], forKeys: ["Location:" as NSCopying]))
                }
                if user.blog != nil{
                    self.info.append(NSDictionary(objects: [user.blog!], forKeys: ["Blog:" as NSCopying]))
                }
                self.followerCount = user.followers
                DispatchQueue.main.async {
                    self.detailTableView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: .automatic)
                }
                
            }else{
                let alert = UIAlertController(title: nil, message: Message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    @objc
    func getFollowers() {
        LibraryAPI.sharedInstance.getFollowers(followersURL: self.currentUser!.followers_url!, callBack: { (data, Message) -> Void in
            if(data != nil){
                self.followers = try! JSONDecoder().decode([Users].self, from: data as! Data )
                DispatchQueue.main.async {
                    self.detailTableView.reloadSections(NSIndexSet(index: 1) as IndexSet, with: .automatic)
                }
                
            }else{
                let alert = UIAlertController(title: nil, message: Message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    @objc
    private func hideSection(sender: UIButton) {
        let section = sender.tag
        var indexPaths = [IndexPath]()
        if(section == 0){
            for row in 0..<self.info.count {
                indexPaths.append(IndexPath(row: row, section: section))
            }
        }else{
            for row in 0..<self.followers.count + 1{
                indexPaths.append(IndexPath(row: row, section: section))
            }
        }

        if !self.hiddenSections.contains(section){
            self.hiddenSections.insert(section)
            self.detailTableView.insertRows(at: indexPaths, with: .fade)
        } else {
            self.hiddenSections.remove(section)
            self.detailTableView.deleteRows(at: indexPaths, with: .fade)
        }
    }
    
    // MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let sectionButton = UIButton()
        if(section == 0){
            sectionButton.setTitle(SECTION1,for: .normal)
        }else{
            sectionButton.setTitle(SECTION2,for: .normal)
        }
        sectionButton.backgroundColor = .systemBlue
        sectionButton.tag = section
        sectionButton.addTarget(self, action: #selector(self.hideSection(sender:)), for: .touchUpInside)
        return sectionButton
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            if !self.hiddenSections.contains(section) {
                return 0
            }
            return self.info.count
        }else{
            if !self.hiddenSections.contains(section) {
                return 0
            }
            return (followers.count > 0 ? followers.count + 1 : 0)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell : InfoTableViewCell =  tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as! InfoTableViewCell
            cell.titleLabel.text = self.info[indexPath.row].allKeys[0] as? String
            cell.infoLabel.text = self.info[indexPath.row].allValues[0] as? String
            return cell
        }else{
            if(indexPath.row != followers.count){
                let cell : UserTableViewCell =  tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
                let object = self.followers[indexPath.row]
                cell.setContentsForCell(object)
                return cell
            }
            else{
                
                let cell : TextTableViewCell =  tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell") as! TextTableViewCell
                cell.numberLabel.text = "  \(self.followerCount)  "
                return cell
            }
        }
    }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

class InfoTableViewCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }
}


class TextTableViewCell : UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.numberLabel.layer.cornerRadius = 10
        self.numberLabel.layer.masksToBounds = true
        self.numberLabel.backgroundColor = .red
        self.numberLabel.textColor = .white
    }
    
}
