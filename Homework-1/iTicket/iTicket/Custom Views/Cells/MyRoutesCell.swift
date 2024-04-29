//
//  MyRoutesCell.swift
//  iTicket
//
//  Created by Mert Ozseven on 28.04.2024.
//

import UIKit

class MyRoutesCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "MyRoutesCell"
    
    private let padding: CGFloat = 16
    
    private var qrCodeString = ""
    
    // MARK: - UI Components
    private let containerView = ITContainerView()
    
    private let nameTitleLabel = ITLabel(
        text: "İsim",
        textAlignment: .left,
        textColor: .secondaryLabel,
        font: .preferredFont(forTextStyle: .title3)
    )
    
    private let nameLabel: ITLabel = {
        let label = ITLabel(
            text: "Kahramanmaras",
            textAlignment: .left,
            textColor: .label,
            font: .preferredFont(forTextStyle: .title2)
        )
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    private let surnameTitleLabel = ITLabel(
        text: "Soy İsim",
        textAlignment: .left,
        textColor: .secondaryLabel,
        font: .preferredFont(forTextStyle: .title3)
    )
    
    private let surnameLabel: ITLabel = {
        let label = ITLabel(
            text: "Kahramanmaras",
            textAlignment: .left,
            textColor: .label,
            font: .preferredFont(forTextStyle: .title2)
        )
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    private let busLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let departureDate: ITLabel = {
        let label = ITLabel(
            text: "dd.MM.yyyy",
            textAlignment: .center,
            textColor: .accent,
            font: .preferredFont(forTextStyle: .title3)
        )
        label.backgroundColor = UIColor(hex: "#dbdbeb", alpha: 1.0)
        label.layer.cornerRadius = 12
        
        return label
    }()
    
    private let departureHour: ITLabel = {
        let label = ITLabel(
            text: "hh:mm",
            textAlignment: .center,
            textColor: .accent,
            font: .preferredFont(forTextStyle: .title3)
        )
        label.backgroundColor = UIColor(hex: "#dbdbeb", alpha: 1.0)
        label.layer.cornerRadius = 12
        
        return label
    }()
    
    private let fromLabel = ITLabel(
        text: "Kahramanmaras",
        textAlignment: .center,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title3)
    )

    
    private let toLabel = ITLabel(
        text: "Kahramanmaras",
        textAlignment: .center,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title3)
    )
    
    private let toIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.forward")?.withTintColor(.label)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryLabel
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let seatTitleLabel = ITLabel(
        text: "Koltuk Numarası",
        textAlignment: .left,
        textColor: .secondaryLabel,
        font: .preferredFont(forTextStyle: .title3)
    )
    
    private let seatLabel = ITLabel(
        text: "1, 2",
        textAlignment: .left,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title2)
    )

    private lazy var qrCodeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func configure(
        departureDate: String,
        departureHour: String,
        name: String,
        surname: String,
        from: String,
        to: String,
        seat: String,
        qrCodeString: String
    ) {
        self.departureDate.text = departureDate
        self.departureHour.text = departureHour
        self.nameLabel.text = name
        self.surnameLabel.text = surname
        self.fromLabel.text = from
        self.toLabel.text = to
        self.seatLabel.text = seat
        self.qrCodeString = qrCodeString
        generateQRCodeImage()
    }
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(departureDate)
        containerView.addSubview(departureHour)
        containerView.addSubview(toIcon)
        containerView.addSubview(nameTitleLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(surnameTitleLabel)
        containerView.addSubview(surnameLabel)
        containerView.addSubview(fromLabel)
        containerView.addSubview(toLabel)
        containerView.addSubview(seatTitleLabel)
        containerView.addSubview(seatLabel)
        containerView.addSubview(qrCodeImage)
    }
    
    private func configureLayout() {
        let containerViewConstraints = [
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ]
        let departureDateConstraints = [
            departureDate.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            departureDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            departureDate.heightAnchor.constraint(equalToConstant: 24),
            departureDate.widthAnchor.constraint(equalToConstant: 128)
        ]
        let departureHourConstraints = [
            departureHour.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            departureHour.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            departureHour.heightAnchor.constraint(equalToConstant: 24),
            departureHour.widthAnchor.constraint(equalToConstant: 80)
        ]
        let fromLabelConstraints = [
            fromLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            fromLabel.topAnchor.constraint(equalTo: departureDate.bottomAnchor, constant: padding),
            fromLabel.heightAnchor.constraint(equalToConstant: 50),
            fromLabel.trailingAnchor.constraint(equalTo: toIcon.leadingAnchor, constant: -padding / 4)
        ]
        let toLabelConstraints = [
            toLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            toLabel.topAnchor.constraint(equalTo: departureDate.bottomAnchor, constant: padding),
            toLabel.heightAnchor.constraint(equalToConstant: 50),
            toLabel.leadingAnchor.constraint(equalTo: toIcon.trailingAnchor, constant: padding / 2)
        ]
        let toIconConstraints = [
            toIcon.topAnchor.constraint(equalTo: departureDate.bottomAnchor, constant: padding),
            toIcon.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            toIcon.widthAnchor.constraint(equalToConstant: 64),
            toIcon.heightAnchor.constraint(equalToConstant: 50)
        ]
        let nameTitleLabelConstraints = [
            nameTitleLabel.topAnchor.constraint(equalTo: fromLabel.bottomAnchor, constant: padding),
            nameTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            nameTitleLabel.heightAnchor.constraint(equalToConstant: 24),
            nameTitleLabel.widthAnchor.constraint(equalToConstant: 64)
        ]
        let nameLabelConstraints = [
            nameLabel.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: padding / 2),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -padding / 2)
        ]
        let surnameTitleLabelConstraints = [
            surnameTitleLabel.topAnchor.constraint(equalTo: fromLabel.bottomAnchor, constant: padding),
            surnameTitleLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: padding / 2),
            surnameTitleLabel.heightAnchor.constraint(equalToConstant: 24),
            surnameTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ]
        let surnameLabelConstraints = [
            surnameLabel.topAnchor.constraint(equalTo: surnameTitleLabel.bottomAnchor, constant: padding / 2),
            surnameLabel.leadingAnchor.constraint(equalTo: surnameTitleLabel.leadingAnchor),
            surnameLabel.heightAnchor.constraint(equalToConstant: 24),
            surnameLabel.widthAnchor.constraint(equalToConstant: 200)
        ]
        let seatTitleLabelConstraints = [
            seatTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            seatTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            seatTitleLabel.heightAnchor.constraint(equalToConstant: 24),
            seatTitleLabel.widthAnchor.constraint(equalToConstant: 144)
        ]
        let seatLabelConstraints = [
            seatLabel.topAnchor.constraint(equalTo: seatTitleLabel.bottomAnchor, constant: padding / 2),
            seatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            seatLabel.heightAnchor.constraint(equalToConstant: 24),
            seatLabel.widthAnchor.constraint(equalToConstant: 144)
        ]
        let qrCodeImageConstraints = [
            qrCodeImage.topAnchor.constraint(equalTo: seatLabel.bottomAnchor, constant: padding),
            qrCodeImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            qrCodeImage.heightAnchor.constraint(equalToConstant: 128),
            qrCodeImage.widthAnchor.constraint(equalToConstant: 128)
        ]
        
        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(departureDateConstraints)
        NSLayoutConstraint.activate(departureHourConstraints)
        NSLayoutConstraint.activate(toIconConstraints)
        NSLayoutConstraint.activate(fromLabelConstraints)
        NSLayoutConstraint.activate(toLabelConstraints)
        NSLayoutConstraint.activate(nameTitleLabelConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(surnameTitleLabelConstraints)
        NSLayoutConstraint.activate(surnameLabelConstraints)
        NSLayoutConstraint.activate(seatTitleLabelConstraints)
        NSLayoutConstraint.activate(seatLabelConstraints)
        NSLayoutConstraint.activate(qrCodeImageConstraints)
    }
    
    private func configureView() {
        fromLabel.numberOfLines = 0
        toLabel.numberOfLines = 0
    }
    
    // MARK: - Private Methods
    private func generateQRCodeImage() {
        print("QR Code String: \(qrCodeString)")
        guard !qrCodeString.isEmpty else {
            print("QR Code String is empty.")
            return
        }
        guard let data = qrCodeString.data(using: String.Encoding.utf8) else {
            print("Failed to create data from qrCodeString.")
            return
        }
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else {
            print("Failed to create QR code filter.")
            return
        }
        qrFilter.setValue(data, forKey: "inputMessage")
        guard let qrImage = qrFilter.outputImage else {
            print("Failed to generate QR code image.")
            return
        }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else {
            print("Failed to create CGImage from scaled QR code image.")
            return
        }
        let processedImage = UIImage(cgImage: cgImage)
        qrCodeImage.image = processedImage
    }


}
