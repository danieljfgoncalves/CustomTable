//
//  Recipe.h
//  CustomTable
//
//  Created by Daniel Goncalves on 2015-04-15.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

//@property (strong, nonatomic)NSArray *recipeNames;
//@property (strong, nonatomic)NSArray *recipeImages;
//@property (strong, nonatomic)NSArray *prepTime;

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *image;
@property (strong, nonatomic)NSString *prepTime;

@property (strong, nonatomic)NSArray *ingredients;


@end
