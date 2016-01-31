//
//  RecentDoorPhotosTVC.m
//  DoorManager
//
//  Created by Kevin Wang on 2016-01-30.
//  Copyright © 2016 Kevin Wang. All rights reserved.
//

#import "RecentDoorPhotosTVC.h"
#import "PhotoFetcher.h"
#import "AFHTTPSessionManager.h"
#import "GearRefreshControl-Swift.h"

@interface RecentDoorPhotosTVC () <UIScrollViewDelegate>



@end

@implementation RecentDoorPhotosTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchPhotos];
}



- (void)fetchPhotos {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    policy.allowInvalidCertificates = YES;
    manager.securityPolicy = policy;
     
    [manager GET:JSON_URL parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        
        NSArray *photoData = (NSArray *)responseObject;
        NSLog(@"%@", photoData);
        self.photos = photoData;

        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

@end
