#import "ALTreeTableView.h"
#import "ALTreeItem.h"


@interface ALTreeTableView()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray* treeItems;
@end

@implementation ALTreeTableView {

@private
    __weak id <ALTreeTableViewDataSource> _treeDataSource;
    NSMutableArray* _treeItems;
}
@synthesize treeDataSource = _treeDataSource;
@synthesize treeItems = _treeItems;


- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }

    return self;
}

- (void)reloadTreeData {
    NSUInteger numberOfItems = [self.treeDataSource treeTableView:self numberOfChildrenOfItem:nil];
    NSMutableArray* result = [[NSMutableArray alloc] init];
    for (int i=0; i < numberOfItems; i++) {
        ALTreeItem* item = [[ALTreeItem alloc] init];
        item.data = [self.treeDataSource treeTableView:self child:i ofItem:nil];
        [result addObject:item];
    }
    self.treeItems = result;
    [self reloadData];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.treeItems count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    ALTreeItem* item = [self.treeItems objectAtIndex:indexPath.row];
    return [self.treeDataSource treeTableView:self cellForItem:item];
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    ALTreeItem* item = [self.treeItems objectAtIndex:indexPath.row];
    [self beginUpdates];
    if (!item.expanded) {
        item.expanded = YES;
        NSUInteger numberOfItems = [self.treeDataSource treeTableView:self numberOfChildrenOfItem:item];
        NSMutableArray* indexPaths = [[NSMutableArray alloc] init];
        for (int i=0; i < numberOfItems; i++) {
            ALTreeItem* childItem = [[ALTreeItem alloc] init];
            childItem.data = [self.treeDataSource treeTableView:self child:i ofItem:item];
            childItem.level = item.level + 1;
            NSUInteger newIndex = indexPath.row + i + 1;
            [self.treeItems insertObject:childItem atIndex:newIndex];
            [indexPaths addObject:[NSIndexPath indexPathForRow:newIndex inSection:indexPath.section]];
        }
        [self insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    }
    else {
        item.expanded = NO;
        NSUInteger numberOfItems = [self.treeDataSource treeTableView:self numberOfChildrenOfItem:item];
        NSMutableArray* indexPaths = [[NSMutableArray alloc] init];
        for (int i=0; i < numberOfItems; i++) {
            ALTreeItem* childItem = [[ALTreeItem alloc] init];
            childItem.data = [self.treeDataSource treeTableView:self child:i ofItem:item];
            childItem.level = item.level + 1;
            NSUInteger newIndex = indexPath.row + i + 1;
            [self.treeItems removeObjectAtIndex:indexPath.row + 1];
            [indexPaths addObject:[NSIndexPath indexPathForRow:newIndex inSection:indexPath.section]];
        }
        [self deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    }
    [self reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self endUpdates];
}



@end