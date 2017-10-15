//
//  ViewController.swift
//  HorizontalList
//
//  Created by Matan Cohen on 10/15/17.
//  Copyright © 2017 Matan Cohen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let list = HorizontalList()
        self.view.addSubview(list)
        list.translatesAutoresizingMaskIntoConstraints = false
        
        list.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        list.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        list.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        list.heightAnchor.constraint(equalToConstant: 200).isActive = true

        list.addItem(item: HorizontalListItem(view: self.getRandonView(color: UIColor.green) , uniqKey: "1"))
        list.addItem(item: HorizontalListItem(view: self.getRandonView(color: UIColor.blue), uniqKey: "2"))
        list.addItem(item: HorizontalListItem(view: self.getRandonView(color: UIColor.yellow) , uniqKey: "3"))
        list.addItem(item: HorizontalListItem(view: self.getRandonView(color: UIColor.brown), uniqKey: "4"))
        list.addItem(item: HorizontalListItem(view: self.getRandonView(color: UIColor.purple), uniqKey: "5"))

        
        list.didTapCallback { (item) in
            print(item)
        }
    }
    
    private func getRandonView(color: UIColor)->UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        view.backgroundColor = color
        return view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

