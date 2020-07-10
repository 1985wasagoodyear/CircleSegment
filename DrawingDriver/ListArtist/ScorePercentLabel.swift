import UIKit

final class ScorePercentLabel: UILabel {
    
    private let circleLayer = CAShapeLayer()
    private let curveLayer = CAShapeLayer()
    
    /// starting point of internal curve
    @Percentage var start: Double = 0.0 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /// ending point of internal curve
    @Percentage var percentage: Double = 0.0 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    var lineWidth: CGFloat = 5.0 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    var fillColor: UIColor = .clear {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /// `front` is the drawn/partially-filled circle in the front, `back` is the filled circle in the back
    var strokeColor: (front: UIColor, back: UIColor) = (.red, .gray) {
        didSet {
            layoutIfNeeded()
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textAlignment = .center
        addCircleLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        textAlignment = .center
        addCircleLayers()
    }
    
    // MARK: - Lifecycle Methods
    
    override func layoutIfNeeded() {
        redrawUI()
        super.layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 1. redraw the path for the outline
        let circlePath = UIBezierPath(ovalIn: bounds)
        circleLayer.path = circlePath.cgPath
        
        // 2. redraw the path for the curve
        let height = bounds.height/2
        let centerPoint = CGPoint(x: bounds.width/2,
                                  y: height)
        let outlinePath: UIBezierPath = UIBezierPath(arcCenter: centerPoint,
                                                     radius: height,
                                                     startAngle: .zeroDegrees,
                                                     endAngle: .threeHundredSixtyDegrees,
                                                     clockwise: true)
        curveLayer.path = outlinePath.cgPath
    }
    
    // MARK: - Drawing Functions
    
    private func addCircleLayers() {
        circleLayer.addSublayer(curveLayer)
        layer.addSublayer(circleLayer)
        redrawUI()
    }
    
    private func redrawUI() {
        // redraw fill colors
        circleLayer.fillColor = fillColor.cgColor
        curveLayer.fillColor = fillColor.cgColor
        
        // redraw line widths
        circleLayer.lineWidth = lineWidth
        curveLayer.lineWidth = lineWidth
        
        // redraw stroke colors
        circleLayer.strokeColor = strokeColor.back.cgColor
        curveLayer.strokeColor = strokeColor.front.cgColor
        
        // draw curve
        curveLayer.strokeStart = CGFloat(start / 100.0)
        curveLayer.strokeEnd = CGFloat(percentage / 100.0)
        
        // set % text
        attributedText = attributedPercentString
    }
    
    var attributedPercentString: NSAttributedString {
        let string = String(format: "%.2f%%", percentage)
        let attributedStr = NSMutableAttributedString(string: string)
        let range = NSRange(location: attributedStr.length - 1, length: 1)
        let halfFont = UIFont(name: font.fontName,
                              size: font.pointSize / 2.0) as Any
        let attributes: [NSAttributedString.Key: Any] = [.baselineOffset: 5,
                                                          .font: halfFont]
        attributedStr.setAttributes(attributes, range: range)
        return attributedStr
    }
    
    // MARK: - Animation Methods
    
    func animateSpin() {
        let duration: CFTimeInterval = 1.0
        
        let fill = CABasicAnimation(keyPath: "strokeEnd")
        fill.fromValue = 0.0
        fill.toValue = 1.0
        fill.duration = duration
        fill.beginTime = 0.0
        
        let empty = CABasicAnimation(keyPath: "strokeStart")
        empty.fromValue = 0.0
        empty.toValue = 1.0
        empty.duration = 0.5
        empty.beginTime = 0.5
        
        let group = CAAnimationGroup()
        group.animations = [fill, empty]
        group.duration = duration
        
        curveLayer.add(group, forKey: "spin")
    }
    
}
