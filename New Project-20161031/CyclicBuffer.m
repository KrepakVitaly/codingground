// CyclicBuffer.m
#import "CyclicBuffer.h"

@implementation CyclicBuffer{
        // Private instance variables
}

@synthesize buf_size;
@synthesize tail;
@synthesize head;
@synthesize isEmpty;
@synthesize buffer;

- (id)initWithNSMutableArray:(NSMutableArray *)array {
    if ( (self = [super init]) ) 
    {
      buffer = [[[NSMutableArray alloc] init] autorelease];
      [buffer addObjectsFromArray:array];
      head = [buffer count] - 1;
    //   NSLog(@"%d", head);
      tail = 0;
      if (head == -1)
        isEmpty = YES;
      else
         isEmpty = NO;
      return self;
    } else
        return nil;
}
- (id)init{
    if ( (self = [super init]) ) 
    {
      isEmpty = YES;
      head = -1;
      tail = 0;
      buffer = [[[NSMutableArray alloc] init] autorelease];
      return self;
    }
    else
      return nil;
}

- (void)print{
    NSLog(@"asdf");
}

- (void)push:(int)x {
    // NSLog(@"push %d head = %d addr = %d", x, head, self);
    head += 1;
    [buffer insertObject:[NSNumber numberWithInteger:x] atIndex:head];
    
    isEmpty = NO;
}

- (int)pop {
    
    
    NSInteger popx = [[buffer objectAtIndex:0] intValue];
    // NSLog(@"pop %d head =  %d addr = %d", popx, head, self);
    [buffer removeObjectAtIndex:0]; 
    head -= 1;
    
    if (head == -1)
       isEmpty = YES;
    return (int) popx;
}

@end
