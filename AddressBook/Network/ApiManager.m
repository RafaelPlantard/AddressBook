//
//  ApiManager.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/25/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ApiManager.h"

static NSString *const kContactListPath = @"/1/classes/Contact";

@implementation ApiManager

- (NSURLSessionDataTask *)getContacts:(void (^)(ContactListResponseModel *))success failure:(void (^)(NSError *))failure {
    return [self GET:kContactListPath parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
        
        NSError *error;
        
        ContactListResponseModel *list = [MTLJSONAdapter modelOfClass:[ContactListResponseModel class] fromJSONDictionary:responseDictionary error:&error];
        
        success(list);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

@end
