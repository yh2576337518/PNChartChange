//
//  PCChartViewController.m
//  PNChartDemo
//
//  Created by kevin on 11/7/13.
//  Copyright (c) 2013年 kevinzhow. All rights reserved.
//

#import "PCChartViewController.h"
#import "PNChart.h"
@interface PCChartViewController ()
@end
@implementation PCChartViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
	PNChart * barChart = [[PNChart alloc] initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH - 20, 100.0)];
	barChart.backgroundColor = [UIColor clearColor];
	barChart.type = PNBarType;
	[barChart setYValues:@[@"0",@"10",@"10",@"10",@"10",@"10",@"5",@"10",@"10",@"10",@"0",@"10",@"5",@"0",@"10",@"0",@"0",@"0",@"5",@"10",@"0",@"10",@"0",@"10"]];
	[barChart strokeChart];
	[self.view addSubview:barChart];
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
