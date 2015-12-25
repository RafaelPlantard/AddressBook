//
//  ContactListModel.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/25/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "MTLModel.h"
#import "ContactModel.h"

/*! @brief Represents my contact list from RESTFull API. */
@interface ContactListResponseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSArray *contactList;

@end
