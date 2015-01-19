//
//  DetailTableViewController.m
//  FarminghamRisk
//
//  Created by Amogh Param on 1/18/15.
//  Copyright (c) 2015 Amogh Param. All rights reserved.
//

#import "DetailTableViewController.h"

@interface DetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleForDetail;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellForDetail;
@property (weak, nonatomic) IBOutlet UILabel *detailText;
@end

@implementation DetailTableViewController

@synthesize titleText;
@synthesize detail;
@synthesize color;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.titleForDetail.text = self.titleText;
    self.detailText.text = self.detail;
    self.cellForDetail.backgroundColor = self.color;
}

@end
