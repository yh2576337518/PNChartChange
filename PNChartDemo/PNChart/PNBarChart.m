//
//  PNBarChart.m
//  PNChartDemo
//
//  Created by kevin on 11/7/13.
//  Copyright (c) 2013年 kevinzhow. All rights reserved.
//

#import "PNBarChart.h"
#import "PNColor.h"
#import "PNChartLabel.h"
#import "PNBar.h"

@implementation PNBarChart
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
    }
    return self;
}

-(void)setYValues:(NSArray *)yValues{
    _yValues = yValues;
    [self setYLabels:yValues];
}

-(void)setYLabels:(NSArray *)yLabels
{
    NSInteger max = 0;
    for (NSString * valueString in yLabels) {
        NSInteger value = [valueString integerValue];
        if (value > max) {
            max = value;
        }
        
    }
    
    //Min value for Y label
    if (max < 5) {
        max = 5;
    }
    _yValueMax = (int)max;
    NSLog(@"Y Max is %d", _yValueMax );
}

-(void)setXLabels:(NSArray *)xLabels{
    _xLabels = xLabels;
    _xLabelWidth = (self.frame.size.width - chartBarMargin*23)/24.00;
}

-(void)setStrokeColor:(UIColor *)strokeColor
{
	_strokeColor = strokeColor;
}

-(void)strokeChart{
    float barX = 0;
    for (int i = 0; i<_yValues.count; i++) {
        NSString *valueString = _yValues[i];
        float value = [valueString floatValue];
        float grade = (float)value / (float)100;
        PNBar *bar = [[PNBar alloc] initWithFrame:CGRectMake(barX, 0, _xLabelWidth, self.frame.size.height)];
        bar.tag = 80 + i;
        UITapGestureRecognizer *tapBar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(barTapClick:)];
        [bar addGestureRecognizer:tapBar];
        bar.barColor = _strokeColor;
        if (grade != 0) {
            bar.grade = grade;
        }
        [self addSubview:bar];
        barX = CGRectGetMaxX(bar.frame) + chartBarMargin;
    }
}

-(void)barTapClick:(UITapGestureRecognizer *)tapBar{
    NSString *valueString = _yValues[tapBar.view.tag - 80];
    float value = [valueString floatValue];
    float grade = (float)value / (float)100;
    PNBar *bar = (PNBar *)[self viewWithTag:tapBar.view.tag];
    if (bar.barColor == _strokeColor) {
        bar.barColor = [UIColor blackColor];
    }else{
        bar.barColor = _strokeColor;
    }
    if (grade != 0) {
        bar.grade = grade;
    }
}
@end
