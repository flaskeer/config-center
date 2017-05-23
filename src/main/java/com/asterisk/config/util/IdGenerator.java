package com.asterisk.config.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
public class IdGenerator {

    private static final int[] DEFAULT_CONFOUNDED = {3, 6, 7, 1, 8, 9, 5, 2};


    /**
     * 把一个输入整数置换为另一个数
     *
     * @param num        想要乱序的数
     * @param confounded 乱序因子, 长度要大于或等于想要乱序的数
     * @return 乱序结果, 长度为乱序因子这个数组的长度
     */
    private static long confuse(long num, int[] confounded) {
        int numLength = String.valueOf(num).length();
        int length = confounded.length;

        //检查输入数值是否过大
        if (length < numLength) {
            throw new IllegalArgumentException(
                    "confounded length must greater then number length, " + length + " : " + numLength);
        }

        long output = 0L;

        int confoundedIndex = (int) (num % 10 % 8);
        int paddingLength = length - numLength;

        for (int i = 0; i < paddingLength; i++) {
            confoundedIndex = (confoundedIndex + 1) % 8;
            output = output * 10 + (confounded[confoundedIndex] % 10);
        }

        for (int i = 0; i < numLength; i++) {
            confoundedIndex = (confoundedIndex + 1) % 8;
            output = (long) (output * 10 + ((num / Math.pow(10, numLength - i - 1.0) + confounded[confoundedIndex]) % 10));
        }

        return output;
    }


    public static String idGenerator(String appName) {
        return generateBizUID(233,appName, LocalDateTime.now().toString());
    }

    private static String generateBizUID(long sequence, String bizFlag, String dateStr) {

        return bizFlag + dateStr + confuse(sequence, DEFAULT_CONFOUNDED);
    }

}
