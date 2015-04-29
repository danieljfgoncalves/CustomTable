//
//  RecipeCollectionViewController.m
//  CustomTable
//
//  Created by Daniel Goncalves on 2015-04-29.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import "RecipeCollectionViewController.h"
#import "RecipeCollectionViewCell.h"
#import "Recipe.h"
#import "DetailViewController.h"

@interface RecipeCollectionViewController ()

@end

@implementation RecipeCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    // Set a Mutable Array to store all data from plist.
    NSString *path = [[NSBundle mainBundle]pathForResource:@"recipes" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *recipeNames = [dict objectForKey:@"Name"];
    NSArray *recipeImages = [dict objectForKey:@"Image"];
    NSArray *recipePrepTimes = [dict objectForKey:@"PrepTime"];
    NSArray *recipeIngredients = [dict objectForKey:@"Ingredients"];
    
    
    
    self.recipes = [[NSMutableArray alloc]init];
    for (int i = 0; i < recipeNames.count; i++) {
        Recipe *recipeInstance = [[Recipe alloc]init];
        recipeInstance.name = recipeNames[i];
        recipeInstance.prepTime = recipePrepTimes[i];
        recipeInstance.image = recipeImages[i];
        recipeInstance.ingredients = recipeIngredients[i];
        [self.recipes addObject:recipeInstance];
    }
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.recipes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RecipeCollectionViewCell *cell = (RecipeCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Recipe *recipe = self.recipes[indexPath.row];
    
    
    // Configure the cell
    //cell.recipeIV.image = [UIImage imageNamed:@"hamburger"];
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:recipe.image]];
    image.frame = CGRectMake(0, 0, 80, 80);
    image.backgroundColor = [UIColor greenColor];
    
    [cell.contentView addSubview:image];
    
    //cell.backgroundColor = [UIColor redColor];


    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
