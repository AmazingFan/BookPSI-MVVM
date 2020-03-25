package com.yf.bookpsi.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


public class SerialNumber {
    public static int snumber(){
        Random r = new Random();
        return r.nextInt(900000)+100000;

    }


}
