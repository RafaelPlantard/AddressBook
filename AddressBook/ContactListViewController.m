//
//  ContactListViewController.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/19/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ContactListViewController.h"
#import "ViewController.h"

@implementation ContactListViewController

/*! @brief Go to the ViewController that contains the form for add a new contact */
- (void) goToAddViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"AddContactForm"];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (id) init {
    self = [super init];
    
    if (self) {
        UIBarButtonItem *addContactButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToAddViewController)];
        
        self.navigationItem.rightBarButtonItem = addContactButtonItem;
        self.navigationItem.title = @"Address Book";
    }
    
    return self;
}

@end