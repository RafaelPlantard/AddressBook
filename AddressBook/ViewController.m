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

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        UIBarButtonItem *addNewContactButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addNewContact)];
        
        self.navigationItem.rightBarButtonItem = addNewContactButtonItem;
        self.navigationItem.title = @"New Contact";
    }
    
    return self;
}

/*! @brief Add the data typed for the user as a new contact in the address book. */
- (void) addNewContact
{
    contact = [ContactDao new];
    
    contact.name = self.nameField.text;
    contact.address = self.addressField.text;
    contact.eMail = self.eMailField.text;
    contact.phone = self.phoneField.text;
    contact.webSite = self.webSiteField.text;
    
    NSLog(@"I'm adding this new contact \nDetails: "
          "\nName: %@"
          "\nAddress: %@"
          "\nE-mail: %@"
          "\nPhone: %@"
          "\nWebSite: %@",
          contact.name, contact.address, contact.eMail, contact.phone, contact.webSite);
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
