//
// Created by zaplitny on 9/1/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ALTreeItem.h"


@implementation ALTreeItem {
@private
    NSObject* _data;
    BOOL _expanded;
    NSArray* _children;
    NSUInteger _level;
    __weak NSObject* _parent;
}

@synthesize data = _data;
@synthesize expanded = _expanded;
@synthesize children = _children;
@synthesize level = _level;
@synthesize parent = _parent;

@end