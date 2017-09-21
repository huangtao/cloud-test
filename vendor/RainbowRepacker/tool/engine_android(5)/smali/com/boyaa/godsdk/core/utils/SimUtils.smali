.class public Lcom/boyaa/godsdk/core/utils/SimUtils;
.super Ljava/lang/Object;
.source "SimUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;
    }
.end annotation


# static fields
.field public static final IMSI:Ljava/lang/String; = "imsi"

.field public static final MCCMNC:Ljava/lang/String; = "mccmnc"

.field public static final OPERATOR:Ljava/lang/String; = "operator"

.field public static final PHONE:Ljava/lang/String; = "phone"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static filterUnNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 256
    const-string v2, "[^0-9]"

    .line 257
    .local v2, "regEx":Ljava/lang/String;
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 258
    .local v1, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 260
    .local v0, "m":Ljava/util/regex/Matcher;
    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getGaotong()I
    .locals 7

    .prologue
    .line 215
    :try_start_0
    const-string v4, "android.telephony.SmsManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getDefault"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 216
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 217
    const/4 v4, 0x0

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 219
    .local v3, "param":Ljava/lang/Object;
    const-string v4, "android.telephony.SmsManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getPreferredSmsSubscription"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 220
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 221
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 222
    .local v1, "index":Ljava/lang/Object;
    check-cast v1, Ljava/lang/Integer;

    .end local v1    # "index":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 228
    .end local v3    # "param":Ljava/lang/Object;
    :goto_0
    return v4

    .line 225
    :catch_0
    move-exception v0

    .line 226
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 228
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    const/4 v4, -0x1

    goto :goto_0

    .line 224
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method public static getImsi(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 270
    .line 271
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 270
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 272
    .local v0, "telManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, ""

    :goto_0
    return-object v1

    .line 273
    :cond_0
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static getImsi2(Landroid/content/Context;)Ljava/lang/String;
    .locals 15
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 128
    const-string v4, ""

    .line 131
    .local v4, "imsi":Ljava/lang/String;
    :try_start_0
    const-string v11, "phone"

    invoke-virtual {p0, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 130
    check-cast v9, Landroid/telephony/TelephonyManager;

    .line 132
    .local v9, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v9}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v4

    .line 133
    if-eqz v4, :cond_0

    const-string v11, ""

    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    :cond_0
    invoke-virtual {v9}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v4

    .line 134
    :cond_1
    const/4 v11, 0x1

    new-array v6, v11, [Ljava/lang/Class;

    const/4 v11, 0x0

    .line 135
    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v12, v6, v11

    .line 137
    .local v6, "resources":[Ljava/lang/Class;
    new-instance v7, Ljava/lang/Integer;

    const/4 v11, 0x1

    invoke-direct {v7, v11}, Ljava/lang/Integer;-><init>(I)V

    .line 138
    .local v7, "resourcesId":Ljava/lang/Integer;
    if-eqz v4, :cond_2

    const-string v11, ""

    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-result v11

    if-eqz v11, :cond_3

    .line 140
    :cond_2
    :try_start_1
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "getSubscriberIdGemini"

    invoke-virtual {v11, v12, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 141
    .local v0, "addMethod":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v0, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 142
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v7, v11, v12

    invoke-virtual {v0, v9, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "imsi":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 148
    .end local v0    # "addMethod":Ljava/lang/reflect/Method;
    .restart local v4    # "imsi":Ljava/lang/String;
    :cond_3
    :goto_0
    if-eqz v4, :cond_4

    :try_start_2
    const-string v11, ""

    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-result v11

    if-eqz v11, :cond_5

    .line 151
    :cond_4
    :try_start_3
    const-string v11, "com.android.internal.telephony.PhoneFactory"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 152
    .local v2, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v11, "getServiceName"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Class;

    const/4 v13, 0x0

    const-class v14, Ljava/lang/String;

    aput-object v14, v12, v13

    const/4 v13, 0x1

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v14, v12, v13

    invoke-virtual {v2, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 153
    .local v5, "m":Ljava/lang/reflect/Method;
    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const-string v13, "phone"

    aput-object v13, v11, v12

    const/4 v12, 0x1

    const/4 v13, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v5, v2, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 154
    .local v8, "spreadTmService":Ljava/lang/String;
    invoke-virtual {p0, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/telephony/TelephonyManager;

    .line 155
    .local v10, "tm1":Landroid/telephony/TelephonyManager;
    invoke-virtual {v10}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v4

    .line 161
    .end local v2    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "m":Ljava/lang/reflect/Method;
    .end local v8    # "spreadTmService":Ljava/lang/String;
    .end local v10    # "tm1":Landroid/telephony/TelephonyManager;
    :cond_5
    :goto_1
    if-eqz v4, :cond_6

    :try_start_4
    const-string v11, ""

    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    move-result v11

    if-eqz v11, :cond_7

    .line 163
    :cond_6
    :try_start_5
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "getSimSerialNumber"

    invoke-virtual {v11, v12, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 164
    .local v1, "addMethod2":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v1, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 165
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v7, v11, v12

    invoke-virtual {v1, v9, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "imsi":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 171
    .end local v1    # "addMethod2":Ljava/lang/reflect/Method;
    .restart local v4    # "imsi":Ljava/lang/String;
    :cond_7
    :goto_2
    if-eqz v4, :cond_8

    :try_start_6
    const-string v11, ""

    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    .line 172
    :cond_8
    const-string v4, "000000"
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    :cond_9
    move-object v11, v4

    .line 177
    .end local v6    # "resources":[Ljava/lang/Class;
    .end local v7    # "resourcesId":Ljava/lang/Integer;
    .end local v9    # "tm":Landroid/telephony/TelephonyManager;
    :goto_3
    return-object v11

    .line 144
    .end local v4    # "imsi":Ljava/lang/String;
    .restart local v6    # "resources":[Ljava/lang/Class;
    .restart local v7    # "resourcesId":Ljava/lang/Integer;
    .restart local v9    # "tm":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 145
    .local v3, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    .restart local v4    # "imsi":Ljava/lang/String;
    goto :goto_0

    .line 157
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v3

    .line 158
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    goto :goto_1

    .line 167
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "imsi":Ljava/lang/String;
    :catch_2
    move-exception v3

    .line 168
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    .restart local v4    # "imsi":Ljava/lang/String;
    goto :goto_2

    .line 176
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v6    # "resources":[Ljava/lang/Class;
    .end local v7    # "resourcesId":Ljava/lang/Integer;
    .end local v9    # "tm":Landroid/telephony/TelephonyManager;
    :catch_3
    move-exception v3

    .line 177
    .restart local v3    # "e":Ljava/lang/Exception;
    const-string v11, "000000"

    goto :goto_3
.end method

.method private static getMTK(Landroid/content/Context;)I
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 183
    :try_start_0
    const-string v4, "phone"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 185
    .local v3, "tm":Landroid/telephony/TelephonyManager;
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getSmsDefaultSim"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 186
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 187
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 188
    .local v1, "index":Ljava/lang/Object;
    check-cast v1, Ljava/lang/Integer;

    .end local v1    # "index":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 194
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "tm":Landroid/telephony/TelephonyManager;
    :goto_0
    return v4

    .line 191
    :catch_0
    move-exception v0

    .line 192
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 194
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    const/4 v4, -0x1

    goto :goto_0

    .line 190
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method public static getMainCardIMSI(Landroid/content/Context;)Ljava/lang/String;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    const/4 v0, 0x0

    .line 45
    .local v0, "IMSI":Ljava/lang/String;
    :try_start_0
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->isDualMode(Landroid/content/Context;)Z

    move-result v3

    .line 46
    .local v3, "isDualMode":Z
    const-string v5, "cardType"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "isDualMode="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    if-eqz v3, :cond_2

    .line 48
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getMainCardIndex(Landroid/content/Context;)I

    move-result v2

    .line 49
    .local v2, "index":I
    const-string v5, "cardType"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "getMainCardIndex index="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    const/4 v5, -0x1

    if-eq v2, v5, :cond_0

    .line 52
    invoke-static {v2, p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 53
    const-string v5, "cardType"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "getSubscriberId(index) IMSI="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .end local v2    # "index":I
    .end local v3    # "isDualMode":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 70
    const-string v5, "phone"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    .line 71
    .local v4, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 72
    const-string v5, "cardType"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "null IMSI="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .end local v4    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_1
    return-object v0

    .line 58
    .restart local v3    # "isDualMode":Z
    :cond_2
    const/4 v5, 0x0

    :try_start_1
    invoke-static {v5, p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 59
    const-string v5, "cardType"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "getSubscriberId(0) IMSI="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_0

    .line 61
    :cond_3
    const/4 v5, 0x1

    invoke-static {v5, p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 62
    const-string v5, "cardType"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "getSubscriberId(1) IMSI="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 66
    .end local v3    # "isDualMode":Z
    :catch_0
    move-exception v1

    .line 67
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getMainCardIndex(Landroid/content/Context;)I
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, -0x1

    .line 86
    const/4 v1, 0x0

    .line 88
    .local v1, "index":I
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getMTK(Landroid/content/Context;)I

    move-result v1

    .line 89
    const-string v6, "cardType"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "getMTK index="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    if-ne v1, v5, :cond_0

    .line 91
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getSPR(Landroid/content/Context;)I

    move-result v1

    .line 92
    const-string v6, "cardType"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "getSPR index="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    if-ne v1, v5, :cond_0

    .line 95
    invoke-static {}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getGaotong()I

    move-result v1

    .line 96
    const-string v6, "cardType"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "getGaotong index="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    :cond_0
    if-eqz v1, :cond_1

    if-ne v1, v4, :cond_2

    .line 112
    .end local v1    # "index":I
    :cond_1
    :goto_0
    return v1

    .line 102
    .restart local v1    # "index":I
    :cond_2
    const-string v6, "phone"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 103
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 104
    .local v0, "IMSI":Ljava/lang/String;
    const-string v6, "cardType"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "IMSI="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    if-eqz v0, :cond_3

    invoke-static {v3, p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    move v1, v3

    .line 107
    goto :goto_0

    .line 109
    :cond_3
    if-eqz v0, :cond_4

    invoke-static {v4, p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    move v1, v4

    .line 110
    goto :goto_0

    :cond_4
    move v1, v5

    .line 112
    goto :goto_0
.end method

.method public static getMccMncNumber(Landroid/content/Context;)I
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    const/4 v0, -0x1

    .line 27
    .local v0, "mccmncNum":I
    const-string v3, "phone"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 28
    .local v2, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    .line 30
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getMainCardIMSI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 31
    .local v1, "operator":Ljava/lang/String;
    const-string v3, "cardType"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "operator="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    const/4 v3, 0x0

    const/4 v4, 0x5

    :try_start_0
    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 37
    .end local v1    # "operator":Ljava/lang/String;
    :cond_0
    :goto_0
    return v0

    .line 35
    .restart local v1    # "operator":Ljava/lang/String;
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static getPhoneNumber(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 239
    .line 240
    :try_start_0
    const-string v3, "phone"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 239
    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 241
    .local v1, "telManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    const-string v2, ""

    .line 243
    .local v2, "telNum":Ljava/lang/String;
    :goto_0
    if-eqz v2, :cond_0

    .line 244
    invoke-static {v2}, Lcom/boyaa/godsdk/core/utils/SimUtils;->filterUnNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 251
    .end local v1    # "telManager":Landroid/telephony/TelephonyManager;
    .end local v2    # "telNum":Ljava/lang/String;
    :cond_0
    :goto_1
    return-object v2

    .line 242
    .restart local v1    # "telManager":Landroid/telephony/TelephonyManager;
    :cond_1
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 248
    .end local v1    # "telManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v0

    .line 249
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 251
    const-string v2, ""

    goto :goto_1
.end method

.method private static getSPR(Landroid/content/Context;)I
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 199
    :try_start_0
    const-string v4, "phone"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 201
    .local v3, "tm":Landroid/telephony/TelephonyManager;
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getDefaultDataPhoneId"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 202
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 203
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 204
    .local v1, "index":Ljava/lang/Object;
    check-cast v1, Ljava/lang/Integer;

    .end local v1    # "index":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 210
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "tm":Landroid/telephony/TelephonyManager;
    :goto_0
    return v4

    .line 207
    :catch_0
    move-exception v0

    .line 208
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 210
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    const/4 v4, -0x1

    goto :goto_0

    .line 206
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method public static getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "cardIndex"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 117
    if-nez p0, :cond_0

    .line 118
    const-string v2, "phone"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 119
    .local v1, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 124
    .end local v1    # "telephonyManager":Landroid/telephony/TelephonyManager;
    .local v0, "imsi":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 122
    .end local v0    # "imsi":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getImsi2(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "imsi":Ljava/lang/String;
    goto :goto_0
.end method

.method public static isDualMode(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 79
    invoke-static {v3, p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, "imsi1":Ljava/lang/String;
    invoke-static {v2, p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, "imsi2":Ljava/lang/String;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    :goto_0
    return v2

    :cond_0
    move v2, v3

    goto :goto_0
.end method

.method public static isSimExsits(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 307
    .line 308
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 307
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 309
    .local v0, "mgr":Landroid/telephony/TelephonyManager;
    const/4 v1, 0x5

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
