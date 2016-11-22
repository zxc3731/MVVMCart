//
//  MNShoppingCartViewModel.swift
//  ManNiu
//
//  Created by jiang on 16/11/17.
//  Copyright © 2016年 网无际. All rights reserved.
//

import UIKit
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif
class MNShoppingCartViewModel: NSObject {
    weak var vc: MNShoppingCartViewController!
    var modelList = [MNGetCartStoreItemModel]()
    var curArray: Array<CartManagerModel> = []
    func setting() { // ViewDidLoad
        self.getCart()
    }
    dynamic func settingCurArray(model: Array<MNGetCartStoreItemModel>) {
        // !!!!!此处到时要根据服务器实际返回来设置selected字段，就是保存购物车的状态
        curArray.removeAll()
        for item in model {
            let temp = CartManagerModel()
            for (i, _) in item.item.enumerate() {
                let subtemp = CartManagerItemModel()
                subtemp.index = i
                temp.item.append(subtemp)
            }
            curArray.append(temp)
        }
    }
    //MARK:- 选择产品
    dynamic func productSelect(model: MNGetCartProductItemModel, isSelect: Bool) {
        let temp = self.getIndex(model)
        let sectionIndex = temp.0 // 查出sectionindex
        let index = temp.1 // 查出index
        
        curArray[sectionIndex].item[index].selected = isSelect
        var tempCount = 0
        for item in curArray[sectionIndex].item {
            if item.selected {
                tempCount += 1
            }
        }
        if curArray[sectionIndex].item.count == tempCount {
            curArray[sectionIndex].selected = true
        }
        else {
            curArray[sectionIndex].selected = false
        }
        self.vc.tbv.reloadData()
    }
    //MARK:- 选择店铺
    dynamic func storeSelect(model: MNGetCartStoreItemModel, isSelect: Bool) {
        let index = self.modelList.indexOf(model) ?? 0 // 查出index
        curArray[index].selected = isSelect
        for item in curArray[index].item {
            item.selected = isSelect
        }
        self.vc.tbv.reloadData()
    }
    //MARK:- +产品
    dynamic func addProuctNum(model: MNGetCartProductItemModel) {
        let temp = self.getIndex(model)
        let sectionIndex = temp.0 // 查出sectionindex
        let index = temp.1 // 查出index
        if curArray[sectionIndex].item[index].num + 1 <= 99 {
            curArray[sectionIndex].item[index].num += 1
            self.vc.tbv.reloadData()
        }
    }
    //MARK:- -产品
    dynamic func reduceProuctNum(model: MNGetCartProductItemModel) {
        let temp = self.getIndex(model)
        let sectionIndex = temp.0 // 查出sectionindex
        let index = temp.1 // 查出index
        if curArray[sectionIndex].item[index].num - 1 > 0 {
            curArray[sectionIndex].item[index].num -= 1
            self.vc.tbv.reloadData()
        }
    }
    //MARK:- 遍历
    func getIndex(model: MNGetCartProductItemModel) -> (Int, Int) {
        for (i, item) in self.modelList.enumerate() {
            for (j, subitem) in item.item.enumerate() {
                if subitem == model {
                    return (i, j)
                }
            }
        }
        return (0,0)
    }
    
    func getCart(){
        let t1 = MNGetCartProductItemModel();t1.title = "1"
        let t2 = MNGetCartProductItemModel();t2.title = "2"
        let t3 = MNGetCartProductItemModel();t3.title = "3"
        let t4 = MNGetCartProductItemModel();t4.title = "4"
        let t5 = MNGetCartProductItemModel();t5.title = "5"
        let t6 = MNGetCartProductItemModel();t6.title = "6"
        let t7 = MNGetCartProductItemModel();t7.title = "7"
        
        let temp = MNGetCartStoreItemModel();temp.item = [t1, t2]
        let temp1 = MNGetCartStoreItemModel();temp1.item = [t3, t4]
        let temp2 = MNGetCartStoreItemModel();temp2.item = [t5, t6, t7]
        
        let arr = MNGetCartListModel();arr.item = [temp, temp1, temp2]
        self.modelList = arr.item
        self.settingCurArray(arr.item)
        self.vc.tbv.reloadData()
    }
}

class CartManagerModel {
    var selected = false
    var item:[CartManagerItemModel] = []
}
class CartManagerItemModel {
    var index = -1
    var selected = false
    var num = 1
}
