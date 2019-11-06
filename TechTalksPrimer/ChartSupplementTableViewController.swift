//
//  ChartSupplementTableViewController.swift
//  TechTalksPrimer
//
//  Created by Nicholas Neuberger on 11/4/19.
//  Copyright © 2019 Nicholas Neuberger. All rights reserved.
//

import UIKit
import SwifterSwift

class ChartSupplementTableViewController: UITableViewController {
    
    let chartService = ChartService()
    
    var chartSupplementEditions = [Edition]()

    // Airport Charts
    // 217 - Branson airport
    // 225 - Columbia airport
    // 260 - St Louis Lambert airport
    // 269 - Washington airport
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let useCachedData = true
        
        chartService.fetchCharts(useCachedData: useCachedData) { [weak self] (chartSupplement, error) in
            guard let this = self else { return }
            
             if let error = error {
                 print("we have an error: \(error.localizedDescription)")
             }
         
             guard let chartSupplement = chartSupplement else { return }
            
//                 print("we have a chart supplement: \(chartSupplement)")

            this.chartSupplementEditions = this.filterMissouriRecords(chartSupplement: chartSupplement)
            this.tableView.reloadData()
        }
    }
    
    private func filterMissouriRecords(chartSupplement:ChartSupplement) -> [Edition] {
        
        var missouriEditions = chartSupplement.edition.filter { (edition) -> Bool in
            edition.geoname == .missouri
        }
        
        print("missouri records: \(missouriEditions)")
        return missouriEditions.removeDuplicates()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartSupplementEditions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        return withoutSwifterTableView(tableView, cellForRowAt: indexPath)
        
        return swifterTableView(tableView, cellForRowAt: indexPath)
    }
    
    /**
     * This is a standard outline of most code that's written without a nice framework that could potentially cause crashes.
     */
    private func withoutSwifterTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "ChartSupplementTableViewCell", for: indexPath) as! ChartSupplementTableViewCell
        
        // note this line could potentially crash if the row doesn't exist causing a crash.
//        let edition = self.chartSupplementEditions[indexPath.row - 6]
        let edition = self.chartSupplementEditions[indexPath.row]
                          
        cell.geoName.text = edition.geoname.toString()
        cell.pageNumber.text = edition.product.pageNumber()
        return cell
    }
    
    /**
     * This is a much easier and crash safe solution using several SwifterSwift functions to safely get objects with using force unwraps in the code
     */
    private func swifterTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // NOTE SwifterSwift easy to dequeue a cell using Generics to return a safe object that you actually need.
        let cell = tableView.dequeueReusableCell(withClass: ChartSupplementTableViewCell.self, for: indexPath)
        
        // NOTE SwifterSwift function to easily and safely get an item from a collection that returns an optional instead of a crash
        guard let edition = self.chartSupplementEditions[safe: indexPath.row] else {
           return UITableViewCell()
        }
               
        cell.geoName.text = edition.geoname.toString()
        cell.pageNumber.text = edition.product.pageNumber()

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
