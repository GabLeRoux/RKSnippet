#import <Foundation/Foundation.h>
#import "RKSnippet.h"

@implementation RKSnippet

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ (Language: %@)", self.title, self.language];
}

@end
