//
//  ViewController.swift
//  AutocompleteSearch
//
//  Created by Aman Aggarwal on 11/04/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var txtSearchBar: UITextField!
    @IBOutlet weak var tblMedicinesList: UITableView!
    
    var mList:[String] = Array()
    var originalMedicinesList:[String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Medicines Search"
        mList.append("Amlodipine")
        mList.append("Atenolol")
        mList.append("Benazepril")
        mList.append("Bisoprolol")
        mList.append("Candesartan")
        mList.append("Captopril")
        mList.append("Carvedilol ")
        mList.append("Diltiazem")
        mList.append("Doxazosin")
        mList.append("Enalapril ")
        mList.append("Felodipine ")
        mList.append("Furosemide")
        mList.append("Hydralazine")
        mList.append("Hydrochlorothiazide ")
        mList.append("Indapamide ")
        mList.append("Irbesartan")
        mList.append("Lercanidipine")
        mList.append("Lisinipril ")
        mList.append("Losartan")
        mList.append("Manidipine")
        mList.append("Methyldopa")
        mList.append("Metoprolol")
        mList.append("Minoxidil")
        mList.append("Nicardipine")
        mList.append("Nifedipine")
        mList.append("Olmesartan ")
        mList.append("Perindopril")
        mList.append("Prazosin ")
        mList.append("Propranolol")
        mList.append("Quinapril ")
        mList.append("Ramipril ")
        mList.append("Spironolactone")
        mList.append("Telmisartan")
        mList.append("Valsartan")
        mList.append("Verapamil")
        
        for medicines in mList {
            originalMedicinesList.append(medicines)
        }

        tblMedicinesList.delegate = self
        tblMedicinesList.dataSource = self
        txtSearchBar.delegate = self
        txtSearchBar.addTarget(self, action: #selector(searchRecords(_ :)), for: .editingChanged)
    }
    
    //MARK:- UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtSearchBar.resignFirstResponder()
        return true
    }
    //MARK:- searchRecords
    @objc func searchRecords(_ textField: UITextField) {
        self.mList.removeAll()
        if textField.text?.count != 0 {
            for country in originalMedicinesList {
                if let countryToSearch = textField.text{
                    let range = country.lowercased().range(of: countryToSearch, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil {
                        self.mList.append(country)
                    }
                }
            }
        } else {
            for medicine in originalMedicinesList {
                mList.append(medicine)
            }
        }
        
        tblMedicinesList.reloadData()
    }

    
    //MARK:- UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Medicines")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Medicines")
        }
        cell?.textLabel?.text = mList[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detVC.strMedicineName = mList[indexPath.row]
        self.navigationController?.pushViewController(detVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

