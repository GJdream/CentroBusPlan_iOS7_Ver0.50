//
//  SSCustomerEducationTableViewController.m
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import "SSCustomerEducationTableViewController.h"
#import "CustomerProfile.h"
#import "CustomerEducation.h"
#import "SSUser.h"
#import "SSUtils.h"

@interface SSCustomerEducationTableViewController () <NSFetchedResultsControllerDelegate> {
    NSFetchedResultsController *_fetchedResultsController;
}

@property (nonatomic) int selectionCount;
@property (strong, nonatomic) NSArray *fetchedData;
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) CustomerProfile *profile;
@property BOOL isSure;
- (void)refetchData;

@end

@implementation SSCustomerEducationTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)refetchData {
    _fetchedResultsController.fetchRequest.resultType = NSManagedObjectResultType;
    [_fetchedResultsController performFetch:nil];
}

- (IBAction)nextButtonPressed:(id)sender {
    
    if (self.selectionCount > 0) {
        self.profile.isEducationSure = [NSNumber numberWithBool:self.isSure];
        [self.context save:nil];
        
        [self performSegueWithIdentifier:@"SelectCustomerBuyerOccupation" sender:self];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Selection Error"
                                    message:@"You must select an Education Level."
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    UIImageView *backgroundImageView40 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-568h@2x.png"]];
    UIImageView *backgroundImageView35R = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.png"]];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        self.tableView.backgroundView = backgroundImageView40;
    } else {
        self.tableView.backgroundView = backgroundImageView35R;
    }
    self.tableView.backgroundView.contentMode = UIViewContentModeCenter;
    
    self.tableView.delegate = self;
    
    self.navigationItem.title = @"Education";
    
    self.context = [(id)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *headerString;

    if (section == 0) {
        headerString = [NSString stringWithFormat:@"How much education do %@'s customers have? (Select all that apply)", [SSUtils companyName]];
    } else {
        return nil;
    }

    UILabel *headerLabel = [[UILabel alloc] init];
    
    headerLabel.numberOfLines = 5;
    headerLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    headerLabel.text = headerString;
    [headerLabel sizeToFit];
    [headerLabel setBackgroundColor:[UIColor clearColor]];
    
    
    
    return headerLabel;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if(![[SSUser currentUser] isLoggedIn]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        
        self.selectionCount = 0;
        
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CustomerEducation"];
        fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"educationID" ascending:YES selector:nil]];
        fetchRequest.returnsObjectsAsFaults = NO;
        
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.context sectionNameKeyPath:nil cacheName:nil];
        _fetchedResultsController.delegate = self;
        [_fetchedResultsController performFetch:nil];
        
        self.fetchedData = [_fetchedResultsController fetchedObjects];
        
        for (int i = 0; i < self.fetchedData.count; i++) {
            CustomerEducation *temp = (CustomerEducation *) [self.fetchedData objectAtIndex:i];
            if([temp.selectedAsCustomerEducation intValue] == 1) {
                self.selectionCount++;
            }
        }

        NSFetchRequest *fetchRequestCP = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entityCP = [NSEntityDescription entityForName:@"CustomerProfile"
                                                  inManagedObjectContext:self.context];
        [fetchRequestCP setEntity:entityCP];
        
        [fetchRequestCP setPredicate:[NSPredicate predicateWithFormat:@"companyID = %@", [[SSUser currentUser] companyID]]];
        
        NSError *error;
        NSArray *fetchedObjectsCP = [self.context executeFetchRequest:fetchRequestCP error:&error];
        
        if (fetchedObjectsCP.count == 0) { 
            
        } else {
            self.profile = (CustomerProfile *) [fetchedObjectsCP objectAtIndex:0];
        }
                
        self.isSure = [self.profile.isEducationSure boolValue];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) {
        return [[[_fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomerEducation";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    
    if (indexPath.section == 0) {
        CustomerEducation *tempEdu = [_fetchedResultsController objectAtIndexPath:indexPath];
        cell.textLabel.text = tempEdu.educationLiteralUS;
        
        if([tempEdu.selectedAsCustomerEducation isEqualToNumber:[NSNumber numberWithBool:NO]]) {
            [cell setAccessoryType:UITableViewCellAccessoryNone];
        } else {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }
        
    } else {
        if(self.isSure) {
            cell.textLabel.text = @"☐ I'm not sure yet";
        } else {
            cell.textLabel.text = @"☑ I'm not sure yet";
        }
    }   
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CustomerEducation *tempEdu = [_fetchedResultsController objectAtIndexPath:indexPath];
        
        if([tempEdu.selectedAsCustomerEducation isEqualToNumber:[NSNumber numberWithBool:NO]]) {
            [tempEdu setSelectedAsCustomerEducation:[NSNumber numberWithBool:YES]];
            self.selectionCount++;
        } else {
            [tempEdu setSelectedAsCustomerEducation:[NSNumber numberWithBool:NO]];
            self.selectionCount--;
        }

    } else {
        self.isSure = !self.isSure;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.tableView reloadData];
    
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}

@end