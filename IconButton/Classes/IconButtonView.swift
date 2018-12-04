//
//  IconButtonView.swift
//  DiCE
//
//  Created by Luigi Aiello on 27/11/2018.
//  Copyright © 2018 Luigi Aiello. All rights reserved.
//

import UIKit

@IBDesignable
class IconButton: UIButton {
    
    // Mark - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    // Mark - Property
    
    @IBInspectable
    public var clickAlphaComponent: CGFloat = 0.6
    
    @IBInspectable
    public var title: String? {
        didSet {
            self.titleLbl.text = title
        }
    }
    
    @IBInspectable
    public var titleColor: UIColor? {
        didSet {
            self.titleLbl.textColor = titleColor
        }
    }
    
    @IBInspectable
    public var image: UIImage? {
        didSet {
            self.iconImageView.image = image
        }
    }
    
    @IBInspectable
    public var isCircle: Bool = false {
        didSet {
            self.clipsToBounds = isCircle
            self.layer.cornerRadius = isCircle ? (0.5 * self.bounds.size.width) : 0
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
    
    // Mark - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let color = self.backgroundColor else {
            return
        }
        self.backgroundColor = color.withAlphaComponent(clickAlphaComponent)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let color = self.backgroundColor else {
            return
        }
        self.backgroundColor = color.withAlphaComponent(1)
    }
    
    // Mark - Setup
    private func commonInit() {
        let bundle = Bundle(for: IconButton.self)
        bundle.loadNibNamed("IconButton", owner: self, options: nil)
//        Bundle.main.loadNibNamed("IconButton", owner: self, options: nil)

        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        addSubview(contentView)
        sendSubviewToBack(contentView)
    }
}
