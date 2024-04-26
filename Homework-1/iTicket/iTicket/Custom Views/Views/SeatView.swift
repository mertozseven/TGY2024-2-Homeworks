//
//  SeatView.swift
//  iTicket
//
//  Created by Mert Ozseven on 26.04.2024.
//

import UIKit

class SeatView: UIView {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
//    private let leftColumnLabel = ITLabel(text: "A", textAlignment: .center, textColor: <#T##UIColor#>, font: <#T##UIFont#>)

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
