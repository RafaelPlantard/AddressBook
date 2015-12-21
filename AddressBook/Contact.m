//
//  ContactDao.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/18/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (NSString *)description {
    NSString *data = [NSString stringWithFormat:
                      @"Name: %@; "
                      "Address: %@; "
                      "E-mail: %@; "
                      "Phone: %@; "
                      "WebSite: %@.",
                      self.name, self.address, self.eMail, self.phone, self.webSite];
    
    return data;
}

@end
