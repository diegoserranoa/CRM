//
//  SalesTableViewCell.h
//  CRM
//
//  Created by Diego Serrano on 10/15/14.
//  Copyright (c) 2014 diegoserranoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *processLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end
