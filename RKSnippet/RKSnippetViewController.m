#import <Foundation/Foundation.h>
#import "RKSnippetViewController.h"
#import "RKSnippet.h"
#import "RKLog.h"

@interface RKSnippetViewController (Private)
- (void)loadData;
@end

@implementation RKSnippetViewController

- (void)loadSnippets
{
    
#ifdef DEBUG
    RKLogConfigureByName("RestKit", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/Network/Queue", RKLogLevelTrace);
#endif
    
    // Load the object model via RestKit
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    [objectManager getObjectsAtPath:@"/snippets/"
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                NSArray *snippets = [mappingResult array];
                                NSLog(@"Loaded snippets: %@", snippets);
                                
                                _snippets = snippets;
                                
                                if(self.isViewLoaded)
                                    [self._tableView reloadData];
                            }
                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                message:[error localizedDescription]
                                                                               delegate:nil
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil];
                                [alert show];
                                NSLog(@"Hit error: %@", error);
                            }];
}

- (void)loadView
{
    [super loadView];
    
    // Adds refresh button on top right
    self.title = @"RestKit Snippets";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                              target:self
                                              action:@selector(loadSnippets)];
    
    [self loadSnippets];
}


# pragma UITableViewController required methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_snippets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"Snippet";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    
    RKSnippet* snippet = [_snippets objectAtIndex:indexPath.row];
    cell.textLabel.text = [snippet title];
    cell.detailTextLabel.text = [snippet description];
    return cell;
}

@end
