//
//  ViewController.m
//  LMChart
//
//  Created by linkmob on 15/12/24.
//  Copyright © 2015年 linkmob. All rights reserved.
//

#import "ViewController.h"
#import "PNChart.h"


@interface ViewController ()

@property (nonatomic,strong) PNLineChart *lineChart;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-80, 30, 160, 30 )];
    titleLabel.text = @"Line Chart Exercise";
    [self.view addSubview:titleLabel];
    

    self.lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    
    self.lineChart.yLabelFormat = @"%1.1f";
    self.lineChart.backgroundColor = [UIColor clearColor];
    [self.lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5",@"SEP 6",@"SEP 7"]];
    self.lineChart.showCoordinateAxis = YES;
    
    //Use yFixedValueMax and yFixedValueMin to Fix the Max and Min Y Value
    //Only if you needed
    self.lineChart.yFixedValueMax = 300.0;
    self.lineChart.yFixedValueMin = 0.0;
    
    [self.lineChart setYLabels:@[
                                 @"0 ",
                                 @"50 ",
                                 @"100 ",
                                 @"150 ",
                                 @"200 ",
                                 @"250 ",
                                 @"300 ",
                                
                                 ]
     ];
    
    // Line Chart #1
    NSArray * data01Array = @[@160.1, @160.1, @126.4, @0.0, @186.2, @127.2, @176.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.dataTitle = @"Alpha";
    data01.color = [UIColor redColor];
    data01.alpha = 0.6f;
    data01.itemCount = data01Array.count;
    data01.inflexionPointStyle = PNLineChartPointStyleTriangle;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    // Line Chart #2
    NSArray * data02Array = @[@0.0, @180.1, @26.4, @202.2, @126.2, @167.2, @276.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.dataTitle = @"Beta";
    data02.color = [UIColor greenColor];
    data02.alpha = 0.5f;
    data02.itemCount = data02Array.count;
    data02.inflexionPointStyle = PNLineChartPointStyleCircle;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    
    
    // Line Chart #3
    NSArray * data03Array = @[@4.0, @30.1, @176.4, @262.2, @166.2, @87.2, @236.2];
    PNLineChartData *data03 = [PNLineChartData new];
    data03.dataTitle = @"peng";
    data03.color = [UIColor blueColor];
    data03.alpha = 0.5f;
    data03.itemCount = data03Array.count;
    data03.inflexionPointStyle = PNLineChartPointStyleNone;
    data03.getData = ^(NSUInteger index) {
        CGFloat yValue = [data03Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    
    self.lineChart.chartData = @[data01, data02, data03];
    [self.lineChart strokeChart];
    //self.lineChart.delegate = self;
    
    
    [self.view addSubview:self.lineChart];
    
    
    //折线图的图例
    self.lineChart.legendStyle = PNLegendItemStyleSerial;
    self.lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    self.lineChart.legendFontColor = [UIColor darkGrayColor];
    
    UIView *legend = [self.lineChart getLegendWithMaxWidth:320];
    [legend setFrame:CGRectMake(30, 340, legend.frame.size.width-30, 40)];
//    legend.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:legend];
    
    

}



@end
