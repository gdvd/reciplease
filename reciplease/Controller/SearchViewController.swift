//
//  SearchController.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var argToSearch: UITextField!
    @IBOutlet weak var listArgumentsTextView: UITextView!
        
    private var searchModel: SearchModel!
    private let manageCoreData = ManageCoreData.shared
    
    //MARK: - Manage view
    override func viewDidLoad() {
        super.viewDidLoad()
        searchModel = SearchModel.shared
        searchModel.listArguments = []
        argToSearch.becomeFirstResponder()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        argToSearch.resignFirstResponder()
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addArgToList()
        return true
    }
    
    @IBAction func goToSearch(_ sender: UIButton) {
        if searchModel.listArguments.count != 0 {
            performSegue(withIdentifier: "segueToListRecipe", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToListRecipe" {
            let listRecipeVC = segue.destination as! ListRecipeViewController
            listRecipeVC.listArgumentsFetch = searchModel.listArguments
            
        }
    }
    
    //MARK: - Manage list
    private func addArgToList() {
        if argToSearch.text?.count != 0 {
            searchModel.addOneArg(argToSearch.text!)
            argToSearch.text = ""
            listArgumentsTextView.text = searchModel.description()
        }
    }
    @IBAction func addArg(_ sender: UIButton) {
        addArgToList()
    }
    @IBAction func clearListArg(_ sender: UIButton) {
        searchModel.clearListArg()
        listArgumentsTextView.text = ""
    }
}
