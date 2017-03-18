// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

#import <UIKit/UIKit.h>
#import "SNASharedNetworkActivityIndicator.h"
#import "NSObject+SharedNetworkActivityIndicator.h"

@implementation NSObject (SharedNetworkActivityIndicator)

- (void)sna_enableNetworkActivityIndicator
{
    [[SNASharedNetworkActivityIndicator sharedIndicator] enableNetworkActivityIndicatorWithObject:self];
}

- (void)sna_disableNetworkActivityIndicator
{
    [[SNASharedNetworkActivityIndicator sharedIndicator] disableNetworkActivityIndicatorWithObject:self];
}

- (BOOL)sna_networkActivityIndicatorVisible
{
    return [UIApplication sharedApplication].networkActivityIndicatorVisible;
}

- (void)sna_setNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible
{
    [self willChangeValueForKey:@"networkActivityIndicatorVisible"];
    if (networkActivityIndicatorVisible) {
        [self sna_enableNetworkActivityIndicator];
    } else {
        [self sna_disableNetworkActivityIndicator];
    }
    [self didChangeValueForKey:@"networkActivityIndicatorVisible"];
}

@end
