//
//  DetailAccountViewController.swift
//  FellowsCC
//
//  Created by Pursuit on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import Toucan

class DetailAccountViewController: UIViewController {

    let detailView = DetailAccountView()
    var userProfile: CCUser?
    private var authservice = AppDelegate.authservice
    private var selectedImage: UIImage?
    private lazy var imagePickerController: UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.delegate = self
        return ip
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        detailView.doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        detailView.profileImage.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
        detailView.cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    @objc func profileButtonPressed() {
        var actionTitles = [String]()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionTitles = ["Photo Library", "Camera"]
        } else {
            actionTitles = ["Photo Library"]
        }
        showActionSheet(title: nil, message: nil, actionTitles: actionTitles, handlers: [{ [unowned self] photoLibraryAction in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true)
            }, { cameraAction in
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true)
            }
            ])
    }
    
    @objc func doneButtonPressed() {
        guard let profileImage = detailView.profileImage.imageView?.image?.jpegData(compressionQuality: 1.0),
            let firstName = detailView.firstName.text, !firstName.isEmpty,
            let lastName = detailView.lastName.text, !lastName.isEmpty,
            let displayName = detailView.displayName.text, !displayName.isEmpty,
            let bio = detailView.bioTextView.text, !bio.isEmpty,
            let user = authservice.getCurrentUser()
            else {return}
        StorageService.postImage(imageData: profileImage, imageName: "profileImages/" + user.uid) { [weak self] (error, imageURL) in
            if let error = error {
                self?.showAlert(title: "Error Saving Profile Photo", message: error.localizedDescription)
            } else if let imageURL = imageURL {
                DBService.firestoreDB.collection(UsersCollectionKeys.CollectionKey)
                    .document(user.uid)
                    .updateData([UsersCollectionKeys.PhotoURLKey : imageURL.absoluteString], completion: { (error) in
                        if let error = error {
                            self?.showAlert(title: "Error Saving Account Info", message: error.localizedDescription)
                        }
                    })
            }
            DBService.firestoreDB.collection(UsersCollectionKeys.CollectionKey)
                .document(user.uid)
                .updateData([UsersCollectionKeys.FirstNameKey : firstName,
                             UsersCollectionKeys.LastNameKey : lastName,
                             UsersCollectionKeys.DisplayNameKey: displayName,
                             UsersCollectionKeys.BioKey: bio], completion: { (error) in
                                if let error = error {
                                    self?.showAlert(title: "Error Saving Account Info", message: error.localizedDescription)
                                }
                })
        }
        showAlert(title: "Success", message: "Successfully saved account info")
        dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    private func updateUI() {
        if let userProfile = userProfile {
            detailView.profileImage.kf.setImage(with: URL(string: userProfile.photoURL!), for: .normal)
            detailView.firstName.text = userProfile.firstName
            detailView.lastName.text = userProfile.lastName
            detailView.displayName.text = userProfile.displayName
            detailView.bioTextView.text = userProfile.bio
        }
    }
    
    
    

    

}
extension DetailAccountViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("original image not available")
            return
        }
        let size = CGSize(width: 500, height: 500)
        let resizedImage = Toucan.Resize.resizeImage(originalImage, size: size)
        selectedImage = resizedImage
        detailView.profileImage.setImage(resizedImage, for: .normal)
        dismiss(animated: true)
    }
}
