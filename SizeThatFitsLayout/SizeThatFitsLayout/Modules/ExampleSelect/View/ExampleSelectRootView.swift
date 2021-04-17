//
//  ExampleSelectRootView.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

protocol ExampleSelectRootView: UIView {
    func configure(viewModels: [ExampleSelectViewModel])
}

class ExampleSelectRootViewImpl: UIView, ExampleSelectRootView {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private var viewModels: [ExampleSelectViewModel] = []
    private let cellIdentifier = String(describing: ExampleSelectRootViewImpl.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModels: [ExampleSelectViewModel]) {
        self.viewModels = viewModels
        tableView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame.origin.x = safeAreaInsets.left
        tableView.frame.origin.y = safeAreaInsets.top
        tableView.frame.size.width = bounds.width - safeAreaInsets.left - safeAreaInsets.right
        tableView.frame.size.height = bounds.height - safeAreaInsets.top - safeAreaInsets.bottom
    }
}

extension ExampleSelectRootViewImpl: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            return UITableViewCell()
        }
        
        if #available(iOS 14, *) {
            var content = cell.defaultContentConfiguration()
            content.text = viewModels[indexPath.row].title
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = viewModels[indexPath.row].title
        }
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
}

extension ExampleSelectRootViewImpl: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModels[indexPath.row].selectionHandler()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
