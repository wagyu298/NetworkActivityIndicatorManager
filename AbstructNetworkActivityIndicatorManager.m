// This is free and unencumbered software released into the public domain.
// For more information, please refer to <http://unlicense.org/>

#import <UIKit/UIKit.h>
#import "AbstructNetworkActivityIndicatorManager.h"

typedef NSNumber ObjectId;

static ObjectId *
objectId(id <NSObject> object)
{
    ObjectId *objectId = [NSNumber numberWithUnsignedInteger:[object hash]];
    return objectId;
}

@interface NetWorkActivityIndicatorManagedObject : NSObject

@property (weak, nonatomic) id <NSObject> object;
@property (nonatomic) NSInteger count;

- (instancetype)initWithObject:(id <NSObject>)object;
- (void)increment;
- (void)decrement;

@end

@implementation NetWorkActivityIndicatorManagedObject

- (instancetype)initWithObject:(id <NSObject>)object
{
    self = [super init];
    if (self) {
        _object = object;
        _count = 1;
    }
    return self;
}

- (void)increment
{
    self.count++;
}

- (void)decrement
{
    self.count--;
}

@end

@interface AbstructNetworkActivityIndicatorManager ()

@property (strong, nonatomic) NSMutableDictionary *managedObjects;

- (void)cleanup;
- (void)didEnterBackground:(NSNotification *)notification;

@end

@implementation AbstructNetworkActivityIndicatorManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _managedObjects = [[NSMutableDictionary alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)networkActivityIndicator:(BOOL)on
{
    // Overrider this
}

- (void)enableNetworkActivityIndicatorWithObject:(id <NSObject>)object
{
    @synchronized(self) {
        NetWorkActivityIndicatorManagedObject *managedObject;
        ObjectId *oid = objectId(object);
        managedObject = [self.managedObjects objectForKey:oid];
        if (managedObject) {
            [managedObject increment];
        } else {
            NetWorkActivityIndicatorManagedObject *managedObject = [[NetWorkActivityIndicatorManagedObject alloc] initWithObject:object];
            [self.managedObjects setObject:managedObject forKey:oid];
            [self networkActivityIndicator:YES];
        }
    }
}

- (void)disableNetworkActivityIndicatorWithObject:(id <NSObject>)object
{
    @synchronized(self) {
        ObjectId *oid = objectId(object);
        NetWorkActivityIndicatorManagedObject *managedObject = [self.managedObjects objectForKey:oid];
        if (managedObject) {
            [managedObject decrement];
            if (managedObject.count <= 0) {
                [self.managedObjects removeObjectForKey:oid];
            }
        }
        if ([self.managedObjects count] <= 0) {
            [self networkActivityIndicator:NO];
        }
    }
}

- (void)forceDisableNetworkActivityIndicatorWithObject:(id <NSObject>)object
{
    @synchronized(self) {
        ObjectId *oid = objectId(object);
        NetWorkActivityIndicatorManagedObject *managedObject = [self.managedObjects objectForKey:oid];
        if (managedObject) {
            [self.managedObjects removeObjectForKey:oid];
        }
        if ([self.managedObjects count] <= 0) {
            [self networkActivityIndicator:NO];
        }
    }
}

- (NSInteger)numberOfObjectEnabled:(id <NSObject>)object
{
    @synchronized(self) {
        ObjectId *oid = objectId(object);
        NetWorkActivityIndicatorManagedObject *managedObject = [self.managedObjects objectForKey:oid];
        if (managedObject) {
            return managedObject.count;
        } else {
            return 0;
        }
    }
}

- (void)cleanup
{
    @synchronized(self) {
        NSMutableArray *removeKeys = [[NSMutableArray alloc] init];
        for (ObjectId *key in [self.managedObjects keyEnumerator]) {
            NetWorkActivityIndicatorManagedObject *managedObject = [self.managedObjects objectForKey:key];
            if (managedObject.object == nil) {
                [removeKeys addObject:key];
            }
        }
        if ([removeKeys count] > 0) {
            [self.managedObjects removeObjectsForKeys:removeKeys];
        }
        if ([self.managedObjects count] <= 0) {
            [self networkActivityIndicator:NO];
        }
    }
}

- (void)didEnterBackground:(NSNotification *)notification
{
    [self cleanup];
}

@end
