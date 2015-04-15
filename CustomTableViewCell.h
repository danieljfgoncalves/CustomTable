//
//  CustomTableViewCell.h
//  CustomTable
//
//  Created by Daniel Goncalves on 2015-04-15.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic)IBOutlet UILabel *nameLabel;
@property (weak, nonatomic)IBOutlet UILabel *prepTimeLabel;
@property (weak, nonatomic)IBOutlet UIImageView *thumbnailImageView;

@end
