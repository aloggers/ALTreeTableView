#import "ALTreeItem.h"
#import "ALTreeItemInfo.h"

@implementation ALTreeItem {
@private
    NSObject* _data;
    ALTreeItemInfo* _info;
}
@synthesize data = _data;
@synthesize info = _info;

- (id)init {
    self = [super init];
    if (self) {
        _info = [[ALTreeItemInfo alloc] init];
    }
    return self;
}


@end