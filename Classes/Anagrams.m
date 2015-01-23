//
// Created by Bobby Manuel on 1/23/15.
// Copyright (c) 2015 Bobby Manuel. All rights reserved.
//

#import "Anagrams.h"
#import "Words.h"


@interface Anagrams ()
- (NSString *)jumbleKeyForWord:(NSString *)word;
@end

@implementation Anagrams {
}

@synthesize anagrams;

+ (id)sharedInstance {
    static Anagrams *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id)init {
    self = [super init];
    self.anagrams = [NSMutableDictionary dictionary];;
    NSString *jumbleKey;
    for (NSString *word in [Words words]) {
        jumbleKey = [self jumbleKeyForWord:word];
        if (self.anagrams[jumbleKey] == nil) {
            self.anagrams[jumbleKey] = [@[word] mutableCopy];
        } else {
            [((NSMutableArray *) self.anagrams[jumbleKey]) addObject:word];
        }
    }
    return self;
}


- (NSString *)jumbleKeyForWord:(NSString *)word {
    NSMutableArray *charArray = [NSMutableArray arrayWithCapacity:word.length];
    for (uint i = 0; i < word.length; ++i) {
        NSString *charStr = [word substringWithRange:NSMakeRange(i, 1)];
        [charArray addObject:charStr];
    }
    [charArray sortUsingComparator:^(NSString *a, NSString *b) {
        return [a compare:b];
    }];
    return [charArray componentsJoinedByString:@""];
}

- (NSArray *)anagramsForWord:(NSString *)word {
    return self.anagrams[[self jumbleKeyForWord:word]];
}

@end
