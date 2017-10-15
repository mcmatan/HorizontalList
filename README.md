# HorizontalList
As it should work, simple.



Simple, basic, uses UIStackView.

Example:

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
