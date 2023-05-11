
//  ViewController.swift
//  TableView
//
//  Created by Chandrakant Shingala on 14/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrFoodItems: [FoodItem] = []
    var arrMobileItems: [MobileItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup(){
        loadFoodItem()
        loadMobileItem()
        configureTableView()
    }
    
    private func configureTableView(){
        tableView.register(UINib(nibName: "FoodItemTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodItemTableViewCell")
        tableView.separatorStyle = .none
    }
    
    private func loadFoodItem(){
        let pizza: FoodItem = FoodItem(id: 1, name: "Pizza", price: 800, discountedPrice: 776)
        let burgar: FoodItem = FoodItem(id: 1, name: "Burgar", price: 667, discountedPrice: 600)
        let meggi: FoodItem = FoodItem(id: 1, name: "Meggi", price: 60, discountedPrice: 40)
        let dhosha: FoodItem = FoodItem(id: 1, name: "Dhosha", price: 660, discountedPrice: 650)
        let frankie: FoodItem = FoodItem(id: 1, name: "Frankie", price: 100, discountedPrice: 70)
        let dabeli: FoodItem = FoodItem(id: 1, name: "Dabeli", price: 50, discountedPrice: 30)
        arrFoodItems = [pizza, burgar, meggi, dhosha, frankie, dabeli]
    }
    private func loadMobileItem(){
        let iPhoneX: MobileItem = MobileItem(id: 1, name: "iPhoneX", price: 99999, discountedPrice: 80000, releasedYear: "2009")
        let oppo: MobileItem = MobileItem(id: 1, name: "oppo", price: 9999, discountedPrice: 8000, releasedYear: "2005")
        arrMobileItems = [iPhoneX, oppo]
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? arrFoodItems.count : arrMobileItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell: FoodItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FoodItemTableViewCell") as! FoodItemTableViewCell
            let foodItem: FoodItem = arrFoodItems[indexPath.row]
            cell.nameLabel.text = foodItem.name
            cell.priceLabel.text = "$\(foodItem.price)"
            cell.quantityLabel.text = String(foodItem.quantity)
            cell.plusButton.tag = indexPath.row
            cell.minusButton.tag = indexPath.row
            cell.plusButton.addTarget(self, action: #selector(plusButtonCilcked(_:)), for: .touchUpInside)
            cell.minusButton.addTarget(self, action: #selector(minusButtonCilcked(_:)), for: .touchUpInside)
            return cell
        } else {
            let cell: UITableViewCell = UITableViewCell()
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "dfgdgfdgdfgawsedrftgyhujiwsedrftgyhusedrftgyhujzsxdcfvgbhaqwercvtbynumixcrvtgbhnjmkxsdcfvgbhnjrftgyhujiko"
            return cell
        }
    }
    
    @objc
    func plusButtonCilcked(_ addButton: UIButton){
        print("plus button click")
        arrFoodItems[addButton.tag].quantity = arrFoodItems[addButton.tag].quantity + 1
        tableView.reloadData()
    }
    
    @objc
    func minusButtonCilcked(_ minusButton: UIButton){
        print("minus button click")
        if arrFoodItems[minusButton.tag].quantity > 0{
            arrFoodItems[minusButton.tag].quantity = arrFoodItems[minusButton.tag].quantity - 1
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Food Item Header" : "Mobile Item Header"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return section == 0 ? "Food Item Footer" : "Mobile Item Footer"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
}

//struct FoodItem{
//    var id: Int
//    var name: String
//    var price: Double
//    var discountedPrice: Double
//}
//
//struct MobileItem{
//    var id: Int
//    var name: String
//    var price: Double
//    var discountedPrice: Double
//}
