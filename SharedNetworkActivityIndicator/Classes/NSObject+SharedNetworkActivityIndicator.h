// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

#import <Foundation/Foundation.h>

@interface NSObject (SharedNetworkActivityIndicator)

@property (nonatomic,
           getter=sna_networkActivityIndicatorVisible,
           setter=sna_setNetworkActivityIndicatorVisible:) BOOL sna_networkActivityIndicatorVisible;

- (void)sna_enableNetworkActivityIndicator;
- (void)sna_disableNetworkActivityIndicator;

@end
