//
//  ViewController.m
//  DoorManager
//
//  Created by Kevin Wang on 2016-01-26.
//  Copyright (c) 2016 Kevin Wang. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionsManager"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dmsLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://jsonplaceholder.typicode.com/albums" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (IBAction)whoshomeButton:(id)sender {
}


@end
