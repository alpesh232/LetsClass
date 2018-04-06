
import UIKit
@IBDesignable
open class LetsTextView : UITextView {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(LetsTextView.refreshPlaceholder), name: NSNotification.Name.UITextViewTextDidChange, object: self)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        NotificationCenter.default.addObserver(self, selector: #selector(LetsTextView.refreshPlaceholder), name: NSNotification.Name.UITextViewTextDidChange, object: self)
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(LetsTextView.refreshPlaceholder), name: NSNotification.Name.UITextViewTextDidChange, object: self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    fileprivate var placeholderLabel: UILabel?
    @IBInspectable  public var placeholderColor : UIColor? {
        get {
            if placeholderLabel != nil {
                return placeholderLabel!.backgroundColor
            }
            else {
                return self.textColor
            }
        }
        set {
            if placeholderLabel != nil {
                placeholderLabel!.backgroundColor = placeholderColor
            }
        }
    }
    @IBInspectable  public var placeholder : String? {
        
        get {
            return placeholderLabel?.text
        }
        
        set {
            
            if placeholderLabel == nil {
                var frm = self.bounds.insetBy(dx: 5, dy: 6)
                frm.size.height = 20
                placeholderLabel = UILabel(frame:frm)
                
                if let unwrappedPlaceholderLabel = placeholderLabel {
                    
                    unwrappedPlaceholderLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                    unwrappedPlaceholderLabel.lineBreakMode = .byWordWrapping
                    unwrappedPlaceholderLabel.numberOfLines = 0
                    unwrappedPlaceholderLabel.font = self.font
                    unwrappedPlaceholderLabel.backgroundColor = UIColor.clear
                    unwrappedPlaceholderLabel.textColor = UIColor(white: 0.7, alpha: 1.0)
                    unwrappedPlaceholderLabel.alpha = 0
                    addSubview(unwrappedPlaceholderLabel)
                }
            }
            
            placeholderLabel?.text = newValue
            refreshPlaceholder()
        }
    }
    
    func refreshPlaceholder() {
        
        if text.characters.count != 0 {
            placeholderLabel?.alpha = 0
        } else {
            placeholderLabel?.alpha = 1
        }
    }
    
    override open var text: String! {
        
        didSet {
            
            refreshPlaceholder()
            
        }
    }
    
    override open var font : UIFont? {
        
        didSet {
            
            if let unwrappedFont = font {
                placeholderLabel?.font = unwrappedFont
            } else {
                placeholderLabel?.font = UIFont.systemFont(ofSize: 12)
            }
        }
    }
    
    override open var delegate : UITextViewDelegate? {
        
        get {
            refreshPlaceholder()
            return super.delegate
        }
        
        set {
            
        }
    }
}
