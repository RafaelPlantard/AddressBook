//
//  ContactListModel.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/25/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ContactListResponseModel.h"


@implementation ContactListResponseModel

#pragma mark - JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"contactList" : @"results"
             };
}

#pragma mark - JSON Transformer

+ (NSValueTransformer *) contactListJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:ContactListResponseModel.class];
}

@end
