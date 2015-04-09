//
//  ViewController.m
//  own
//
//  Created by 堅固潤也 on 2015/04/09.
//  Copyright (c) 2015年 JunyaKengo. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    UIPickerView *picker;
    NSArray*  Schoolyear;
    NSArray*  SubjectOwn;
    NSArray*  SubjectTwo;
    NSArray*  SubjectThree;
    int Subject;
    NSArray*  System;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    // UIPickerのインスタンス化
    picker = [[UIPickerView alloc]init];
    
    // デリゲートを設定
    picker.delegate = self;
    
    // データソースを設定
    picker.dataSource = self;
    
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
    [self.view addSubview:picker];
    
    Schoolyear = [[NSMutableArray alloc] initWithObjects:@"1年生",@"２年生",@"3年生",nil];
    SubjectOwn = [[NSMutableArray alloc] initWithObjects:@"国語1",@"数学A",@"理科",@"世界史",@"英語",@"家庭科",nil];
    SubjectTwo = [[NSMutableArray alloc] initWithObjects:@"国語2",@"数学B",@"理科",@"日本史",@"美術",nil];
    SubjectThree = [[NSMutableArray alloc] initWithObjects:@"国語3",@"数学C",@"英語",nil];


    System = [[NSMutableArray alloc] initWithObjects:@"授業",@"テスト対策",nil];
    Subject=1;
    
}

/**
 * ピッカーに表示する列数を返す
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

/**
 * ピッカーに表示する行数を返す
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return Schoolyear.count;
            break;
            
        case 1: // 2列目
            switch (Subject) {
                case 1:
                    return SubjectOwn.count;
                    break;
                case 2:
                    return SubjectTwo.count;
                    break;
                case 3:
                    return SubjectThree.count;
                    break;
                default:
                    return 0;
                    break;
            }
            
            break;
            
        case 2: // 3列目
            return System.count;
            break;
            
            
            
        default:
            return 0;
            break;
    }

}

/**
 * 行のサイズを変更
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return 100.0;
            break;
            
        case 1: // 2列目
            return 100.0;
            break;
            
        case 2: // 3列目
            return 150.0;
            break;
            
            
            
        default:
            return 0;
            break;
    }
}

/**
 * ピッカーに表示する値を返す
 */
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   
    
    switch (component) {
            
            
        case 0: // 1列目
            return [NSString stringWithFormat:@"%@", Schoolyear[row]];
            
            break;
            
        case 1: // 2列目
            switch (Subject) {
                case 1:
                    return [NSString stringWithFormat:@"%@", SubjectOwn[row]];
                    break;
                case 2:
                    return [NSString stringWithFormat:@"%@", SubjectTwo[row]];
                    break;
                case 3:
                    return [NSString stringWithFormat:@"%@", SubjectThree[row]];
                    break;
                default:
                    return 0;
                    break;
            }
            return [NSString stringWithFormat:@"%@", SubjectOwn[row]];
            break;
            
        case 2: // 3列目
            return [NSString stringWithFormat:@"%@", System[row]];
            break;
            
        default:
            return 0;
            break;
    }
}

/**
 * ピッカーの選択行が決まったとき
 */
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 1列目の選択された行数を取得
    NSInteger val0 = [pickerView selectedRowInComponent:0];
    Subject = (int)val0+1;
    picker.dataSource = self;
    
    // 2列目の選択された行数を取得
    NSInteger val1 = [pickerView selectedRowInComponent:1];
    
    // 3列目の選択された行数を取得
    NSInteger val2 = [pickerView selectedRowInComponent:2];
    
    NSLog(@"1列目:%@行目が選択", Schoolyear[val0]);
    NSLog(@"2列目:%@行目が選択", SubjectOwn[val1]);
    NSLog(@"3列目:%@行目が選択", System[val2]);
    NSLog(@"%d", Subject);
}
@end
