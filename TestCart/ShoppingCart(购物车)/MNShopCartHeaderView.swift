//
//  MNShopCartHeaderView.swift
//  ManNiu
//
//  Created by jiang on 16/11/17.
//  Copyright © 2016年 网无际. All rights reserved.
//

import UIKit

class MNShopCartHeaderView: UIView {

    @IBOutlet weak var choseButton: UIButton!
    @IBOutlet weak var productNameLabel: UILabel!
    
    weak var vm: MNShoppingCartViewModel!
    var cm: CartManagerModel?
    var model: MNGetCartStoreItemModel? {
        didSet {
            if let tempModel = model, tempCM = cm {
                choseButton.selected = tempCM.selected
                choseButton.backgroundColor = choseButton.selected ? UIColor.redColor() : UIColor.clearColor()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        let first = NSBundle.mainBundle().loadNibNamed("MNShopCartHeaderView", owner: self, options: nil)?.last as! UIView
        first.frame = CGRectMake(0, 0, frame.width, frame.height)
        self.addSubview(first)
        
        weak var weakself = self
        choseButton.setBlockForControlEvents(.TouchUpInside) { (btn) in
            let temp = btn as! UIButton
            if let tempModel = weakself?.model {
                weakself?.vm.storeSelect(tempModel, isSelect: !temp.selected)
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
