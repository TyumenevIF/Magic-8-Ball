//
//  MainView.swift
//  Dicee
//
//  Created by Ilyas Tyumenev on 11.04.2023.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func mainView(_ view: MainView, askButtonPressed button: UIButton)
}

class MainView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    // MARK: - Private Properties
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Ask Me Anything"
        label.font = UIFont(name: "HelveticaNeue", size: 40)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var askButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ask", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 50)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setSubviews() {
        addSubview(backgroundImageView)
        addSubview(label)
        addSubview(imageView)
        addSubview(askButton)
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }

        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(124)
            make.centerX.equalToSuperview()
            make.width.equalTo(303)
            make.height.equalTo(47)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(84)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(300)
        }
        
        askButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(69)
            make.centerX.equalToSuperview()
            make.width.equalTo(105)
            make.height.equalTo(74)
        }
    }
}

// MARK: - Target Actions
private extension MainView {
    
    @objc func rollButtonPressed(_ button: UIButton) {
        delegate?.mainView(self, askButtonPressed: button)
    }
}
