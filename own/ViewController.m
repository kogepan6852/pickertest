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
    NSArray *schoolYearArray;
    NSArray *oneYearSubjectArray;
    NSArray *twoYearSubjectArray;
    NSArray *threeYearSubjectArray;
    int selectYearInt;
    NSArray *systemArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    picker = [[UIPickerView alloc]init];
    picker.delegate = self;
    picker.dataSource = self;
    picker.showsSelectionIndicator = YES;
    [self.view addSubview:picker];
    
    schoolYearArray = [[NSMutableArray alloc] initWithObjects:@"1年生",@"２年生",@"3年生",nil];
    oneYearSubjectArray = [[NSMutableArray alloc] initWithObjects:@"国語1",@"数学A",@"理科",@"世界史",@"英語",@"家庭科",nil];
    twoYearSubjectArray = [[NSMutableArray alloc] initWithObjects:@"国語2",@"数学B",@"理科",@"日本史",@"美術",nil];
    threeYearSubjectArray = [[NSMutableArray alloc] initWithObjects:@"国語3",@"数学C",@"英語",nil];
    systemArray = [[NSMutableArray alloc] initWithObjects:@"授業",@"テスト対策",nil];
    selectYearInt=1;
}

#pragma mark - Picker DataSource Methods
//ピッカーに表示する列数を返す
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
//ピッカーに表示する行数を返す
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return schoolYearArray.count;
            break;
        case 1:
            switch (selectYearInt) {
                case 1:
                    return oneYearSubjectArray.count;
                    break;
                case 2:
                    return twoYearSubjectArray.count;
                    break;
                case 3:
                    return threeYearSubjectArray.count;
                    break;
                default:
                    return 0;
                    break;
            }
            break;
        case 2:
            return systemArray.count;
            break;
        default:
            return 0;
            break;
    }
}
//列のサイズを変更
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return 100.0;
            break;
        case 1:
            return 100.0;
            break;
        case 2:
            return 150.0;
            break;
        default:
            return 0;
            break;
    }
}
//ピッカーに表示する値を返す
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return [NSString stringWithFormat:@"%@", schoolYearArray[row]];
            break;
        case 1:
            switch (selectYearInt) {
                case 1:
                    return [NSString stringWithFormat:@"%@", oneYearSubjectArray[row]];
                    break;
                case 2:
                    return [NSString stringWithFormat:@"%@", twoYearSubjectArray[row]];
                    break;
                case 3:
                    return [NSString stringWithFormat:@"%@", threeYearSubjectArray[row]];
                    break;
                default:
                    return 0;
                    break;
            }
            break;
        case 2:
            return [NSString stringWithFormat:@"%@", systemArray[row]];
            break;
        default:
            return 0;
            break;
    }
}
//ピッカーの選択行が決まったとき
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSInteger val0 = [pickerView selectedRowInComponent:0];
    selectYearInt = (int)val0+1;
    [pickerView reloadAllComponents];
}
@end
