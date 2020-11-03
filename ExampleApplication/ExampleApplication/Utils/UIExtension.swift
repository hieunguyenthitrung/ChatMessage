//
//  UIExtension.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/2/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
   
    class func HIGHLIGHT_BUTTON () -> UIColor{
        return UIColor(
            red: 255.0 / 255.0,
            green: 255.0 / 255.0,
            blue: 255.0 / 255.0,
            alpha: CGFloat(0.6)
        )
    }
    
    class func BACKGROUND_LOADING () -> UIColor{
        return UIColor(
            red: 0.0 / 255.0,
            green: 0.0 / 255.0,
            blue: 0.0 / 255.0,
            alpha: CGFloat(0.45)
        )
    }
    
    class func BACKGROUND_LOADING (_ opacity : CGFloat) -> UIColor{
        return UIColor(
            red: 0.0 / 255.0,
            green: 0.0 / 255.0,
            blue: 0.0 / 255.0,
            alpha: CGFloat(opacity)
        )
    }

    class func NORMAL_BUTTON () -> UIColor{
        return UIColor(
            red: 255.0 / 255.0,
            green: 255.0 / 255.0,
            blue: 255.0 / 255.0,
            alpha: CGFloat(0.4)
        )
    }
    
    class func Text_Unactive () -> UIColor{
        return UIColor(
            red: 0.0 / 255.0,
            green: 0.0 / 255.0,
            blue: 0.0 / 255.0,
            alpha: CGFloat(0.4)
        )
    }
    
    class func searchBar () -> UIColor{
        return UIColor(
            red: 234.0 / 255.0,
            green: 237.0 / 255.0,
            blue: 240.0 / 255.0,
            alpha: CGFloat(0.4)
        )
    }
    
    class func bgView () -> UIColor{
        return UIColor(
            red: 226.0 / 255.0,
            green: 249.0 / 255.0,
            blue: 246.0 / 255.0,
            alpha: CGFloat(1)
        )
    }
    
    class func okBgButton () -> UIColor{
        return UIColor(
            red: 62.0 / 255.0,
            green:176.0 / 255.0,
            blue: 168.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func file_search_color () -> UIColor{
        return UIColor(
            red: 127.0 / 255.0,
            green:127.0 / 255.0,
            blue: 127.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func permission3Dot () -> UIColor{
        return UIColor(
            red: 194.0 / 255.0,
            green:152.0 / 255.0,
            blue: 129.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func permission2Dot () -> UIColor{
        return UIColor(
            red: 130.0 / 255.0,
            green:140.0 / 255.0,
            blue: 158.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func bgProgress() -> UIColor{
        return UIColor(
            red: 205.0 / 255.0,
            green:236.0 / 255.0,
            blue: 209.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func sendBgButton() -> UIColor{
        return UIColor(
            red: 0.0 / 255.0,
            green:135.0 / 255.0,
            blue: 255.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func grayBean() -> UIColor{
        return UIColor(
            red: 186.0 / 255.0,
            green:192.0 / 255.0,
            blue: 193.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func greenBean() -> UIColor{
        return UIColor(
            red: 62.0 / 255.0,
            green:176.0 / 255.0,
            blue: 168.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func processBg() -> UIColor{
        return UIColor(
            red: 62.0 / 255.0,
            green:176.0 / 255.0,
            blue: 168.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func bgGrayView() -> UIColor{
        return UIColor(
            red: 236.0 / 255.0,
            green:240.0 / 255.0,
            blue: 243.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func colorTextDownload() -> UIColor{
        return UIColor(
            red: 178.0 / 255.0,
            green:183.0 / 255.0,
            blue: 184.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func colorTextDownloadDelete() -> UIColor{
        return UIColor(
            red: 255.0 / 255.0,
            green:255.0 / 255.0,
            blue: 255.0 / 255.0,
            alpha: CGFloat(0.5)
        )
    }
    
    class func colorBgDownloadDeleteDisable() -> UIColor{
        return UIColor(
            red: 105.0 / 255.0,
            green:105.0 / 255.0,
            blue: 105.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func colorBgDownloadDelete() -> UIColor{
        return UIColor(
            red: 47.0 / 255.0,
            green:60.0 / 255.0,
            blue: 67.0 / 255.0,
            alpha: CGFloat(1)
        )
    }
    
//    class func colorBgDelete() -> UIColor{
//        return UIColor(
//            red: 182.0 / 255.0,
//            green:78.0 / 255.0,
//            blue: 77.0 / 255.0,
//            alpha: CGFloat(0.7)
//        )
//    }
    
    class func colorDotTouch() -> UIColor{
        return UIColor(
            red: 244.0 / 255.0,
            green:244.0 / 255.0,
            blue: 244.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func colorDot() -> UIColor{
        return UIColor(
            red: 97.0 / 255.0,
            green:173.0 / 255.0,
            blue: 118.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func btnAgree() -> UIColor{
        return UIColor(
            red: 239.0 / 255.0,
            green:239.0 / 255.0,
            blue: 239.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func btnAgree_Active() -> UIColor{
        return UIColor(
            red: 114.0 / 255.0,
            green:195.0 / 255.0,
            blue: 126.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func btnAgree_TextColor() -> UIColor{
        return UIColor(
            red: 193.0 / 255.0,
            green:193.0 / 255.0,
            blue: 193.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func btnDisAgree() -> UIColor{
        return UIColor(
            red: 231.0 / 255.0,
            green:231.0 / 255.0,
            blue: 231.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func btnDisAgree_TextColor() -> UIColor{
        return UIColor(
            red: 159.0 / 255.0,
            green:160.0 / 255.0,
            blue: 160.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_BG () ->UIColor{
        return UIColor(
            red: 238.0 / 255.0,
            green: 238.0 / 255.0,
            blue: 238.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_EditDate () ->UIColor{
        return UIColor(
            red: 203.0 / 255.0,
            green: 203.0 / 255.0,
            blue: 203.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_GreenAddMember () ->UIColor{
        return UIColor(
            red: 31.0 / 255.0,
            green: 202.0 / 255.0,
            blue: 106.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_ButtonUpdate () ->UIColor{
        return UIColor(
            red: 181.0 / 255.0,
            green: 181.0 / 255.0,
            blue: 181.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func Color_Collaboration_Member() -> UIColor{
        return UIColor(
            red: 245.0 / 255.0,
            green:246.0 / 255.0,
            blue: 249.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_CollectionCellIcon () ->UIColor{
        return UIColor(
            red: 153.0 / 255.0,
            green: 204.0 / 255.0,
            blue: 204.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_Tabbar_Active () ->UIColor{
        return UIColor(
            red: 73.0 / 255.0,
            green: 73.0 / 255.0,
            blue: 72.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_Clear_Tabbar_Active () ->UIColor{
        return UIColor(
            red: 255.0 / 255.0,
            green: 255.0 / 255.0,
            blue: 255.0 / 255.0,
            alpha: CGFloat(0.7)
        )
    }
    
    class func COLOR_Tabbar () ->UIColor{
        return UIColor(
            red: 58.0 / 255.0,
            green: 58.0 / 255.0,
            blue: 57.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_Tabbar_New () ->UIColor{
        return UIColor(
            red: 0.0 / 255.0,
            green: 0.0 / 255.0,
            blue: 0.0 / 255.0,
            alpha: CGFloat(0.3)
        )
    }
    
    class func COLOR_Tabbar_Active_New () ->UIColor{
        return UIColor(
            red: 66.0 / 255.0,
            green: 81.0 / 255.0,
            blue: 85.0 / 255.0,
            alpha: CGFloat(0.4)
        )
    }
    
    
    
    class func COLOR_Percent() ->UIColor{
        return UIColor(
            red: 36.0 / 255.0,
            green: 36.0 / 255.0,
            blue: 35.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_LinePercent () ->UIColor{
        return UIColor(
            red: 38.0 / 255.0,
            green: 38.0 / 255.0,
            blue: 38.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_DARK_GREEN () ->UIColor{
        return UIColor(
            red: 86.0 / 255.0,
            green: 159.0 / 255.0,
            blue: 108.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func COLOR_LIGHT_GREEN () ->UIColor{
        return UIColor(
            red: 62.0 / 255.0,
            green:176.0 / 255.0,
            blue: 168.0 / 255.0,
            alpha: CGFloat(0.8)
        )
    }
    
    class func COLOR_ICONS_GREEN () ->UIColor{
        return UIColor(
            red: 157.0 / 255.0,
            green: 226.0 / 255.0,
            blue: 221.0 / 255.0,
            alpha: CGFloat(0.8)
        )
    }
    
    class func COLOR_ICONS_GRAY () ->UIColor{
        return UIColor(
            red: 230.0 / 255.0,
            green: 230.0 / 255.0,
            blue: 230.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_TEXT_ICONS () ->UIColor{
        return UIColor(
            red: 209.0 / 255.0,
            green: 209.0 / 255.0,
            blue: 209.0 / 255.0,
            alpha: CGFloat(0.8)
        )
    }
    
    class func COLOR_ICONS_TOUCH_GREEN () ->UIColor{
        return UIColor(
            red: 157.0 / 255.0,
            green: 226.0 / 255.0,
            blue: 221.0 / 255.0,
            alpha: CGFloat(0.8)
        )
    }
    
    class func COLOR_LIGHT_GREEN_NEWTOPIC () ->UIColor{
        return UIColor(
            red: 33.0 / 255.0,
            green:213.0 / 255.0,
            blue: 197.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_LIGHT_GRAY () ->UIColor{
        return UIColor(
            red: 204.0 / 255.0,
            green: 204.0 / 255.0,
            blue: 204.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_LIGHT_GRAY_NEWTOPIC () ->UIColor{
        return UIColor(
            red: 218.0 / 255.0,
            green: 218.0 / 255.0,
            blue: 218.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_CALENDAR () ->UIColor{
        return UIColor(
            red: 115.0 / 255.0,
            green: 178.0 / 255.0,
            blue: 135.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_Border_Gray () ->UIColor{
        return UIColor(
            red: 222.0 / 255.0,
            green: 221.0 / 255.0,
            blue: 218.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_Tabbar_Clear () ->UIColor{
        return UIColor(
            red: 45.0 / 255.0,
            green: 65.0 / 255.0,
            blue: 68.0 / 255.0,
            alpha: CGFloat(0.4)
        )
    }
    
    class func COLOR_Line_Tabbar () ->UIColor{
        return UIColor(
            red: 71.0 / 255.0,
            green: 188.0 / 255.0,
            blue: 90.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func COLOR_TEXT_ON () ->UIColor{
        return UIColor(
            red: 141.0 / 255.0,
            green: 202.0 / 255.0,
            blue: 138.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func COLOR_TEXT_OFF () ->UIColor{
        return UIColor(
            red: 166.0 / 255.0,
            green: 166.0 / 255.0,
            blue: 166.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    

    class func BORDER () ->UIColor{
        return UIColor(
            red: 241.0 / 255.0,
            green: 239.0 / 255.0,
            blue: 235.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func GREEN_BORDER () ->UIColor{
        return UIColor(
            red: 102.0 / 255.0,
            green: 153.0 / 255.0,
            blue: 153.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_TEXT_READ_ALL_ACTIVE () ->UIColor{
        return UIColor(
            red: 33.0 / 255.0,
            green: 213.0 / 255.0,
            blue: 197.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func COLOR_TEXT_READ_ALL_NONE_ACTIVE () ->UIColor{
        return UIColor(
            red: 67.0 / 255.0,
            green: 196.0 / 255.0,
            blue: 184.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_DONE_NONE_ACTIVE () ->UIColor{
        return UIColor(
            red: 181.0 / 255.0,
            green: 181.0 / 255.0,
            blue: 181.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_DONE_ACTIVE () ->UIColor{
        return UIColor(
            red: 44.0 / 255.0,
            green: 195.0 / 255.0,
            blue: 182.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_INVITE_NONE_ACTIVE () ->UIColor{
        return UIColor(
            red: 218.0 / 255.0,
            green: 218.0 / 255.0,
            blue: 218.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func COLOR_INVITE_ACTIVE () ->UIColor{
        return UIColor(
            red: 44.0 / 255.0,
            green: 195.0 / 255.0,
            blue: 182.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func COLOR_INVITE_SUCCESS () ->UIColor{
        return UIColor(
            red: 240.0 / 255.0,
            green: 248.0 / 255.0,
            blue: 247.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_TEXT_READ_ALL_NONE_ACTIVE_FILTER_FILE () ->UIColor{
        return UIColor(
            red: 51.0 / 255.0,
            green: 51.0 / 255.0,
            blue: 51.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    class func COLOR_TEXT_CONFIRM_ACTIVE () ->UIColor{
        return UIColor(
            red: 33.0 / 255.0,
            green: 213.0 / 255.0,
            blue: 197.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class func COLOR_TEXT_CONFIRM_NONE_ACTIVE () ->UIColor{
        return UIColor(
            red: 67.0 / 255.0,
            green: 196.0 / 255.0,
            blue: 184.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func DOT_ACTIVE () ->UIColor{
        return UIColor(
            red: 35.0 / 255.0,
            green: 212.0 / 255.0,
            blue: 190.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func DOT_UNACTIVE () ->UIColor{
        return UIColor(
            red: 72.0 / 255.0,
            green: 72.0 / 255.0,
            blue: 72.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func CELL_SELECT_PLANETLIST () ->UIColor{
        return UIColor(
            red: 46.0 / 255.0,
            green: 47.0 / 255.0,
            blue: 47.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func BORDER_SELECT_PLANETLIST () ->UIColor{
        return UIColor(
            red: 69.0 / 255.0,
            green: 189.0 / 255.0,
            blue: 174.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func CELL_MY_PLANET () ->UIColor{
        return UIColor(
            red: 93.0 / 255.0,
            green: 91.0 / 255.0,
            blue: 83.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func CELL_UNSELECT_PLANETLIST () ->UIColor{
        return UIColor(
            red: 46.0 / 255.0,
            green: 47.0 / 255.0,
            blue: 47.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func CELL_HIGHLIGHT_PLANETLIST () ->UIColor{
        return UIColor(
            red: 32.0 / 255.0,
            green: 33.0 / 255.0,
            blue: 33.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func SELECT_AVATAR () ->UIColor{
        return UIColor(
            red: 0.0 / 255.0,
            green: 0.0 / 255.0,
            blue: 0.0 / 255.0,
            alpha: CGFloat(0.6)
        )
    }
    
    class func COLOR_RED_THIN () -> UIColor {
        return UIColor(
            red: 248.0 / 255.0,
            green: 97.0 / 255.0,
            blue: 71.0 / 255.0,
            alpha: CGFloat(0.6)
        )
    }
    
    
    
    class func UNIT_COLOR_01 () -> UIColor {
        return UIColor(
            red: 243.0 / 255.0,
            green: 210.0 / 255.0,
            blue: 205.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func UNIT_COLOR_02 () -> UIColor {
        return UIColor(
            red: 195.0 / 255.0,
            green: 240.0 / 255.0,
            blue: 246.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func UNIT_COLOR_03 () -> UIColor {
        return UIColor(
            red: 214.0 / 255.0,
            green: 234.0 / 255.0,
            blue: 217.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func UNIT_COLOR_04 () -> UIColor {
        return UIColor(
            red: 211.0 / 255.0,
            green: 211.0 / 255.0,
            blue: 211.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func CLOSE_JOB_BUTTON () -> UIColor {
        return UIColor(
            red: 123.0 / 255.0,
            green: 43.0 / 255.0,
            blue: 225.0 / 255.0,
            alpha: CGFloat(0.7)
        )
    }
    
    class func POPUP_SUCCESS_COLOR () ->UIColor{
        return UIColor(
            red: 0.0 / 255.0,
            green: 0.0 / 255.0,
            blue: 0.0 / 255.0,
            alpha: CGFloat(0.85)
        )
    }
    
    class func COLOR_BLACK_BLUR () ->UIColor{
        return UIColor(
            red: 0.0 / 255.0,
            green: 0.0 / 255.0,
            blue: 0.0 / 255.0,
            alpha: CGFloat(0.5)
        )
    }
    
    class func COLOR_READ_LIST_TOPIC () ->UIColor{
        return UIColor(
            
            red: 117.0 / 255.0,
            green: 117.0 / 255.0,
            blue: 117.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_UNREAD_LIST_TOPIC () ->UIColor{
        return UIColor(
            red: 20.0 / 255.0,
            green: 20.0 / 255.0,
            blue: 20.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func COLOR_PREVIEW_HIGHLIGHT () ->UIColor{
        return UIColor(
            red: 255.0 / 255.0,
            green: 255.0 / 255.0,
            blue: 255.0 / 255.0,
            alpha: CGFloat(0.5)
        )
    }
    
    class func greenTap() -> UIColor{
        return UIColor(
            red: 33.0 / 255.0,
            green:213.0 / 255.0,
            blue: 197.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func TOPIC_STATE_RED() -> UIColor{
        return UIColor(
            red: 251.0 / 255.0,
            green:18.0 / 255.0,
            blue: 0.0 / 255.0,
            alpha: CGFloat(0.3)
        )
    }
    
    class func TOPIC_STATE_BLUE() -> UIColor{
        return UIColor(
            red: 56.0 / 255.0,
            green:202.0 / 255.0,
            blue: 228.0 / 255.0,
            alpha: CGFloat(0.3)
        )
    }
    
    class func TOPIC_STATE_GREEN() -> UIColor{
        return UIColor(
            red: 124.0 / 255.0,
            green:204.0 / 255.0,
            blue: 109.0 / 255.0,
            alpha: CGFloat(0.3)
        )
    }
    
    class func TOPIC_STATE_GRAY() -> UIColor{
        return UIColor(
            red: 169.0 / 255.0,
            green:169.0 / 255.0,
            blue: 169.0 / 255.0,
            alpha: CGFloat(0.3)
        )
    }
    
    @nonobjc class var coolGrey: UIColor {
        return UIColor(red: 164.0 / 255.0, green: 165.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0)
    }

    
   
    
    static func bma_color(_ rgb: Int) -> UIColor {
        return UIColor(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0xFF00) >> 8) / 255.0, blue: CGFloat((rgb & 0xFF)) / 255.0, alpha: 1.0)
    }
    
}

//class Color : NSObject{
//    static let title_tabbar_color_active_planet = "4fedd9"
//    static let title_tabbar_color_unactive_planet = "8e8e8e"
//
//    static let title_tabbar_color_unactive = "c5c5c5"
//    static let title_tabbar_color_active = "3eb0a8"
//}

extension UIImage {
    class func initWithColor(_ color: UIColor, rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
        color.setFill()
        UIRectFill(rect);   // Fill it with your color
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!;
    }
    
    class func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    class func imageSelection(_ TopColor: UIColor,BottomColor : UIColor, size: CGSize) -> UIImage{
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        var smallRect = CGRect()
        for index in 0..<2{
            if(index == 0){
                smallRect = CGRect(x: 0,y: 0,width: size.width,height: 4)
                context?.setFillColor(TopColor.cgColor)
                context?.fill(smallRect)
            }else{
                smallRect = CGRect(x: 0,y: 4,width: size.width,height: size.height - 4)
                context?.setFillColor(BottomColor.cgColor)
                context?.fill(smallRect)
            }
            
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    class func imageSelectionHorizontal(_ TopColor: UIColor,BottomColor : UIColor, size: CGSize) -> UIImage{
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        var smallRect = CGRect()
        for index in 0..<2{
            if(index == 0){
                smallRect = CGRect(x: 0,y: 0,width: 4,height: size.height)
                context?.setFillColor(TopColor.cgColor)
                context?.fill(smallRect)
            }else{
                smallRect = CGRect(x: 4,y: 0,width: size.width - 4,height: size.height)
                context?.setFillColor(BottomColor.cgColor)
                context?.fill(smallRect)
            }
            
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    class func CustomresizeImage(_ image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func createRadius(_ newSize:CGSize, radius:CGFloat, byRoundingCorners: UIRectCorner?)->UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        let imgRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        if let roundingCorners = byRoundingCorners{
            UIBezierPath(roundedRect: imgRect, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: radius, height: radius)).addClip()
            
        }else{
            UIBezierPath(roundedRect: imgRect, cornerRadius: radius).addClip()
        }
        self.draw(in: imgRect)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }


    class func imageWithView(_ view: UIView,color : UIColor,radius : CGFloat,selected : Bool  = false) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        let borderWidth: CGFloat = 3.0
        let borderColor = UIColor.BORDER_SELECT_PLANETLIST()
        let imgRect = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        
        color.setFill()
        
        UIRectFill(imgRect)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
       // img.createRadius(view.frame.size, radius: radius, byRoundingCorners: UIRectCorner.AllCorners)
        
        if(selected){
            let path = UIBezierPath(roundedRect: view.bounds.insetBy(dx: borderWidth / 4, dy: borderWidth / 4), cornerRadius: radius)
            let context = UIGraphicsGetCurrentContext()
            
            context?.saveGState()
            // Clip the drawing area to the path
            path.addClip()
            
            // Draw the image into the context
            img?.draw(in: view.bounds)
            context?.restoreGState()
            
            // Configure the stroke
            borderColor.setStroke()
            path.lineWidth = borderWidth
            
            // Stroke the border
            path.stroke()
            
            let roundedImage = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
            return roundedImage!.createRadius(view.frame.size, radius: radius, byRoundingCorners: UIRectCorner.allCorners)

        }else{
            UIGraphicsEndImageContext();
            return img!.createRadius(view.frame.size, radius: radius, byRoundingCorners: UIRectCorner.allCorners)
        }
    }
    
    var isPortrait:  Bool    { return size.height > size.width }
    var isLandscape: Bool    { return size.width > size.height }
    var breadth:     CGFloat { return min(size.width, size.height) }
    var breadthSize: CGSize  { return CGSize(width: breadth, height: breadth) }
    var breadthRect: CGRect  { return CGRect(origin: .zero, size: breadthSize) }
    
    func rounded(with color: UIColor, width: CGFloat) -> UIImage? {
        let bleed = breadthRect.insetBy(dx: -width, dy: -width)
        UIGraphicsBeginImageContextWithOptions(bleed.size, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let cgImage = cgImage?.cropping(to: CGRect(origin: CGPoint(
            x: isLandscape ? ((size.width-size.height)/2).rounded(.down) : 0,
            y: isPortrait  ? ((size.height-size.width)/2).rounded(.down) : 0),
                                                         size: breadthSize))
            else { return nil }
        UIBezierPath(ovalIn: CGRect(origin: .zero, size: bleed.size)).addClip()
        var strokeRect =  breadthRect.insetBy(dx: -width/2, dy: -width/2)
        strokeRect.origin = CGPoint(x: width/2, y: width/2)
        UIImage(cgImage: cgImage, scale: 1, orientation: imageOrientation).draw(in: strokeRect.insetBy(dx: width/2, dy: width/2))
        color.set()
//        let line = UIBezierPath(ovalIn: strokeRect)
//        line.lineWidth = width
//        line.stroke()
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    func createRadiusAndBorder(_ newSize:CGSize, radius:CGFloat, byRoundingCorners: UIRectCorner?)->UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        let imgRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        if let roundingCorners = byRoundingCorners{
            UIBezierPath(roundedRect: imgRect, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: radius, height: radius)).addClip()
            
        }else{
            UIBezierPath(roundedRect: imgRect, cornerRadius: radius).addClip()
        }
        self.draw(in: imgRect)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    
    
}

