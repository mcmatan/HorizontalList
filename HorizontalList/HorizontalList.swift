//
//  HorizontalList.swift
//  HorizontalList
//
//  Created by Matan Cohen on 10/15/17.
//  Copyright © 2017 Matan Cohen. All rights reserved.
//

import Foundation
import UIKit

struct HorizontalListItem {
    let view: UIView
    let uniqKey: String
}

protocol HorizontalListType {
    func addItem(item: HorizontalListItem)
    func removeItem(item: HorizontalListItem)
}

class HorizontalList: UIView, HorizontalListType {
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private var items = [HorizontalListItem]()
    private var tapCallback: (( _ item: HorizontalListItem) -> Void)?
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.loadAllItems()
    }
    
    init(items: [HorizontalListItem]? = nil) {
        if let isItems = items {
            self.items = isItems
        }
        super.init(frame: CGRect.zero)
        self.setupView()
        self.loadAllItems()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public
    
    public func addItem(item: HorizontalListItem) {
        self.items.append(item)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
        item.view.addGestureRecognizer(tap)
        self.stackView.addArrangedSubview(item.view)
    }
    
    public func removeItem(item: HorizontalListItem) {
        if let index = self.items.index(where: {$0.uniqKey == item.uniqKey}) {
            self.items.remove(at: index)
        }
        self.stackView.removeArrangedSubview(item.view)
    }
    
    public func didTapCallback(callback: @escaping (_ item: HorizontalListItem) -> Void) {
        self.tapCallback = callback
    }
    
    //MARK: Private
    
    
    private func setupView() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
        
        self.scrollView.clipToSuper()
        self.stackView.clipToSuper()
        
        self.stackView.axis = .horizontal
        self.stackView.alignment = .fill
        
        let stretchingView = UIView()
        stretchingView.setContentHuggingPriority(UILayoutPriority(rawValue: 1), for: .horizontal)
        stretchingView.backgroundColor = UIColor.black
        stretchingView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(stretchingView)
    }
    
    private func loadAllItems() {
        self.items.forEach { [unowned self] (item: HorizontalListItem) in
            self.removeItem(item: item)
            self.addItem(item: item)
        }
    }
    
    @objc private func didTap(sender: UITapGestureRecognizer) {
        guard let isTapCallback = self.tapCallback else {
            print("Did select iten in horozontal list with no tap callback")
            return
        }
        
        let selectedView = sender.view
        self.items.forEach { (item: HorizontalListItem) in
            if (item.view == selectedView) {
                isTapCallback(item)
            }
        }
        
    }
}

extension UIView {
    func clipToSuper() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: self.superview!.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: self.superview!.rightAnchor).isActive = true
        self.topAnchor.constraint(equalTo: self.superview!.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor).isActive = true
    }
}
