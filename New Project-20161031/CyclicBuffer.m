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
      NSLog(@"%d", head);
      tail = 0;
      isEmpty = NO;
      return self;
    } else
        return nil;
}
- (id)init{
    if ( (self = [super init]) ) 
    {
      isEmpty = YES;
      head = 0;
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
    NSLog(@"push %d head = %d", x, head);
    [buffer insertObject:[NSNumber numberWithInteger:x] atIndex:head];
    head += 1;
    isEmpty = NO;
}

- (int)pop {
    NSInteger popx = [[buffer objectAtIndex:head] intValue];
    NSLog(@"pop %d", popx);
    [buffer removeObjectAtIndex:head]; 
    head -= 1;
    if (head == 0)
       isEmpty = YES;
    return (int) popx;
}

@end
