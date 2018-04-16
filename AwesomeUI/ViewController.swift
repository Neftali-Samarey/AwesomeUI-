//
//  ViewController.swift
//  AwesomeUI
//
//  Created by Neftali Samarey on 4/12/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//
// Setting this up for as a framework to othet apps
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    
    let testData = ["Item_1", "Item_2", "Item_3"]
    let cellId = "cell"
    
    let DashboardView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor.spanishBlue().cgColor
        return view
    }()
    
    let nextView : UIButton = {
        let button = UIButton()
        return button
    }()
    
    let OverlayView : UIView = {
        let view = UIView()
       // view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.backgroundColor = UIColor.white.cgColor
        return view
    }()
    
    let OverlayTableview : UITableView = {
        let table = UITableView(frame: .zero)
       // table.translatesAutoresizingMaskIntoConstraints = false
        table.clipsToBounds = true
        return table
    }()
    
    
    let OverviewLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "MuseoSansRounded-500", size: 40.0)
        view.textColor = UIColor.cloudsColor()
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if drawOverlayStatically() {
            // Constrain the autoulayoutview
            if self.didFinishDrawringRectagle() {
                print("Constraints set\nRect undefined now")
            }
        } else {
            print("Did not load")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        
        self.view.backgroundColor = UIColor.cloudsColor()
        
        self.view.addSubview(DashboardView)
        self.view.addSubview(OverlayView)
        self.DashboardView.addSubview(OverviewLabel)
        self.OverlayView.addSubview(OverlayTableview)
      //  self.OverlayView.addSubview(OverlayTableview)
        
        
        // Do not forget the delegates
        self.OverlayTableview.delegate = self
        self.OverlayTableview.dataSource = self
        
        self.OverlayTableview.register(CustomTableViewCell.self, forCellReuseIdentifier: cellId)
        
        
       
        self.enableConstraints()
        self.constrainDashboardComponents()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func enableConstraints() {
        DashboardView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        DashboardView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.bounds.height/2).isActive = true
        DashboardView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        DashboardView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
//        // overlay view
//
//        OverlayView.heightAnchor.constraint(equalToConstant: 500).isActive = true
//        OverlayView.widthAnchor.constraint(equalToConstant: 335).isActive = true
//        OverlayView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
//        OverlayView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 145).isActive = true
//
//        // Table view
//        OverlayTableview.topAnchor.constraint(equalTo: self.OverlayView.topAnchor, constant: 5).isActive = true
//        OverlayTableview.bottomAnchor.constraint(equalTo: self.OverlayView.bottomAnchor, constant: -5).isActive = true
//        OverlayTableview.leadingAnchor.constraint(equalTo: self.OverlayView.leadingAnchor, constant: 5).isActive = true
//        OverlayTableview.trailingAnchor.constraint(equalTo: self.OverlayView.trailingAnchor, constant: -5).isActive = true
        
        
    }
    
    // if this view is dranw statically, return true for the autolauyout to take over
    func drawOverlayStatically()-> Bool {
            //card.center.y = card.frame.height - 500
        self.OverlayView.frame = CGRect(x: 20, y: 0, width: 335, height: 500)
        self.OverlayView.center.y = OverlayView.frame.height + (500*2)
        
        UIView.animate(withDuration: 0.3) {
            self.OverlayView.frame = CGRect(x: 20, y: 300, width: 335, height: 500)
        }
        
        return true
    }
    // Animatible slider
    func didFinishDrawringRectagle()-> Bool {
        
        let setConstraints = true
        let maskAutoResize = false
        
        // overlay view
        OverlayView.translatesAutoresizingMaskIntoConstraints = maskAutoResize
        OverlayTableview.translatesAutoresizingMaskIntoConstraints = maskAutoResize
        
        OverlayView.heightAnchor.constraint(equalToConstant: 500).isActive = setConstraints
        OverlayView.widthAnchor.constraint(equalToConstant: 335).isActive = setConstraints
        OverlayView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = setConstraints
        OverlayView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 145).isActive = setConstraints
        
        // Table view
    
        OverlayTableview.topAnchor.constraint(equalTo: self.OverlayView.topAnchor, constant: 5).isActive = setConstraints
        OverlayTableview.bottomAnchor.constraint(equalTo: self.OverlayView.bottomAnchor, constant: -5).isActive = setConstraints
        OverlayTableview.leadingAnchor.constraint(equalTo: self.OverlayView.leadingAnchor, constant: 5).isActive = setConstraints
        OverlayTableview.trailingAnchor.constraint(equalTo: self.OverlayView.trailingAnchor, constant: -5).isActive = setConstraints
        
        
        return true
    }
    
    
    
    
    
    internal func constrainDashboardComponents() {
        OverviewLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        OverviewLabel.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 20).isActive = true
        OverviewLabel.centerXAnchor.constraint(equalTo: self.DashboardView.centerXAnchor, constant: 100).isActive = true
        OverviewLabel.centerYAnchor.constraint(equalTo: self.DashboardView.centerYAnchor, constant: 0).isActive = true
    }
    
    
    // Table view delegates
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableViewCell
        cell.cellLabel.text = testData[indexPath.row] // index the path
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let dataSelected = testData[indexPath.row]
        OverviewLabel.text = dataSelected
        print("Selected \(testData[indexPath.row])")
        
        OverlayTableview.deselectRow(at: indexPath, animated: true)
    }
    


}

extension UIViewController {
    // Slide in UI controls
    func slideIn() {
        
    }
}

