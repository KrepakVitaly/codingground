// Разработать программу сортировки целочисленного массива в соответствии 
// с поставленными требованиями. 
//  
//  Общий алгоритм работы программы: 
//   - Чтение входного файла. 
//   - Поочередное преобразование строки чисел в «массив». 
//     Определенный вид «массива» жестко задан в индивидуальном задании. 
//   - Сортировка каждого «массива». (метод сортировки – блочная (циклический буфер)) 
//   - Запись отсортированного «массива» в строку выходного файла. 
 
//  Формат входного файла: 
// Данные записаны построчно и разделены между собой пробелом.
// Данных в строке может быть произвольное количество, но не более 100000. 
// Данные являются целыми числами со знаком типа int.
// В строке могут быть некорректные данные: символы или слова, 
// не являющиеся числами. Количество строк произвольно. Может быть очень большим.

// Формат выходного файла аналогичен формату входного файла, 
// за исключением следующего:
// В строке не может быть некорректных данных. 
// Если в строке входного файла не оказалось корректных данных, .
// в выходной файл выводится пустая строка. 
// Номера строк входного и выходного файлов совпадают.

//  По окончании работы программа выводит в консоль:
//   - время работы в миллисекундах, 
//   - среднюю длину строки 
//   - и количество обработанных строк. 
//   -  перевод строки (“n”)
// Никакой другой текстовой или числовой информации, 
// или единиц измерения не выводится.

#import <Foundation/Foundation.h>

NSArray * sort (NSMutableArray * sorting_array);

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

//   NSLog (@"-----------------------------------------------------------------");
   NSDate *date = [NSDate date];

   NSString* fileName = @"filename.txt";
   NSString *fileString = [NSString stringWithContentsOfFile: fileName];
   
   NSArray *lines = [fileString componentsSeparatedByString:@"\n"];    
   
   NSMutableArray *block_x = [[[NSMutableArray alloc] init] autorelease];
   NSMutableArray *new_lines = [[[NSMutableArray alloc] init] autorelease];

   // Разбор файла построчно
   int proc_line_count = 0;
   int total_str_length = 0;
   
   for(NSString *element in lines)
   {  
      [block_x removeAllObjects];
      //NSLog (@"String processing");
      // Читаем строку целых чисел, разделенных пробелами и формируем массив чисел
      NSArray *readed = [element componentsSeparatedByString: @" "];
      
      for(NSString* string in readed)
      {
        // NSLog(@"string =  %@", string);
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        NSNumber * number_from_string = [f numberFromString: string];
        NSNumber* numberWithInt =  [NSNumber numberWithInt:[number_from_string integerValue]];
        
        if (number_from_string != NULL)
        {
            [block_x addObject:numberWithInt];
            // NSLog(@"to block_x added %d",  [numberWithInt integerValue]);
        }
      }
    
      //Упорядочиваем массив
      NSArray *sorted_Array = [block_x sortedArrayUsingSelector:@selector(compare:)];
      
      //NSLog (@"Sorting String processing");
    //   for(NSNumber* num in sorted_Array)
    //   {
    //     NSLog(@"%d",  [num integerValue]);
    //   }
    
    //Выводим массив в строку
    [new_lines addObject:[sorted_Array componentsJoinedByString:@" "]];
    // NSLog (@"%@", [new_lines objectAtIndex:0]);
    proc_line_count += 1;
    total_str_length += [element length];
   }
   
   //Запись результата в файл
   NSString *new_fileString = [new_lines componentsJoinedByString:@"\n"];
   NSData *fileContents = [new_fileString dataUsingEncoding:NSUTF8StringEncoding];
   [[NSFileManager defaultManager] createFileAtPath:@"./new_filename.txt"
                                   contents:fileContents
                                   attributes:nil];


   double timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
   NSLog (@"-----------------------------------------------------------------");
   NSLog (@"%f ms", timePassed_ms);
   NSLog (@"%d", proc_line_count);
   double average_length = ((float) total_str_length)/((float) proc_line_count);
   NSLog (@"%f", average_length);
   NSLog (@"\n");
   
   [pool drain];
   return 0;
}

NSArray * sort (NSMutableArray * sorting_array)
{
   return;
}
