// This is free and unencumbered software released into the public domain.
// For more information, please refer to <http://unlicense.org/>

#import <UIKit/UIKit.h>
#import "NetworkActivityIndicatorManager.h"
#import "NSObject+NetworkActivityIndicator.h"

@implementation NSObject (NetworkActivityIndicator)

@dynamic networkActivityIndicator;

- (void)enableNetworkActivityIndicator
{
    [[NetworkActivityIndicatorManager sharedManager] enableNetworkActivityIndicatorWithObject:self];
}

- (void)disableNetworkActivityIndicator
{
    [[NetworkActivityIndicatorManager sharedManager] disableNetworkActivityIndicatorWithObject:self];
}

- (void)forceDisableNetworkActivityIndicator
{
    [[NetworkActivityIndicatorManager sharedManager] forceDisableNetworkActivityIndicatorWithObject:self];
}

- (BOOL)networkActivityIndicator
{
    return [UIApplication sharedApplication].networkActivityIndicatorVisible;
}

- (void)setNetworkActivityIndicator:(BOOL)networkActivityIndicator
{
    [self setNetworkActivityIndicator:networkActivityIndicator force:NO];
}

- (void)setNetworkActivityIndicator:(BOOL)networkActivityIndicator force:(BOOL)force
{
    if (networkActivityIndicator) {
        [self enableNetworkActivityIndicator];
    } else {
        if (force) {
            [self forceDisableNetworkActivityIndicator];
        } else {
            [self disableNetworkActivityIndicator];
        }
    }
}

@end
