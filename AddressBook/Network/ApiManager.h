//
//  ApiManager.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/25/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "SessionManager.h"
#import "ContactListResponseModel.h"

/*! @brief Represents all API calls that my application have. */
@interface ApiManager : SessionManager

/*! @brief Get the list of contacts. */
- (NSURLSessionDataTask *) getContacts:(void (^)(ContactListResponseModel *responseModel))success failure:(void (^)(NSError *error))failure;

@end
