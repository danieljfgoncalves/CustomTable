//
//  CustomTableViewController.m
//  CustomTable
//
//  Created by Daniel Goncalves on 2015-04-14.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import "CustomTableViewController.h"
#import "Recipe.h"
#import "DetailViewController.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController

//Recipe *myRecipes;
//BOOL recipeChecked[16];

- (void)viewDidLoad {
    [super viewDidLoad];
//    myRecipes = [[Recipe alloc]init];
    
    // Add a Search Feature
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    [self.searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    
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
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    if (self.searchController.active) {
        return self.searchResults.count;
    } else {
        return [self.recipes count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *cellIdentifier = @"Cell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //    Configure the cell...
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // initialize a recipe class at indexPath of the MutuableArray recipes.
    Recipe *recipe;
    
    if (self.searchController.active) {
        recipe = self.searchResults[indexPath.row];
    } else {
        recipe = self.recipes[indexPath.row];
    }
    
    cell.nameLabel.text = recipe.name;
    cell.thumbnailImageView.image = [UIImage imageNamed:recipe.image];
    cell.prepTimeLabel.text = recipe.prepTime;
    
//    if (recipeChecked[indexPath.row]) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    } else {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    
    return cell;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
////    NSString *selectedRecipe = [myRecipes.recipeNames objectAtIndex:indexPath.row];
////    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:selectedRecipe delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
////    
////    // Display Message
////    [messageAlert show];
////    
////    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
////    // cell.accessoryType = UITableViewCellAccessoryCheckmark;
////    
////    // Toggle Checkmark ON & OFF
////    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
////        cell.accessoryType = UITableViewCellAccessoryNone;
////    } else {
////        cell.accessoryType = UITableViewCellAccessoryCheckmark;
////    } // So if upon selection the Checkmark is there, remove it, else add it.
////    
////    [tableView deselectRowAtIndexPath:indexPath animated:YES];
////    recipeChecked[indexPath.row] = YES;
//}

//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Even if this method is empty, you can see the Delete Button as you swipe the row.
//    // Delete Method.
//    
//    
////    [myRecipes.recipeNames removeObjectAtIndex:indexPath.row];
////    [myRecipes.recipeImages removeObjectAtIndex:indexPath.row];
////    [myRecipes.prepTime removeObjectAtIndex:indexPath.row];
//    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Connecting ViewControllers with segue.
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Recipe *recipe;
        
        if (self.searchController.active) {
            recipe = self.searchResults[indexPath.row];
        } else {
            recipe = self.recipes[indexPath.row];
        }
        
        DetailViewController *destViewController = segue.destinationViewController;
        destViewController.recipe = recipe;
    }
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    [self filterContentForSearchText:self.searchController.searchBar.text];
    [self.tableView reloadData];
    
}

- (void)filterContentForSearchText:(NSString *)searchText {
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains [c]%@", searchText];
    self.searchResults = [self.recipes filteredArrayUsingPredicate:resultPredicate];
    
}







/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
