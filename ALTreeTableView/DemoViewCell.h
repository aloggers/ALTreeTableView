#import <UIKit/UIKit.h>

typedef void (^ButtonPressHandlerBlock)(id);

@interface DemoViewCell : UITableViewCell
@property (nonatomic, strong) NSObject* data;
@property (nonatomic, copy) ButtonPressHandlerBlock handler;
@end