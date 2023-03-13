//
//  ViewController.swift
//  SparrowMarathonTask5
//
//  Created by Dmitriy Shrayber on 13.03.2023.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    lazy var button: UIButton = {
        let _button = UIButton(type: .system)
        _button.setTitle("Present", for: .normal)
        _button.tintColor = .systemBlue
        _button.addTarget(self, action: #selector(showPopover(sender: )), for: .touchUpInside)
        return _button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Task 5"

        self.view.backgroundColor = .white
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    @objc
    func showPopover(sender: UIButton) {
        let popupVC = DynamicVC()
        popupVC.preferredContentSize = CGSize(width: 300, height: 280)
        popupVC.modalPresentationStyle = .popover
        popupVC.popoverPresentationController?.sourceView = button
        popupVC.popoverPresentationController?.sourceRect = CGRect(x: 50, y: 30, width: 0, height: 0)
        popupVC.popoverPresentationController?.delegate = self
        present(popupVC, animated: true, completion: nil)
        }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
       return .none
    }
}

