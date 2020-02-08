//
//  SettingsViewController.swift
//  CleanExample
//
//  Created by Chris on 06/02/2020.
//  Copyright © 2020 Chris Nevin. All rights reserved.
//

import Domain
import UIKit

class SettingsViewController: UITableViewController, SettingsViewing {
    var presenter: SettingsPresenter<SettingsViewController, SettingsCoordinator>?

    struct Item: Setting {
        let name: String
        let value: SettingValue

        init(key: String, value: SettingValue) {
            self.name = key == "notifications" ? "Enable Notifications" : "Enable Location"
            self.value = value
        }
    }

    var settings: [Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "Settings"
        tableView.register(SettingsToggleCell.self, forCellReuseIdentifier: "SettingsToggleCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.attach(view: self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter?.detach()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch settings[indexPath.row].value {
        case let .onOff(isOn, toggle):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsToggleCell", for: indexPath) as! SettingsToggleCell
            cell.bind(name: settings[indexPath.row].name, isOn: isOn, toggle: toggle)
            return cell
        }
    }
}

class SettingsToggleCell: UITableViewCell {
    private var toggle: (() -> Void)?

    func bind(name: String, isOn: Bool, toggle: @escaping () -> Void) {
        let onOff = UISwitch()
        self.toggle = toggle
        onOff.isOn = isOn
        onOff.addTarget(self, action: #selector(toggled), for: .valueChanged)
        accessoryView = onOff
        textLabel?.text = name
        selectionStyle = .none
    }

    @objc private func toggled() {
        toggle?()
    }
}
