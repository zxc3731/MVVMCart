//
//  MNShoppingCartCell.swift
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
class MNShoppingCartCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var jiaButton: UIButton!
    @IBOutlet weak var jianButton: UIButton!
    @IBOutlet weak var choseButton: UIButton!
    @IBOutlet weak var numberView: UIView!
    weak var vm: MNShoppingCartViewModel!
    var cm: CartManagerItemModel?
    var model: MNGetCartProductItemModel? {
        didSet {
            if let tempModel = model, tempCM = cm {
                choseButton.selected = tempCM.selected
                choseButton.backgroundColor = choseButton.selected ? UIColor.redColor() : UIColor.clearColor()
                numberLabel.text = "\(tempCM.num)"
                
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        weak var weakself = self
        choseButton.setBlockForControlEvents(.TouchUpInside) { (btn) in
            let temp = btn as! UIButton
            if let tempModel = weakself?.model {
                weakself?.vm.productSelect(tempModel, isSelect: !temp.selected)
            }
        }
        jiaButton.setBlockForControlEvents(.TouchUpInside) { (_) in
            if let tempModel = weakself?.model {
                weakself?.vm.addProuctNum(tempModel)
            }
        }
        jianButton.setBlockForControlEvents(.TouchUpInside) { (_) in
            if let tempModel = weakself?.model {
                weakself?.vm.reduceProuctNum(tempModel)
            }
        }
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
