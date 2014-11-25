// This is free and unencumbered software released into the public domain.
// For more information, please refer to <http://unlicense.org/>

#import <Foundation/Foundation.h>

@interface NSObject (NetworkActivityIndicator)

@property (nonatomic) BOOL networkActivityIndicator;

- (void)enableNetworkActivityIndicator;
- (void)disableNetworkActivityIndicator;
- (void)forceDisableNetworkActivityIndicator;

- (void)setNetworkActivityIndicator:(BOOL)networkActivityIndicator force:(BOOL)force;

@end
