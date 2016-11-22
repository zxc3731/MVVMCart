//
//  MNShoppingCartViewController.swift
//  ManNiu
//
//  Created by jiang on 16/11/17.
//  Copyright © 2016年 网无际. All rights reserved.
//

import UIKit

class MNShoppingCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbv: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.settingView()
        self.vm.setting()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var vm: MNShoppingCartViewModel!
    
    init(model: MNShoppingCartViewModel) {
        super.init(nibName: "MNShoppingCartViewController", bundle: nil)
        self.vm = model
        self.vm.vc = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:- delegate回调
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerview = MNShopCartHeaderView.init(frame: CGRectMake(0, 0, 320, 50))
        headerview.vm = self.vm
        headerview.cm = self.vm.curArray[section]
        headerview.model = self.vm.modelList[section]
        return headerview
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MNShoppingCartCellID") as! MNShoppingCartCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.vm = self.vm
        cell.cm = self.vm.curArray[indexPath.section].item[indexPath.row]
        cell.model = self.vm.modelList[indexPath.section].item[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.modelList[section].item.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.vm.modelList.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 128
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction.init(style: UITableViewRowActionStyle.Destructive, title: "删除") { (action, index) in
            print("点击删除")
        }
        let edit = UITableViewRowAction.init(style: .Normal, title: "编辑") { (action, index) in
            print("点击编辑")
        }
        edit.backgroundColor = UIColor.grayColor()
        return [delete, edit]
    }
    //MARK:- selector/target 事件处理
    //MARK:- settingViw设置view
    func settingView() {
        self.tbv.delegate = self
        self.tbv.dataSource = self
        self.tbv.showsVerticalScrollIndicator = false
        self.tbv.registerNib(UINib.init(nibName: "MNShoppingCartCell", bundle: nil), forCellReuseIdentifier: "MNShoppingCartCellID")
    }
    //MARK:- 动画
    //MARK:- 设置约束/frame
    //MARK:- 数据处理
    //MARK:- 网络请求
    //MARK:- 自定义及其他方法

}
