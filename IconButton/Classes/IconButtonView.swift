//
//  IconButtonView.swift
//  DiCE
//
//  Created by Luigi Aiello on 27/11/2018.
//  Copyright © 2018 Luigi Aiello. All rights reserved.
//

import UIKit

@IBDesignable
public class IconButton: UIButton {
    
    // MARK: - Property
    public var clickAlphaComponent: CGFloat = 0.6
    private var logoImageView: UIImageView?
    private var imageTintColorProperty: UIColor?
    private var imageSizeProperty: CGSize?

    @IBInspectable
    public var image: UIImage? {
        didSet {
            guard let newImage = image else {
                logoImageView?.removeFromSuperview()

                return
            }
            
            logoImageView = createImageView(image: newImage)
            setImageProperties(size: imageSizeProperty, color: imageTintColorProperty)
        }
    }
    
    @IBInspectable
    public var imageSize: CGSize = CGSize(width: 30, height: 30) {
        didSet {
            imageSizeProperty = imageSize
            setImageProperties(size: imageSizeProperty, color: imageTintColorProperty)
        }
    }

    @IBInspectable
    public var imageTintColor: UIColor? {
        didSet {
            imageTintColorProperty = imageTintColor
            setImageProperties(size: imageSizeProperty, color: imageTintColorProperty)
        }
    }

    @IBInspectable
    public var isCircle: Bool = false {
        didSet {
            self.clipsToBounds = isCircle
            self.layer.cornerRadius = isCircle ? (0.5 * self.frame.size.width) : 0
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = self.shadowRadius
        }
    }
    
    @IBInspectable
    public var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    
    @IBInspectable
    public var shadowOffSet: CGSize = CGSize.zero {
        didSet {
            self.layer.shadowOffset = self.shadowOffSet
        }
    }
    
    @IBInspectable
    public var shadowColor: UIColor = .clear {
        didSet {
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Touches
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let color = self.backgroundColor else {
            return
        }
        
        self.backgroundColor = color.withAlphaComponent(clickAlphaComponent)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let color = self.backgroundColor else {
            return
        }
        
        self.backgroundColor = color.withAlphaComponent(1)
    }
    
    // MARK: - Methods
    private func createImageView(image: UIImage) -> UIImageView {
        // Create Image View Programmatically
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        // Add Image View to button View
        self.addSubview(imageView)
        
        // Set Image View Constraints
        setConstraint(imageView: imageView, size: nil)
        imageView.image = image
        
        // Set Title Label Constraints
        titleLabel!.leftAnchor.constraint(greaterThanOrEqualTo: imageView.rightAnchor, constant: 16).isActive = true

        return imageView
    }
    
    private func setConstraint(imageView: UIImageView, size: CGSize?) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.removeConstraints(imageView.constraints)
        
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: size?.width ?? imageView.frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: size?.height ?? imageView.frame.height).isActive = true
    }
    
    private func setImageProperties(size: CGSize?, color: UIColor?) {
        guard let imageView = logoImageView else {
            return
        }
        
        // Size
        setConstraint(imageView: imageView, size: size)
        
        // Color
        imageView.image = imageView.image?.tinted(with: color ?? tintColor)
    }
}
