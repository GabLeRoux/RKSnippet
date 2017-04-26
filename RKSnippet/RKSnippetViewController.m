#import <Foundation/Foundation.h>
#import "RKSnippetViewController.h"
#import "RKSnippet.h"

@interface RKSnippetViewController (Private)
- (void)loadData;
@end

@implementation RKSnippetViewController

- (void)loadSnippet
{
    // Load the object model via RestKit
    RKObjectManager *objectManager = [RKObjectManager sharedManager];

    [objectManager getObjectsAtPath:@"/snippets/2506/"
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                NSArray* snippets = [mappingResult array];
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
                                              action:@selector(loadSnippet)];

    [self loadSnippet];
}


# pragma UITableViewController required methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_snippets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    RKSnippet* snippet = [_snippets objectAtIndex:indexPath.row];
    cell.textLabel.text = snippet.title;
    cell.detailTextLabel.text = snippet.description;
    return cell;
}

@end
