//
//  ViewController.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/14/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "Contact.h"
#import "ContactListViewController.h"
#import "ViewController.h"

@implementation ViewController

/*! @brief Add the data typed for the user as a new contact in the address book. */
- (void) addContact {
    self.contactToWork = [Contact new];
    
    [self setUpContactToAddOrEdit];

    [self.contactDao addContact:self.contactToWork];
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*! @brief Edit the current contact that it was selected. */
- (void) editContact {
    [self setUpContactToAddOrEdit];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.contactDao = [ContactDao instance];
    }
    
    return self;
}

- (void) setUpContactToAddOrEdit {
    self.contactToWork.name = self.nameField.text;
    self.contactToWork.address = self.addressField.text;
    self.contactToWork.eMail = self.eMailField.text;
    self.contactToWork.phone = self.phoneField.text;
    self.contactToWork.webSite = self.webSiteField.text;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    if (self.contactToWork) {
        self.nameField.text = self.contactToWork.name;
        self.addressField.text = self.contactToWork.address;
        self.eMailField.text = self.contactToWork.eMail;
        self.phoneField.text = self.contactToWork.phone;
        self.webSiteField.text = self.contactToWork.webSite;
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Change" style:UIBarButtonItemStylePlain target:self action:@selector(editContact)];
        self.navigationItem.title = @"Edit Contact";
    } else {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addContact)];
        self.navigationItem.title = @"New Contact";
    }
}

@end