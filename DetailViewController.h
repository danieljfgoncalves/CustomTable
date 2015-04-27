//
//  DetailViewController.h
//  CustomTable
//
//  Created by Daniel Goncalves on 2015-04-24.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface DetailViewController : UIViewController

//@property (nonatomic, strong) NSString *recipeName;
//@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;

@property (nonatomic, strong) NSString *prepTime;
@property (nonatomic, strong) IBOutlet UILabel *prepTimeLabel;

@property (nonatomic, strong) NSString *recipeImage;
@property (nonatomic, strong) IBOutlet UIImageView *recipeImageView;

@property (strong, nonatomic) IBOutlet UITextView *recipeIngredients;

@property (strong, nonatomic) Recipe *recipe;


@end
