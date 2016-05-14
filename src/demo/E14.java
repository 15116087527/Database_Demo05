package demo;

import java.util.Scanner;

/**
 * Created by mingfei.net@gmail.com
 * 2016/5/14.
 */
// 输入某年某月某日，判断这一天是这一年的第几天
// 闰年： 西元年份除以400余数为0的，或者除以4为余数0且除以100余数不为0的，为闰年
public class E14 {

    private static int year;
    private static int month;
    private static int day;

    private static void getDate() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("input year: ");
        year = scanner.nextInt();
        System.out.println("input month: ");
        month = scanner.nextInt();
        System.out.println("input day: ");
        day = scanner.nextInt();
    }

    private static boolean isLeapYear() {
        return year % 400 == 0 || (year % 4 == 0 && year % 100 != 0);
    }

    private static int getDays() {
        int days = 0;
        switch (month) {
            case 1:
                days += day;
            case 2:
                days += day;
            case 3:
                days += day;
                days += isLeapYear()?1:0;
        }
        return days;
    }

    public static void main(String[] args) {
        getDate();

    }
}
