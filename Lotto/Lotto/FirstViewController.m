//
//  FirstViewController.m
//  Lotto
//
//  Created by Faraz Bhojani on 2015-06-20.
//  Copyright (c) 2015 Faraz. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic) NSMutableArray *labels;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.labels = [[NSMutableArray alloc] init];
    [self.labels addObject:self.label1];
    [self.labels addObject:self.label2];
    [self.labels addObject:self.label3];
    [self.labels addObject:self.label4];
    [self.labels addObject:self.label5];
    
    [self generateNumbers];
    
    [self.generateButton addTarget:self action:@selector(generateNumbers) forControlEvents:UIControlEventTouchUpInside];
}

//generates 5 numbers and updates the labels
-(void) generateNumbers
{
    CGPoint centre = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    CGPoint originalPos;
    
    for( UILabel *label in self.labels )
    {
        [label setText: @(rand()%40).stringValue];
        
        originalPos = label.layer.position;
        label.layer.position = centre;
        label.alpha = 0;
        
        [UIView animateWithDuration:1.0 animations:^
        {
            label.layer.position = originalPos;
            label.alpha = 1.0;
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
