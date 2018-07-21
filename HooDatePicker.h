//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIControl.h"

#import "UIScrollViewDelegate.h"

@class NSCalendar, NSDate, NSDateFormatter, NSLocale, NSMutableArray, NSString, NSTimeZone, UIColor, UILabel, UIScrollView, UIView;

@interface HooDatePicker : UIControl <UIScrollViewDelegate>
{
    UIView *_lineDaysTop;
    UIView *_lineDaysBottom;
    UIView *_lineMonthsTop;
    UIView *_lineMonthsBottom;
    UIView *_lineYearsTop;
    UIView *_lineYearsBottom;
    UIView *_lineDatesTop;
    UIView *_lineDatesBottom;
    UIView *_lineHoursTop;
    UIView *_lineHoursBottom;
    UIView *_lineMinutesTop;
    UIView *_lineMinutesBottom;
    UIView *_lineSecondsTop;
    UIView *_lineSecondsBottom;
    NSMutableArray *_labelsDays;
    NSMutableArray *_labelsMonths;
    NSMutableArray *_labelsYears;
    NSMutableArray *_labelsDates;
    NSMutableArray *_labelsHours;
    NSMutableArray *_labelsMinutes;
    NSMutableArray *_labelsSeconds;
    long long _selectedDay;
    long long _selectedMonth;
    long long _selectedYear;
    long long _selectedDate;
    long long _selectedHour;
    long long _selectedMinute;
    long long _selectedSecond;
    _Bool _isInitialized;
    long long _minYear;
    _Bool _isOpen;
    NSString *_title;
    NSDate *_date;
    NSDate *_minimumDate;
    NSDate *_maximumDate;
    long long _datePickerMode;
    NSLocale *_locale;
    NSCalendar *_calendar;
    NSTimeZone *_timeZone;
    id <HooDatePickerDelegate> _delegate;
    NSMutableArray *_years;
    NSMutableArray *_months;
    NSMutableArray *_days;
    NSMutableArray *_dates;
    NSMutableArray *_hours;
    NSMutableArray *_minutes;
    NSMutableArray *_seconds;
    UIScrollView *_scrollViewYears;
    UIScrollView *_scrollViewMonths;
    UIScrollView *_scrollViewDays;
    UIScrollView *_scrollViewDates;
    UIScrollView *_scrollViewHours;
    UIScrollView *_scrollViewMinutes;
    UIScrollView *_scrollViewSeconds;
    UIView *_superView;
    UIView *_dimBackgroundView;
    UILabel *_titleLabel;
    UIView *_headerView;
    UIColor *_tintColor;
    UIColor *_highlightColor;
    NSDateFormatter *_dateFormatter;
}

@property(retain, nonatomic) NSDateFormatter *dateFormatter; // @synthesize dateFormatter=_dateFormatter;
@property(retain, nonatomic) UIColor *highlightColor; // @synthesize highlightColor=_highlightColor;
@property(retain, nonatomic) UIColor *tintColor; // @synthesize tintColor=_tintColor;
@property(retain, nonatomic) UIView *headerView; // @synthesize headerView=_headerView;
@property(retain, nonatomic) UILabel *titleLabel; // @synthesize titleLabel=_titleLabel;
@property(copy, nonatomic) UIView *dimBackgroundView; // @synthesize dimBackgroundView=_dimBackgroundView;
@property(nonatomic) __weak UIView *superView; // @synthesize superView=_superView;
@property(retain, nonatomic) UIScrollView *scrollViewSeconds; // @synthesize scrollViewSeconds=_scrollViewSeconds;
@property(retain, nonatomic) UIScrollView *scrollViewMinutes; // @synthesize scrollViewMinutes=_scrollViewMinutes;
@property(retain, nonatomic) UIScrollView *scrollViewHours; // @synthesize scrollViewHours=_scrollViewHours;
@property(retain, nonatomic) UIScrollView *scrollViewDates; // @synthesize scrollViewDates=_scrollViewDates;
@property(retain, nonatomic) UIScrollView *scrollViewDays; // @synthesize scrollViewDays=_scrollViewDays;
@property(retain, nonatomic) UIScrollView *scrollViewMonths; // @synthesize scrollViewMonths=_scrollViewMonths;
@property(retain, nonatomic) UIScrollView *scrollViewYears; // @synthesize scrollViewYears=_scrollViewYears;
@property(retain, nonatomic) NSMutableArray *seconds; // @synthesize seconds=_seconds;
@property(retain, nonatomic) NSMutableArray *minutes; // @synthesize minutes=_minutes;
@property(retain, nonatomic) NSMutableArray *hours; // @synthesize hours=_hours;
@property(retain, nonatomic) NSMutableArray *dates; // @synthesize dates=_dates;
@property(retain, nonatomic) NSMutableArray *days; // @synthesize days=_days;
@property(retain, nonatomic) NSMutableArray *months; // @synthesize months=_months;
@property(retain, nonatomic) NSMutableArray *years; // @synthesize years=_years;
@property(nonatomic) __weak id <HooDatePickerDelegate> delegate; // @synthesize delegate=_delegate;
@property(readonly, nonatomic) _Bool isOpen; // @synthesize isOpen=_isOpen;
@property(retain, nonatomic) NSTimeZone *timeZone; // @synthesize timeZone=_timeZone;
@property(copy, nonatomic) NSCalendar *calendar; // @synthesize calendar=_calendar;
@property(retain, nonatomic) NSLocale *locale; // @synthesize locale=_locale;
@property(nonatomic) long long datePickerMode; // @synthesize datePickerMode=_datePickerMode;
@property(retain, nonatomic) NSDate *maximumDate; // @synthesize maximumDate=_maximumDate;
@property(retain, nonatomic) NSDate *minimumDate; // @synthesize minimumDate=_minimumDate;
@property(retain, nonatomic) NSDate *date; // @synthesize date=_date;
@property(copy, nonatomic) NSString *title; // @synthesize title=_title;
- (void).cxx_destruct;
- (id)getDate;
- (id)convertToDate:(long long)arg1 hours:(long long)arg2 minutes:(long long)arg3 seconds:(long long)arg4;
- (id)convertToDateDay:(long long)arg1 month:(long long)arg2 year:(long long)arg3 hours:(long long)arg4 minutes:(long long)arg5 seconds:(long long)arg6;
- (void)setDate:(id)arg1 animated:(_Bool)arg2;
- (void)highlightLabelInArray:(id)arg1 atIndex:(long long)arg2;
- (void)setScrollView:(id)arg1 atIndex:(long long)arg2 animated:(_Bool)arg3;
- (int)getIndexForScrollViewPosition:(id)arg1;
- (void)updateNumberOfDays;
- (void)updateSelectedDateAtIndex:(int)arg1 forScrollView:(id)arg2;
- (void)scrollViewDidEndDecelerating:(id)arg1;
- (void)scrollViewDidEndDragging:(id)arg1 willDecelerate:(_Bool)arg2;
- (void)scrollViewDidScroll:(id)arg1;
- (void)singleTapGestureSecondsCaptured:(id)arg1;
- (void)singleTapGestureMinutesCaptured:(id)arg1;
- (void)singleTapGestureHoursCaptured:(id)arg1;
- (void)singleTapGestureDatesCaptured:(id)arg1;
- (void)singleTapGestureYearsCaptured:(id)arg1;
- (void)singleTapGestureMonthsCaptured:(id)arg1;
- (void)singleTapGestureDaysCaptured:(id)arg1;
- (id)getDaysInMonth:(id)arg1;
- (id)getDates;
- (id)getYears;
- (void)dismiss;
- (void)show;
- (void)actionButtonValid:(id)arg1;
- (void)actionButtonCancel:(id)arg1;
- (void)actionOther:(id)arg1;
- (void)removeSelectorSeconds;
- (void)buildSelectorLabelsSeconds;
- (void)buildSelectorSecondsOffsetX:(double)arg1 andWidth:(double)arg2;
- (void)removeSelectorMinutes;
- (void)buildSelectorLabelsMinutes;
- (void)buildSelectorMinutesOffsetX:(double)arg1 andWidth:(double)arg2;
- (void)removeSelectorHours;
- (void)buildSelectorLabelsHours;
- (void)buildSelectorHoursOffsetX:(double)arg1 andWidth:(double)arg2;
- (void)removeSelectorDates;
- (void)buildSelectorLabelsDates;
- (void)buildSelectorDatesOffsetX:(double)arg1 andWidth:(double)arg2;
- (void)removeSelectorYears;
- (void)buildSelectorLabelsYears;
- (void)buildSelectorYearsOffsetX:(double)arg1 andWidth:(double)arg2;
- (void)removeSelectorMonths;
- (void)buildSelectorLabelsMonths;
- (void)buildSelectorMonthsOffsetX:(double)arg1 andWidth:(double)arg2;
- (void)removeSelectorDays;
- (void)buildSelectorLabelsDays;
- (void)buildSelectorDaysOffsetX:(double)arg1 andWidth:(double)arg2;
- (void)setupControl;
- (id)initDatePickerMode:(long long)arg1 minDate:(id)arg2 maxMamDate:(id)arg3 andAddToSuperView:(id)arg4;
- (id)initDatePickerMode:(long long)arg1 andAddToSuperView:(id)arg2;
- (id)initWithSuperView:(id)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

