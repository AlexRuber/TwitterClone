//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire

class TweetCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var replyNumber: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favoriteCount: UILabel!
    
    var tweet: Tweet! {
        didSet {
            let data = try? Data(contentsOf: tweet.user.profImageURL)
            profileImg.image = UIImage(data: data!)
            tweetTextLabel.text = tweet.text
            username.text = tweet.user.name
            screenName.text = tweet.user.screenName
            retweetCount.text = String(tweet.retweetCount)
            if let favoriteNum = (tweet.favoriteCount) {
                 favoriteCount.text = String(favoriteNum)
            } else {
                favoriteCount.text = "0"
            }
           
            createdAt.text = tweet.createdAtString
            
        }
    }
    
    // Actions
    @IBAction func didTapReply(_ sender: Any) {
        replyNumber.text = String(Int(replyNumber.text!)!+1)
    }
    @IBAction func didTapRetweet(_ sender: Any) {
        retweetCount.text = String(Int(retweetCount.text!)!+1)
    }
    @IBAction func didTapHeart(_ sender: Any) {
        favoriteCount.text = String(Int(favoriteCount.text!)!+1)
    }
    
    
    @IBOutlet weak var didTapRetweet: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
