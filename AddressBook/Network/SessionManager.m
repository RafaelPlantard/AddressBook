//
//  SessionManager.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/25/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "SessionManager.h"

/*! @brief The base url for calls to API. */
static NSString *const kBaseURL = @"https://api.parse.com";

@implementation SessionManager

- (id) init {
    self = [super initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    return self;
}

+ (id)sharedManager {
    static SessionManager *_sessionManager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sessionManager = [SessionManager new];
    });
    
    return _sessionManager;
}

@end
