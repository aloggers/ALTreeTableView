//
// Created by zaplitny on 9/1/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface ALTreeItem : NSObject
@property (nonatomic, strong) NSObject* data;
@property (nonatomic, strong) NSArray* children;
@property (nonatomic) BOOL expanded;
@property (nonatomic) NSUInteger level;
@property (nonatomic, weak) NSObject* parent;
@end

