//
//  DetailViewController.m
//  CustomTable
//
//  Created by Daniel Goncalves on 2015-04-24.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Set Title
    self.title = self.recipe.name;
    
    
    // Set the Label text with the selected recipe
//    self.recipeLabel.text = self.recipeName;
    self.prepTimeLabel.text = self.recipe.prepTime;
    self.recipeImageView.image = [UIImage imageNamed:self.recipe.image];
    
    // Set Ingredients
    NSMutableString *ingredientsText = [NSMutableString string];
    for (NSString *ingredient in self.recipe.ingredients) {
        [ingredientsText appendFormat:@"%@\n", ingredient];
    }
    self.recipeIngredients.text = ingredientsText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
