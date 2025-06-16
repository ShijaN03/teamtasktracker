import UIKit

class TaskCell: UITableViewCell {
    
    static let identifier = "TaskCell"
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let takeButton = UIButton(type: .system)
    
    private var backgroundShapeLayer: CAShapeLayer?
    
    func configure(with info: Task) {
        titleLabel.text = info.title
        descriptionLabel.text = info.description
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        isUserInteractionEnabled = true
        title()
        description()
        setUpTakeButton()
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayer() {
        backgroundShapeLayer?.removeFromSuperlayer()
        
        let layer = CAShapeLayer()
        let bazierPath = UIBezierPath(roundedRect: contentView.bounds.insetBy(dx: 10, dy: 5), cornerRadius: 20)
        layer.path = bazierPath.cgPath
        layer.fillColor = UIColor.systemGray5.cgColor
        contentView.layer.insertSublayer(layer, at: 0)
        
    }
    
    private func title() {
        
        contentView.addSubview(titleLabel)
        
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100)
        ])
    }
    
    private func description() {
        
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    private func setUpTakeButton() {
        
        contentView.addSubview(takeButton)
        
        takeButton.translatesAutoresizingMaskIntoConstraints = false
        takeButton.setTitle("Взять", for: .normal)
        NSLayoutConstraint.activate([
            takeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            takeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        ])
        
        
    }
}
