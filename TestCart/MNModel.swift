//
//  HLModel.swift
//  yios
//
//  Created by 江 on 16/8/2.
//  Copyright © 2016年 江. All rights reserved.
//

import Foundation

//       let dict = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
//       let model = ModelClass.model(withJSON: dict!)
//       print("l\(model!.identity.name)")
//       for item in (model?.students)! {
//           print("-->\(item.age)")
//       }

class MNModel: NSObject {

}
class MNGetCartListModel: MNModel {
    var item = [MNGetCartStoreItemModel]()
}
class MNGetCartStoreItemModel: MNModel {
    var item = [MNGetCartProductItemModel]()
}
class MNGetCartProductItemModel: MNModel {
    var title = ""
}



