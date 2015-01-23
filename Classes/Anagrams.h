//
// Created by Bobby Manuel on 1/23/15.
// Copyright (c) 2015 Bobby Manuel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Anagrams : NSObject {
    NSMutableDictionary *anagrams;
}

@property(nonatomic, strong) NSMutableDictionary *anagrams;

+ (id)sharedInstance;

- (NSArray *)anagramsForWord:(NSString *)word;

@end