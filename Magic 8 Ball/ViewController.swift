//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Ilyas Tyumenev on 02.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Private Properties
    private let mainView = MainView()
    
    let ballArray = [#imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball2.png"), #imageLiteral(resourceName: "ball3.png"), #imageLiteral(resourceName: "ball4.png"), #imageLiteral(resourceName: "ball5.png")]
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        setSubviews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setSubviews() {
        view.addSubview(mainView)
    }
    
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - MainViewDelegate
extension ViewController: MainViewDelegate {
    
    func mainView(_ view: MainView, askButtonPressed button: UIButton) {
        mainView.imageView.image = ballArray.randomElement()
    }
}
