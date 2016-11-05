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
    // NSLog(@"push %d head = %d", x, head);
    head += 1;
    [buffer insertObject:[NSNumber numberWithInteger:x] atIndex:head];
    
    isEmpty = NO;
}

- (int)pop {
    // NSLog(@"pop head =  %d addr = %d", head, self);
    
    NSInteger popx = [[buffer objectAtIndex:head] intValue];
    
    // NSLog(@"pop %d", popx);
    [buffer removeObjectAtIndex:head]; 
    head -= 1;
    
    if (head == -1)
       isEmpty = YES;
    return (int) popx;
}

@end
