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
        _recipeNames = [NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast",
                         @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut",
                         @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
        
        _recipeImages = [NSMutableArray arrayWithObjects:@"egg_benedict.jpg", @"mushroom_risotto.jpg", @"full_breakfast.jpg",
                          @"hamburger.jpg", @"ham_and_egg_sandwich.jpg", @"creme_brelee.jpg",
                          @"white_chocolate_donut.jpg", @"starbucks_coffee.jpg", @"vegetable_curry.jpg",
                          @"instant_noodle_with_egg.jpg", @"noodle_with_bbq_pork.jpg",
                          @"japanese_noodle_with_pork.jpg", @"green_tea.jpg", @"thai_shrimp_cake.jpg",
                          @"angry_birds_cake.jpg", @"ham_and_cheese_panini.jpg", nil];
        
        _prepTime = [NSMutableArray arrayWithObjects:@"20 min",@"30 min",@"25 min",@"10 min",@"20 min",@"30 min",@"10 min",@"35 min",@"30 min",@"20 min",@"10 min",@"20 min",@"25 min",@"30 min",@"10 min",@"20 min", nil];
        
    }
    return self;
}
@end

