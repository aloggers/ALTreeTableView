#import "DemoViewController.h"
#import "ALTreeTableView.h"
#import "ALTreeItem.h"


@interface DemoViewController () <ALTreeTableViewDataSource>
@end

@implementation DemoViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    ALTreeTableView* treeTableView = [[ALTreeTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [treeTableView setTreeDataSource:self];
    [treeTableView reloadTreeData];
    [self.view addSubview:treeTableView];
}

- (NSUInteger)treeTableView:(ALTreeTableView*)treeTableView numberOfChildrenOfItem:(id)item {
    ALTreeItem* treeItem = (ALTreeItem* )item;
    if (treeItem == nil) {
        return 2;
    }
    if ([treeItem.data isEqual:@"A"]) {
        return 3;
    }
    else if ([treeItem.data isEqual:@"B"]) {
        return 1;
    }
    return 0;
}

- (id)treeTableView:(ALTreeTableView*)treeTableView child:(NSUInteger)index1 ofItem:(id)item {
    ALTreeItem* treeItem = (ALTreeItem* )item;
    if (treeItem == nil) {
        if (index1 == 0) {
            return @"A";
        }
        else if (index1 == 1) {
            return @"B";
        }
    }
    else if ([treeItem.data isEqual:@"A"]) {
        return [NSString stringWithFormat:@"A-%d", index1];
    }
    else if ([treeItem.data isEqual:@"B"]) {
        return [NSString stringWithFormat:@"B-%d", index1];
    }
    return nil;
}

- (UITableViewCell*)treeTableView:(ALTreeTableView*)treeTableView cellForItem:(id)item {

    NSString* const identifier = @"CellIdentifier";
    UITableViewCell* cell = [treeTableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
            
    ALTreeItem* treeItem = (ALTreeItem* )item;
    cell.textLabel.text = (NSString*)treeItem.data;
    return cell;
}


@end