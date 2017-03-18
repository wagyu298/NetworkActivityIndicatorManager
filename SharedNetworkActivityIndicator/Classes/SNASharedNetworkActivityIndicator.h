// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

#import <Foundation/Foundation.h>

@interface SNASharedNetworkActivityIndicator : NSObject

- (void)enableNetworkActivityIndicatorWithObject:(id <NSObject> _Nonnull)object;
- (void)disableNetworkActivityIndicatorWithObject:(id <NSObject> _Nonnull)object;

+ (instancetype _Nonnull)sharedIndicator;

@end
