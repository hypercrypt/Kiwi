//
// Licensed under the terms in License.txt
//
// Copyright 2010 Allen Ding. All rights reserved.
//

#import "KWBeKindOfClassMatcher.h"
#import "KWFormatter.h"

@interface KWBeKindOfClassMatcher()

#pragma mark - Properties

@property (nonatomic, readwrite, unsafe_unretained) Class targetClass;

@end

@implementation KWBeKindOfClassMatcher

#pragma mark - Properties

@synthesize targetClass;

#pragma mark - Getting Matcher Strings

+ (NSArray *)matcherStrings {
    return @[@"beKindOfClass:"];
}

#pragma mark - Matching

- (BOOL)evaluate {
    return [self.subject isKindOfClass:self.targetClass];
}

#pragma mark - Getting Failure Messages

- (NSString *)failureMessageForShould {
    return [NSString stringWithFormat:@"expected subject to be kind of %@, got %@",
                                      NSStringFromClass(self.targetClass),
                                      NSStringFromClass([self.subject class])];
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"be kind of %@", NSStringFromClass(self.targetClass)];
}

#pragma mark - Configuring Matchers

- (void)beKindOfClass:(Class)aClass {
    self.targetClass = aClass;
}

@end
