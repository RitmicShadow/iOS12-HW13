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

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGray6
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 17)
        ])
        return view
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGray6
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 17)
        ])
        return view
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
                print("Tapped Wi-Fi")
            }),
            .staticCell(model: SettingsOption(
                title: "Bluetooth",
                icon: UIImage(systemName: "bluetooth"),
                iconBackgroundColor: .systemRed
            ){
                print("Tapped Bluetooth")
            }),
            .staticCell(model: SettingsOption(
                title: "Сотовая связь",
                icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                iconBackgroundColor: .systemGreen
            ){
                print("Tapped Сотовая связь")
            }),
            .staticCell(model: SettingsOption(
                title: "Режим модема",
                icon: UIImage(systemName: "personalhotspot"),
                iconBackgroundColor: .systemGreen
            ){
                print("Tapped Режим модема")
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
        models.append(Section(options: [
            .staticCell(model: SettingsOption(
                title: "Основные", 
                icon: UIImage(systemName: "gear"),
                iconBackgroundColor: .systemGray
                ){
                    print("Tapped Основные")
                }),
            .staticCell(model: SettingsOption(
                title: "Пункт управления",
                icon: UIImage(systemName: ""),
                iconBackgroundColor: .systemGray4
                ){
                    print("Tapped Пункт управления")
                }),
            .staticCell(model: SettingsOption(
                title: "Экран и яркость",
                icon: UIImage(systemName: "sun.max.fill"),
                iconBackgroundColor: .systemBlue
                ){
                    print("Tapped Экран и яркость")
                }),
            .staticCell(model: SettingsOption(
                title: "Экран <<Домой>>",
                icon: UIImage(systemName: ""),
                iconBackgroundColor: .systemGray4
                ){
                    print("Tapped <<Домой>>")
                }),
            .staticCell(model: SettingsOption(
                title: "Универсальный доступ",
                icon: UIImage(systemName: "figure.wave.circle"),
                iconBackgroundColor: .systemBlue
                ){
                    print("Tapped Универсальный доступ")
                }),
            .staticCell(model: SettingsOption(
                title: "Обои",
                icon: UIImage(systemName: ""),
                iconBackgroundColor: .systemGray4
                ){
                    print("Tapped Обои")
                }),
            .staticCell(model: SettingsOption(
                title: "Ожидание",
                icon: UIImage(systemName: ""),
                iconBackgroundColor: .systemGray4
                ){
                    print("Tapped Ожидание")
                }),
            .staticCell(model: SettingsOption(
                title: "Siri и Поиск",
                icon: UIImage(systemName: ""),
                iconBackgroundColor: .systemGray4
                ){
                    print("Tapped Siri и Поиск")
                }),
            .staticCell(model: SettingsOption(
                title: "Face ID и код - пароль",
                icon: UIImage(systemName: "faceid"),
                iconBackgroundColor: .systemGreen
                ){
                    print("Tapped Face ID и код-пароль")
                }),
            .staticCell(model: SettingsOption(
                title: "Экстренный вызов - SOS",
                icon: UIImage(systemName: "sos"),
                iconBackgroundColor: .systemRed
                ){
                    print("Tapped Обои")
                }),
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
