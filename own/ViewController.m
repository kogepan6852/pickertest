//
//  ViewController.m
//  picker_under
//
//  Created by 堅固潤也 on 2015/04/14.
//  Copyright (c) 2015年 JunyaKengo. All rights reserved.
//
//
//  ViewController.m
//  own
//
//  Created by 堅固潤也 on 2015/04/09.
//  Copyright (c) 2015年 JunyaKengo. All rights reserved.
//

#import "ViewController.h"

@interface Subject : NSObject
@property (nonatomic, strong) NSArray *oneYearArray;
@property (nonatomic, strong) NSArray *twoYearArray;
@property (nonatomic, strong) NSArray *threeYearArray;
@property (nonatomic, strong) NSArray *selectYearArray;
@property (nonatomic, assign) NSInteger selectYearInt;

@end

@implementation Subject
@end


@implementation ViewController {
    Subject *subject;
    UIPickerView *picker;
    NSArray *systemArray;
    NSMutableString *selectPicker;
    UILabel *label;
    UILabel *label2;
    UILabel *label3;
    UIAlertController *alertController;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 10, 0, 0)];
    picker.delegate = self;
    picker.dataSource = self;
    [picker setShowsSelectionIndicator:YES];
    [picker selectRow:0 inComponent:0 animated:YES];
    
    subject = [[Subject alloc]init];
    subject.selectYearArray = [[NSMutableArray alloc] initWithObjects:@"1年生",@"２年生",@"3年生",nil];
    subject.oneYearArray = [[NSMutableArray alloc] initWithObjects:@"国語1",@"数学A",@"理科",@"世界史",@"英語",@"家庭科",nil];
    subject.twoYearArray = [[NSMutableArray alloc] initWithObjects:@"国語2",@"数学B",@"理科",@"日本史",@"美術",nil];
    subject.threeYearArray = [[NSMutableArray alloc] initWithObjects:@"国語3",@"数学C",@"英語",nil];
    systemArray = [[NSMutableArray alloc] initWithObjects:@"授業",@"テスト対策",nil];
    subject.selectYearInt=1;
    
    UIButton *button =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.center = CGPointMake(150, 250);
    [button setTitle:@"ピッカー呼び出しボタン"
            forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(button_Tapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    alertController
    = [UIAlertController alertControllerWithTitle:@"学年　科目　モードを"
                                          message:@"選択しよう"
                                   preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // アクション1 の処理
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // アクション2 の処理
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // アクション3 の処理
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // アクション4 の処理
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"閉じる" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}]];
    
    
    [alertController.view addSubview:picker];
    [self.view bringSubviewToFront:picker];
    
    
    // ラベルの設置
    CGRect rect = CGRectMake(10, 10, 300, 100);
    CGRect rect2 = CGRectMake(80, 10, 300, 100);
    CGRect rect3 = CGRectMake(150, 10, 300, 100);
    label = [[UILabel alloc]initWithFrame:rect];
    label.text = @"学年";
    label.font = [UIFont fontWithName:@"Helvetica" size:16];
    label.numberOfLines = 0; // 0の場合は無制限
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    label2 = [[UILabel alloc]initWithFrame:rect2];
    label2.text = @"教科";
    label2.font = [UIFont fontWithName:@"Helvetica" size:16];
    label2.numberOfLines = 0; // 0の場合は無制限
    label2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label2];
    
    label3 = [[UILabel alloc]initWithFrame:rect3];
    label3.text = @"選択モード";
    label3.font = [UIFont fontWithName:@"Helvetica" size:16];
    label3.numberOfLines = 0; // 0の場合は無制限
    label3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label3];
    
    
    
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
            return subject.selectYearArray.count;
            break;
        case 1:
            switch (subject.selectYearInt) {
                case 1:
                    return subject.oneYearArray.count;
                    break;
                case 2:
                    return subject.twoYearArray.count;
                    break;
                case 3:
                    return subject.threeYearArray.count;
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
            return [NSString stringWithFormat:@"%@", subject.selectYearArray[row]];
            break;
        case 1:
            switch (subject.selectYearInt) {
                case 1:
                    return [NSString stringWithFormat:@"%@", subject.oneYearArray[row]];
                    break;
                case 2:
                    return [NSString stringWithFormat:@"%@", subject.twoYearArray[row]];
                    break;
                case 3:
                    return [NSString stringWithFormat:@"%@", subject.threeYearArray[row]];
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
    NSInteger val1 = [pickerView selectedRowInComponent:1];
    NSInteger val2 = [pickerView selectedRowInComponent:2];
    subject.selectYearInt = (int)val0+1;
    label.text= subject.selectYearArray[val0];
    switch (subject.selectYearInt) {
        case 1:
            selectPicker=subject.oneYearArray[val1];
            break;
        case 2:
            selectPicker=subject.twoYearArray[val1];
            break;
        case 3:
            selectPicker= subject.threeYearArray[val1];
            break;
    }
    
    
    label2.text = selectPicker;
    label3.text = systemArray[val2];
    [picker reloadAllComponents];
}

- (void)button_Tapped:(id)sender
{
    [picker reloadAllComponents];
    
    
    // 表示
    [self presentViewController:alertController animated:YES completion:nil];
    
}
@end

