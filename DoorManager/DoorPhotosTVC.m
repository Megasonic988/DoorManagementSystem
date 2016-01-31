//
//  DoorPhotosTVC.m
//  DoorManager
//
//  Created by Kevin Wang on 2016-01-30.
//  Copyright © 2016 Kevin Wang. All rights reserved.
//

#import "DoorPhotosTVC.h"
#import "PhotoFetcher.h"
#import "ImageViewController.h"
#import "GearRefreshControl-Swift.h"
#import "AMScrollingNavbar-Swift.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DoorPhotosTVC ()


@end

@implementation DoorPhotosTVC

- (void)setPhotos:(NSArray *)photos {
    _photos = photos;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [(ScrollingNavigationController *)self.navigationController followScrollView:self.tableView delay:50.0f];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.photos count] < 50 ? [self.photos count] : 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Photo Cell" forIndexPath:indexPath];
    
    NSDictionary *photo = self.photos[indexPath.row];
    cell.textLabel.text = [photo valueForKey:PHOTO_TIME];
    NSString *ip_address = IP_ADDRESS;
    NSString *path = [self.photos[indexPath.row] valueForKey:THUMBNAIL_URL];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", ip_address, path]];
    NSLog(@"%@%@", ip_address, path);
    [cell.imageView sd_setImageWithURL:url];
    
    return cell;
}



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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

- (void)prepareImageViewController:(ImageViewController *)ivc toDisplayPhoto:(NSDictionary *)photo
{
    NSString *ip_address = IP_ADDRESS;
    NSString *path = [photo valueForKey:PHOTO_URL];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", ip_address, path]];
    ivc.imageURL = url;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if (indexPath) {
        if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
            [self prepareImageViewController:segue.destinationViewController toDisplayPhoto:self.photos[indexPath.row]];

        }
    }
    
}


@end
