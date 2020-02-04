// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   MyUUid.java

package com.runqian.custom.function;

import com.runqian.report4.model.expression.Function;
import com.runqian.report4.usermodel.Context;
import java.util.UUID;

public class MyUUid extends Function
{

    public MyUUid()
    {
    }

    public Object calculate(Context ctx, boolean isInput)
    {
        String s = UUID.randomUUID().toString();
        String value = s.substring(0, 8) + s.substring(9, 13) + s.substring(14, 18) + s.substring(19, 23) + s.substring(24);
        return value;
    }
}
