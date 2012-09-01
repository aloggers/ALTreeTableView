#import "DemoViewCell.h"

@implementation DemoViewCell {

@private
    UIButton* _addButton;
    NSObject* _data;
    ButtonPressHandlerBlock _handler;
}
@synthesize data = _data;
@synthesize handler = _handler;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        _addButton.frame = CGRectMake(250, 10, 20, 20);
        [_addButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:_addButton];
    }
    return self;
}

- (void)buttonPressed:(id)sender {
    if (self.handler) {
        self.handler(_data);
    }
}

@end