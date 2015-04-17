//
//  CustomTableViewController.m
//  CustomTable
//
//  Created by Daniel Goncalves on 2015-04-14.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import "CustomTableViewController.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController

Recipe *myRecipes;
BOOL recipeChecked[16];

- (void)viewDidLoad {
    [super viewDidLoad];
    myRecipes = [[Recipe alloc]init];
    
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
    return [myRecipes.recipeNames count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.nameLabel.text = [myRecipes.recipeNames objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[myRecipes.recipeImages objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [myRecipes.prepTime objectAtIndex:indexPath.row];
    
    if (recipeChecked[indexPath.row]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *selectedRecipe = [myRecipes.recipeNames objectAtIndex:indexPath.row];
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:selectedRecipe delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    // Display Message
    [messageAlert show];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    // Toggle Checkmark ON & OFF
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } // So if upon selection the Checkmark is there, remove it, else add it.
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    recipeChecked[indexPath.row] = YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Even if this method is empty, you can see the Delete Button as you swipe the row.
    // Delete Method.
    
    
    [myRecipes.recipeNames removeObjectAtIndex:indexPath.row];
//    [myRecipes.recipeImages removeObjectAtIndex:indexPath.row];
//    [myRecipes.prepTime removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
