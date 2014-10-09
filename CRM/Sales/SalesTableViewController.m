//
//  SalesTableViewController.m
//  CRM
//
//  Created by Diego Serrano on 10/4/14.
//  Copyright (c) 2014 diegoserranoa. All rights reserved.
//

#import "SalesTableViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface SalesTableViewController ()

@property (strong, nonatomic) NSArray *processes;

@end

@implementation SalesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *duraciones = @[
                            @"0.96",
                            @"3.85",
                            @"0.83",
                            @"0.9",
                            @"1.7",
                            @"2.32",
                            @"0.74",
                            @"0.77",
                            @"1.23",
                            @"1.02",
                            @"0.89",
                            @"3.87",
                            @"4.4",
                            @"1.76",
                            @"1.59",
                            @"1.22",
                            @"0.95",
                            @"0.62",
                            @"2.65",
                            @"1.19",
                            @"2.53",
                            @"0.74",
                            @"1.06",
                            @"1.99",
                            @"1.68",
                            @"4.18",
                            @"2.22",
                            @"4.51",
                            @"1.48"
                            ];
    NSString *funcionObjetivo = @"";
    int predecesor = 28;
    int tarea = 29;
    for (int i = 1; i <= 29; i++) {
        for (int j = 1; j <= 29; j++) {
            funcionObjetivo = [funcionObjetivo stringByAppendingString:[NSString stringWithFormat:@"X%02i%02i, ", i, j]];
        }
    }
    NSLog(@"%@", funcionObjetivo);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://teamwork.codingdiaries.com/processes" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *json = [[responseObject objectForKey:@"data"] objectForKey:@"processes"];
        self.processes = [NSArray arrayWithArray:[json allValues]];
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.processes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"salesCell" forIndexPath:indexPath];
    NSDictionary *object = [self.processes objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[object allValues] objectAtIndex:0]];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
