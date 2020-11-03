//
//  UserListViewController.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen Thi Trung on 5/24/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import UIKit

class UserListViewController: UITableViewController {

    var objects = [Users]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Users"
        
        self.getUsersFromAPI()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func getUsersFromAPI() {
        LibraryAPI.sharedInstance.getUsers(callBack: { (data, Message) -> Void in
            if(data != nil){
                self.objects = try! JSONDecoder().decode([Users].self, from: data as! Data )
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }else{
                let alert = UIAlertController(title: nil, message: Message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }

    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UserTableViewCell =  tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let object = self.objects[indexPath.row]
        cell.setContentsForCell(object)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailViewController = mainStoryBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        detailViewController?.currentUser = self.objects[indexPath.row]
        self.navigationController?.pushViewController(detailViewController!, animated: true)
    }
}

class UserTableViewCell : UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var widthAvatarLayoutConstraint: NSLayoutConstraint!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.avatarImageView.layer.cornerRadius = 20
        self.avatarImageView.layer.masksToBounds = true
        self.avatarImageView.backgroundColor = .lightGray
        self.avatarImageView.image = nil
        self.widthAvatarLayoutConstraint.constant = 40
    }
    
    func setContentsForCell(_ user : Users){
        self.avatarImageView.contentMode = UIView.ContentMode.scaleAspectFill
        if(user.avatar_url != nil){
            self.avatarImageView.downloaded(from:user.avatar_url!)
            self.widthAvatarLayoutConstraint.constant = 40
        }else{
            self.widthAvatarLayoutConstraint.constant = 0
        }
        self.nameLabel.text = user.login
    }
}

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self!.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

