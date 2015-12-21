//
//  ContactListViewController.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/19/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ContactListViewController.h"
#import "Contact.h"
#import "ViewController.h"

@implementation ContactListViewController

/*! @brief The reuse identifier for the contact list. */
NSString *contactListReuseIdentifier = @"ContactListReuseId";

/*! @brief Selected contact for editing. */
Contact *selectedContact;

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Contact *contactToDelete = [self.contactDao contactAtIndex:indexPath.row];
        
        [self.contactDao removeContact:contactToDelete];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*! @brief Go to the ViewController that contains the form for add a new contact */
- (void) goToAddViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"AddContactForm"];
    
    viewController.contactToWork = selectedContact;
    
    selectedContact = nil;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (id) init {
    self = [super init];
    
    if (self) {
        UIBarButtonItem *addContactButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToAddViewController)];
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.navigationItem.rightBarButtonItem = addContactButtonItem;
        self.navigationItem.title = @"Address Book";
        
        self.contactDao = [ContactDao instance];
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Contact *currentContact = [self.contactDao contactAtIndex:indexPath.row];
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:contactListReuseIdentifier];
    
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contactListReuseIdentifier];
    }
    
    tableViewCell.textLabel.text = currentContact.name;

    return tableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedContact = [self.contactDao contactAtIndex:indexPath.row];
    
    [self goToAddViewController];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactDao.total;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

@end