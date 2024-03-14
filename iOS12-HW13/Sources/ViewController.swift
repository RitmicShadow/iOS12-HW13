//
//  ViewController.swift
//  iOS12-HW13
//
//  Created by Ден Майшев on 10.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    var models = [Section]()


//    MARK: -UI

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tabelView: UITableView = {
        let tabelView = UITableView(frame: .zero, style: .grouped)
        tabelView.register(TabelViewCell.self, forCellReuseIdentifier: TabelViewCell.identifier)
        tabelView.register(SwithTableViewCell.self, forCellReuseIdentifier: SwithTableViewCell.identifier)
        tabelView.backgroundColor = .white
        tabelView.frame = view.bounds
        tabelView.delegate = self
        tabelView.dataSource = self
        return tabelView
    }()

//    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarhy()
        setupLayout()
        configure()
    }

//    MARK: -Setups

    func setupHierarhy() {
        view.addSubview(tabelView)
        view.addSubview(titleLabel)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        ])
    }

    func configure() {
        models.append(Section(options: [
            .swithCell(model: SettingsSwithOption(
                title: "Авиарежим",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: .systemOrange,
                isOn: true
            ){
                print("Swith")
            }),
            .staticCell(model: SettingsOption(
                title: "Wi-Fi",
                icon: UIImage(systemName: "wifi"),
                iconBackgroundColor: .systemBlue
            ){
                print("Tapped")
            }),
            .staticCell(model: SettingsOption(
                title: "Bluetooth",
                icon: UIImage(systemName: "bluetooth"),
                iconBackgroundColor: .systemRed
            ){
                print("Tapped")
            }),
            .staticCell(model: SettingsOption(
                title: "Сотовая связь",
                icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                iconBackgroundColor: .systemGreen
            ){
                print("Tapped")
            }),
            .staticCell(model: SettingsOption(
                title: "Режим модема",
                icon: UIImage(systemName: "personalhotspot"),
                iconBackgroundColor: .systemGreen
            ){
                print("Tapped")
            }),
            .swithCell(model: SettingsSwithOption(
                title: "VPN",
                icon: UIImage(systemName: "house"),
                iconBackgroundColor: .systemRed, 
                isOn: false
            ){
                print("Swith")
            })
        ]))
        models.append(Section(options: [
            .staticCell(model: SettingsOption(
                title: "Уведомления",
                icon: UIImage(systemName: "wifi"),
                iconBackgroundColor: .systemBlue
            ){
                print("Tapped")
            }),
            .staticCell(model: SettingsOption(
                title: "Звуки, тактильные сигналы",
                icon: UIImage(systemName: "speaker.wave.3.fill"),
                iconBackgroundColor: .systemRed
            ){
                print("Tapped")
            }),
            .staticCell(model: SettingsOption(
                title: "Не беспокоить",
                icon: UIImage(systemName: "moon.fill"),
                iconBackgroundColor: .systemIndigo
            ){
                print("Tapped")
            }),
            .staticCell(model: SettingsOption(
                title: "Экранное время",
                icon: UIImage(systemName: "hourglass"),
                iconBackgroundColor: .systemIndigo
            ){
                print("Tapped")
            })
        ]))
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TabelViewCell.identifier,
                for: indexPath
            ) as? TabelViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        case .swithCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwithTableViewCell.identifier,
                for: indexPath
            ) as? SwithTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .swithCell(let model):
            model.handler()
        }
    }
}
