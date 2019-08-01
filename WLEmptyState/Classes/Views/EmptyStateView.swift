//
//  EmptyStateView.swift
//  WLEmptyState
//
//  Created by Jorge Ovalle on 12/6/18.
//  Copyright © 2018 Wizeline. All rights reserved.
//

import Foundation
import UIKit

final class EmptyStateView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageContainer, titleLabel, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var imageContainer: UIView = {
        let view = UIView()
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.heightAnchor.constraint(equalTo: imageView.heightAnchor)])
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .white
        label.textAlignment = .center
        return  label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return  label
    }()
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    private lazy var containerView: UIView = {
        let containerView = UIView(frame: .zero)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return  containerView
    }()
    
    var image: UIImage? {
        didSet {
            self.imageView.image = image
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(containerView)
        
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            containerView.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
    
    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.frame = self.superview?.bounds ?? .zero
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum DefaultConstants {
        static let image = "Empty"
        static let title = "Empty DataSet"
        static let description = "Oops There's no data."
    }
    
}
