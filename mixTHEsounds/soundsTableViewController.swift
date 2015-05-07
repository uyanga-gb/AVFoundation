//
//  soundsTableViewController.swift
//  mixTHEsounds
//
//  Created by uyanga on 5/6/15.
//  Copyright (c) 2015 uyanga. All rights reserved.
//

import UIKit

class soundsTableViewController: UITableViewController {
    var recSounds = [Sound]()
    
    override func viewDidLoad() {
        tableView.backgroundColor = UIColor.blackColor()
        tableView.tableFooterView = UIView(frame:CGRectZero)
        println(recSounds)
        super.viewDidLoad()
        var newSound = Sound(name: "sound1", filepath: "sound1filePath")
        recSounds.append(newSound)
        newSound = Sound(name: "sound2", filepath: "sound2filePath")
        recSounds.append(newSound)
        newSound = Sound(name: "sound3", filepath: "sound3filePath")
        recSounds.append(newSound)
        println(recSounds)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recSounds.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("soundCell", forIndexPath: indexPath) as! UITableViewCell
        var currentSound = recSounds[indexPath.row]
        cell.textLabel?.text = currentSound.name
        cell.contentView.backgroundColor = UIColor.blackColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return "RECORDED SOUNDS"
    }
   
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            recSounds.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
              println("deleting \(recSounds)")
        }    
    }

}
