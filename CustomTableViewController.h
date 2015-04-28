//
//  CustomTableViewController.h
//  CustomTable
//
//  Created by Daniel Goncalves on 2015-04-14.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomTableViewCell.h"

@interface CustomTableViewController : UITableViewController<UISearchResultsUpdating>

@property (nonatomic, strong) NSMutableArray *recipes;

@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) NSArray *searchResults;

@end
