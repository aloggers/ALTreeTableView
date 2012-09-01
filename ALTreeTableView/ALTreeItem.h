#import <Foundation/Foundation.h>

@class ALTreeItemInfo;

@interface ALTreeItem : NSObject
@property (nonatomic, strong) NSObject* data;
@property (nonatomic, strong) ALTreeItemInfo* info;
@end

