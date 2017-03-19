// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

#import <UIKit/UIKit.h>
#import "SNASharedNetworkActivityIndicator.h"
#import "NSObject+SharedNetworkActivityIndicator.h"

@implementation NSObject (SharedNetworkActivityIndicator)

- (BOOL)sna_networkActivityIndicatorVisible
{
    return [UIApplication sharedApplication].networkActivityIndicatorVisible;
}

- (void)sna_setNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible
{
    [self willChangeValueForKey:@"networkActivityIndicatorVisible"];
    if (networkActivityIndicatorVisible) {
        [[SNASharedNetworkActivityIndicator sharedIndicator] enableNetworkActivityIndicatorWithObject:self];
    } else {
        [[SNASharedNetworkActivityIndicator sharedIndicator] disableNetworkActivityIndicatorWithObject:self];
    }
    [self didChangeValueForKey:@"networkActivityIndicatorVisible"];
}

@end
