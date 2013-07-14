//
//  NSArray+CommonSortingAlgorithms.m
//  CommonSortAlgorithms
//
//  Created by Matt Hawkins on 7/14/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//

#import "NSArray+CommonSortingAlgorithms.h"

@implementation NSArray (CommonSortingAlgorithms)

-(NSArray *)bubbleSort
{
    return [self bubbleSortUsingNSComparisonResult:NSOrderedDescending];
}

-(NSArray *)bubbleSortUsingNSComparisonResult:(NSComparisonResult)comparisonResult
{
    // Create a mutable copy of our array
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self];
    
    // Store state of being swapped
    BOOL swapped = YES;
    
    // Loop until we stopped swapping
    while (swapped == YES) {
        // Set state of swapped to NO
        swapped = NO;
        
        // Iterate through our objects
        for(int index = 0; index < mutableArray.count-1; index++)
        {
            // Get our generic objects
            id object1 = mutableArray[index];
            id object2 = mutableArray[index+1];
            
            BOOL shouldSwap = NO;
                        
            // Do these objects respond to the compare selector?
            if([object1 respondsToSelector:@selector(compare:)] && [object2 respondsToSelector:@selector(compare:)])
            {
                if([object1 compare:object2] == comparisonResult)
                {
                    shouldSwap = YES;
                }
            }
            // Are they strings?
            else if([object1 isKindOfClass:[NSString class]] && [object2 isKindOfClass:[NSString class]])
            {
                NSString *string1 = (NSString *)object1;
                NSString *string2 = (NSString *)object2;
                
                if([string1 compare:string2 options:NSLiteralSearch] == comparisonResult)
                {
                    shouldSwap = YES;
                }
                
            }
            // Unexpected type, fail loudly
            else
            {
                [NSException raise:@"UnsortableObject" format:@"Cannot sort object '%@' and '%@'", object1, object2];
            }
            
            // If we should swap, do so
            if(shouldSwap)
            {
                mutableArray[index] = object2;
                mutableArray[index+1] = object1;
                swapped = YES;
            }
            
        }
    }
    
    return mutableArray;
}

-(NSArray *)quickSort
{
    // Create a mutable copy of our array
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self];
    
    // If one element, just return
    if(self.count <= 1)
        return mutableArray;
    
    NSMutableArray *lessArray = [NSMutableArray array];
    NSMutableArray *moreArray = [NSMutableArray array];
    
    // Get our pivot element and remove it from the array
    id pivotElement = self[self.count/2];
    [mutableArray removeObject:pivotElement];
        
    for(id record in mutableArray)
    {
        // Do these objects respond to the compare selector?
        if([record respondsToSelector:@selector(compare:)] && [pivotElement respondsToSelector:@selector(compare:)])
        {
            if([record compare:pivotElement] == NSOrderedAscending || [record compare:pivotElement] == NSOrderedSame)
            {
                [lessArray addObject:record];
            }
            else
            {
                [moreArray addObject:record];
            }
        }
        // Are they strings?
        else if([record isKindOfClass:[NSString class]] && [pivotElement isKindOfClass:[NSString class]])
        {
            NSString *string1 = (NSString *)record;
            NSString *string2 = (NSString *)pivotElement;
            
            if([string1 compare:string2 options:NSLiteralSearch] == NSOrderedAscending || [string1 compare:string2 options:NSLiteralSearch] == NSOrderedSame)
            {
                [lessArray addObject:record];
            }
            else
            {
                [moreArray addObject:record];
            }
            
        }
        // Unexpected type, fail loudly
        else
        {
            [NSException raise:@"UnsortableObject" format:@"Cannot sort object '%@' and '%@'", record, pivotElement];
        }
    }
    
    NSMutableArray *results = [NSMutableArray array];    
    [results addObjectsFromArray:[lessArray quickSort]];
    [results addObject:pivotElement];
    [results addObjectsFromArray:[moreArray quickSort]];
    return results;
}

@end
