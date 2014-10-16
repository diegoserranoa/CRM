//
//  SalesDetailViewController.h
//  CRM
//
//  Created by Diego Serrano on 10/15/14.
//  Copyright (c) 2014 diegoserranoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalesDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSDictionary *sale;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
