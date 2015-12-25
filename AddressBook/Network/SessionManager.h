//
//  SessionManager.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/25/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "AFHTTPSessionManager.h"

/*! @brief Represents our session for access the API URLs. */
@interface SessionManager : AFHTTPSessionManager

/*! @brief Generates and manipulate our singleton to access all function of this class. */
+ (id) sharedManager;

@end
