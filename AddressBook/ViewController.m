//
//  ViewController.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/14/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ViewController.h"
#import "ContactDao.h"

@implementation ViewController

ContactDao *contact;

/*! @brief Add the data typed for the user as a new contact in the address book. */
- (IBAction) addNewContact
{
    contact = [ContactDao new];
    
    [contact setName:self.nameField.text];
    [contact setAddress:self.addressField.text];
    [contact setEMail:self.eMailField.text];
    [contact setPhone:self.phoneField.text];
    [contact setWebSite:self.webSiteField.text];
    
    NSLog(@"I'm adding this new contact \nDetails: "
          "\nName: %@"
          "\nAddress: %@"
          "\nE-mail: %@"
          "\nPhone: %@"
          "\nWebSite: %@",
          [contact name], [contact address], [contact eMail], [contact phone], [contact webSite]);
}

@end
