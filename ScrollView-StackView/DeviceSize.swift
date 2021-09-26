//
//  DeviceSize.swift
//  ScrollView-StackView
//
//  Created by Shinichiro Kudo on 2021/09/23.
//

import UIKit

struct DeviceSize {

    //画面の横サイズを取得
    static func screenWidth() -> CGFloat {
        return Double(UIScreen.main.bounds.size.width)
    }

    //画面の縦サイズを取得
    static func screenHeight() -> CGFloat {
        return Double(UIScreen.main.bounds.size.height)
    }

    static func navBarHeight(navigationController: UINavigationController) -> CGFloat {
        return navigationController.navigationBar.frame.size.height
    }

    static func tabBarHeight(tabBarController: UITabBarController) -> CGFloat {
        return tabBarController.tabBar.frame.size.height
    }

}

