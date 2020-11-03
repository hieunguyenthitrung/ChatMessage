//
//  TabView_Ex.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/2/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
extension MessageViewController {
    
    //MARK:-------------------------------TAB COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == tabCollectionView){
            return self.tabTitle.count
        }else if(collectionView == userCollectionView){
            return self.messageUsers.count
        }
        else{
            return self.favoriteList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == tabCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath) as! TabCollectionViewCell
            cell.setContentsForCell(self.tabTitle[indexPath.row], index: indexPath.row)
            return cell
        }else if(collectionView == userCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell
            let his = self.messageUsers[indexPath.row]
            let index = self.favoriteList.firstIndex(where: {$0.userId == his.userId})
            cell.setContentsForCell(his, user: self.favoriteList[index!])
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionViewCell", for: indexPath) as! FavoriteCollectionViewCell
            cell.setContentsForCell(self.favoriteList[indexPath.row])
//            if(indexPath.row % 2 == 0){
//                cell.backgroundColor = .red
//            }else{
//                cell.backgroundColor = .green
//            }
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItemAtIndexPath(indexPath) as! planetCollectionCell
        if(collectionView == userCollectionView){
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let detailViewController = mainStoryBoard.instantiateViewController(withIdentifier: "DetailMessageViewController") as? DetailMessageViewController
            self.navigationController?.pushViewController(detailViewController!, animated: true)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == tabCollectionView){
            return CGSize(width: self.widthTabCell, height: self.heightTabCell)
        }else if(collectionView == userCollectionView){
            return CGSize(width: self.widthUserCell, height: self.heightUserCell)
        }
        else{
            return CGSize(width: widthFavoriteCell, height: heightFavoriteCell)
        }
    }
}




