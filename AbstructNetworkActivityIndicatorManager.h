// This is free and unencumbered software released into the public domain.
// For more information, please refer to <http://unlicense.org/>

#import <Foundation/Foundation.h>

@interface AbstructNetworkActivityIndicatorManager : NSObject

- (void)enableNetworkActivityIndicatorWithObject:(id <NSObject>)object;
- (void)disableNetworkActivityIndicatorWithObject:(id <NSObject>)object;
- (void)forceDisableNetworkActivityIndicatorWithObject:(id <NSObject>)object;

- (void)networkActivityIndicator:(BOOL)on;

@end
