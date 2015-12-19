//
//  ContactDao.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/18/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ContactDao.h"

@implementation ContactDao

NSString *name;
NSString *address;
NSString *eMail;
NSString *phone;
NSString *webSite;

- (void)setName:(NSString *)newName {
    name = newName;
}

- (NSString *)name {
    return name;
}

- (void)setAddress:(NSString *)newAddress {
    address = newAddress;
}

- (NSString *)address {
    return address;
}

- (void)setEMail:(NSString *)newEmail {
    eMail = newEmail;
}

- (NSString *)eMail {
    return eMail;
}

- (void)setPhone:(NSString *)newPhone {
    phone = newPhone;
}

- (NSString *)phone {
    return phone;
}

- (void)setWebSite:(NSString *)newWebSite {
    webSite = newWebSite;
}

- (NSString *)webSite {
    return webSite;
}

@end
