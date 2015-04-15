//
//  Recipe.m
//  CustomTable
//
//  Created by Daniel Goncalves on 2015-04-15.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

- (instancetype)init
{
    self = [super init];
    if (self) {
        _recipeNames = @[@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast",
                         @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut",
                         @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini"];
    }
    return self;
}

@end
