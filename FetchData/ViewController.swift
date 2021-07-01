//
//  ViewController.swift
//  FetchData
//
//  Created by Macbook on 30/06/2021.
//

import UIKit
struct jsondata: Codable{
    
    let name: String
    let capital: String
    let alpha3Code: String
    let alpha2Code: String
    let region: String
    let subregion: String
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    var arrdata = [jsondata]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    func getData(){
        
        
        
       let url = URL(string: "https://restcountries.eu/rest/v2/all")
        
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                self.arrdata = try JSONDecoder().decode([jsondata].self, from: data!)
                
                for myarr in self.arrdata{
                   
                    
                    DispatchQueue.main.async {
                        
                        self.tableview.reloadData()
                    }
                    
                }
                
            }catch{
                print("error found")
            }
        }.resume()
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableview.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.namelbl.text = "Name: \(arrdata[indexPath.row].name)"
        cell.capitallbl.text = "Capital: \(arrdata[indexPath.row].capital)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC: DetailViewController = self.storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        detailVC.stralpha3 = arrdata[indexPath.row].alpha3Code
        detailVC.stralpha2 = arrdata[indexPath.row].alpha2Code
        detailVC.strregion = arrdata[indexPath.row].region
        detailVC.strsubregion = arrdata[indexPath.row].subregion

        self.navigationController?.pushViewController(detailVC, animated: true)

    }

}

