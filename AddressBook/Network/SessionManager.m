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

/*! @brief The Application Identifier for this on Parse API. */
static NSString *const kApplicationId = @"SiBreOD4bO0gSQVH04j3Tm63BOPuc7Lns9QKJhzn";

/*! @brief The REST API Key for access the APIs on this Parse App. */
static NSString *const kRestApiKey = @"EJR4DAMPu5pHiS7YGUYKlX7f2flti60HyqoSNcpu";

@implementation SessionManager

- (id) init {
    self = [super initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        
        [self.requestSerializer setValue:kApplicationId forHTTPHeaderField:@"X-Parse-Application-Id"];
        [self.requestSerializer setValue:kRestApiKey forHTTPHeaderField:@"X-Parse-REST-API-Key"];
        
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
