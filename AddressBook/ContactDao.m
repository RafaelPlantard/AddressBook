//
//  ContactDao.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/20/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ContactDao.h"

@implementation ContactDao

/*! @brief A single instance of the ContactDao. */
static ContactDao *instance;

/*! @brief Contains a primary list of contacts. */
NSMutableArray *contactList;

- (void)addContact:(Contact *)contact {
    [contactList addObject:contact];
}

- (Contact *)contactAtIndex:(NSInteger)index {
    return contactList[index];
}

- (NSInteger)indexByContact:(Contact *)contact {
    return [contactList indexOfObject:contact];
}

- (id)init
{
    self = [super init];
    
    if (self) {
        contactList = [NSMutableArray new];
    }
    
    return self;
}

+ (id)instance {
    if (!instance) {
        instance = [ContactDao new];
    }
    
    return instance;
}

- (void)removeContact:(Contact *)contact {
    [contactList removeObject:contact];
}

- (NSInteger)total {
    return contactList.count;
}

@end