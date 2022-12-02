//
//  CreateCommentViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/29/22.
//

import UIKit
import CoreLocation
import DropDown

class CreateCommentViewController: UIViewController {

    let headerLabel = UILabel()
    let textTextView = UITextView()
    let dropDown = DropDown()
    let dropButton = UIButton()
    let saveButton = UIButton()
    let maroon = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)

    weak var delegate: CreateCommentDelegate?

    init(delegate: CreateCommentDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    var id: LoginSession?
    
    init(id: LoginSession) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    var new_location: LocationManager?
    
    init(new_location: LocationManager) {
        self.new_location = new_location
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = maroon

        headerLabel.text = "Add Comment"
        headerLabel.font = .boldSystemFont(ofSize: 20)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = .systemFont(ofSize: 20)
        headerLabel.textColor = .white
        view.addSubview(headerLabel)
        
        textTextView.text = "Insert Comment"
        textTextView.translatesAutoresizingMaskIntoConstraints = false
        textTextView.clipsToBounds = true
        textTextView.layer.cornerRadius = 5
        textTextView.backgroundColor = .white
        textTextView.font = .systemFont(ofSize: 15)
        dropDown.show();
        view.addSubview(textTextView)
        
        var rating = ""
        dropDown.anchorView = dropButton
        dropDown.dataSource = ["1","2","3","4","5"]
        dropDown.backgroundColor = .white
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            dropButton.setTitle(item + "/5", for: .normal)
            rating = item
            //TODO: send item (rating value) to backend
        }
        view.addSubview(dropDown)

        dropButton.setTitle("Rate Busyness", for: .normal)
        dropButton.translatesAutoresizingMaskIntoConstraints = false
        dropButton.setTitleColor(maroon, for: .normal)
        dropButton.backgroundColor = .white
        dropButton.layer.cornerRadius = 15
        dropButton.addTarget(self, action: #selector(showList), for: .touchUpInside)
        view.addSubview(dropButton)
        
        saveButton.setTitle("Post", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitleColor(maroon, for: .normal)
        saveButton.backgroundColor = .white
        saveButton.layer.cornerRadius = 15
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        view.addSubview(saveButton)

        setupConstraints()
    }
    
    @objc func saveAction() {
        //alert message if no rating
        let ratingTitle=dropButton.currentTitle
        
        if(ratingTitle == "Rate Busyness"){
            let invalidInputAlert = UIAlertController(title: "No Rating", message: "Please submit a busyness rating", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Invalid input alert invoked, user should submit rating")})
            invalidInputAlert.addAction(ok)
            self.present(invalidInputAlert, animated: true, completion: nil)
        }
        else{
            //TODO: send rating to backend
        }
        
//        LocationManager.shared.getUserLocation { location in
//            new_location?.locationManager(location.manager, didUpdateLocations: [location])
//            //var latitude = location.latitude
//            //var longitude = location.longitude
//        }
        
        
        LocationManager.shared.getUserLocation { location in
            var latitude = location.coordinate.latitude
            var longitude = location.coordinate.longitude
            
            
//            new_location?.locationManager(location.manager, didUpdateLocations: [location])
            //var latitude = location.latitude
            //var longitude = location.longitude
        }
        
        let text = textTextView.text!
        let user_id = id?.user_id
        
        //TODO: Uncomment
//        if let unwrappedUserId = user_id {
//            delegate?.createComment(user_id: unwrappedUserId, number: 0,text: text, latitude: latitude, longitude: longitude)
//        }

        navigationController?.popViewController(animated: true)
    }
    
    @objc func showList() {
        dropDown.show()
    }

    func setupConstraints() {
        let widthMultiplier: CGFloat = 0.75

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            textTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textTextView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            textTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier),
            textTextView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            dropButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropButton.topAnchor.constraint(equalTo: textTextView.bottomAnchor, constant: 20),
            dropButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            dropDown.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropDown.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            dropDown.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            dropDown.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier)
        ])
    }

}

protocol CreateCommentDelegate: UIViewController {
    func createComment(user_id: Int, number: Int, text: String, latitude: Float, longitude: Float)
}
