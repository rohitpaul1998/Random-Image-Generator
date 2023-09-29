//
//  ViewController.swift
//  Random-Img
//
//  Created by Rohit Paul on 9/29/23.
//

import UIKit

class ViewController: UIViewController {
    
    // IN THIS BLOCK WE ARE SETTING THE IMAGE'S SPACE WHEREIN
    // EVERYTIME AN IMAGE APPEARS ON A TAP OF A BUTTON
    private let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.backgroundColor = .white
        return imgView
    }()
    
    
    // IN THIS BLOCK WE WILL CREATE A BUTTON
    private let btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitle("Random Image", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    
    // HERE WE CHANGE COLOR OF THE BACKGROUND EVERYTIME THE BUTTON IS CLICKED
    let colors: [UIColor] = [
        .systemBlue,
        .systemCyan,
        .systemGreen,
        .systemMint,
        .systemIndigo,
        .systemGray,
        .systemBrown,
        .systemOrange
    ]
    
    
    // IN THIS BLCOK WE ARE SETTING THE BACKGROUND OF THE VIEW TO RED
    // AND ALLOCATING A SQUARE FRAME TO TO FIT THE IMAGE AT ITS CENTER
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(imgView)
        imgView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imgView.center = view.center
        //adding asubview for button just like image
        view.addSubview(btn)
        //here we call the function we created because this is view
        getRandomImg()
        btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
    }
    
    //IN THIS BLOCK WE CREATE A FUNCTION FOR ACTION THE BUTTON MUST PERFORM
    @objc func didTapBtn() {
        getRandomImg()
        view.backgroundColor = colors.randomElement()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btn.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                           width: view.frame.size.width-60,
                           height: 55)
    }
    
    
    // BLOCK TO GET RANDOM PHOTO FROM THE WEB
    func getRandomImg() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)! //adding an exclamation so that xcode can know that the url is valid
        //here we get the contents of the url via the data
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        //here this creates the image from the data received
        imgView.image = UIImage(data: data)
        
    }


}

