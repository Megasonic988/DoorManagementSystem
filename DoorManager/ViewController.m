//
//  ViewController.m
//  DoorManager
//
//  Created by Kevin Wang on 2016-01-26.
//  Copyright (c) 2016 Kevin Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tapsCountLabel;
@property (nonatomic, readwrite) NSInteger tapsCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tapsCount = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (IBAction)tapButton:(UIButton *)sender {
    self.tapsCount++;
    self.tapsCountLabel.text = [NSString stringWithFormat:@"Taps Count: %ld", (long)self.tapsCount];
}

@end
