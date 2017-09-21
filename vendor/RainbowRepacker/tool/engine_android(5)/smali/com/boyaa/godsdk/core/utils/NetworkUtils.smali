.class public Lcom/boyaa/godsdk/core/utils/NetworkUtils;
.super Ljava/lang/Object;
.source "NetworkUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/godsdk/core/utils/NetworkUtils$SimEntity;
    }
.end annotation


# static fields
.field public static final IMSI:Ljava/lang/String; = "imsi"

.field public static final MCCMNC:Ljava/lang/String; = "mccmnc"

.field public static final OPERATOR:Ljava/lang/String; = "operator"

.field public static final PHONE:Ljava/lang/String; = "phone"

.field private static final TAG:Ljava/lang/String;

.field private static final mDebug:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugMode()Z

    move-result v0

    sput-boolean v0, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->mDebug:Z

    .line 37
    const-class v0, Lcom/boyaa/godsdk/core/utils/NetworkUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->TAG:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static debug(Ljava/lang/String;)V
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 267
    sget-boolean v0, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->mDebug:Z

    if-eqz v0, :cond_0

    .line 268
    sget-object v0, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->TAG:Ljava/lang/String;

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    :cond_0
    return-void
.end method

.method public static filterUnNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 635
    const-string v2, "[^0-9]"

    .line 636
    .local v2, "regEx":Ljava/lang/String;
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 637
    .local v1, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 639
    .local v0, "m":Ljava/util/regex/Matcher;
    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getGPRSLocalIpAddress()Ljava/lang/String;
    .locals 7

    .prologue
    .line 126
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_1

    .line 141
    :goto_0
    const/4 v5, 0x0

    :goto_1
    return-object v5

    .line 127
    :cond_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/NetworkInterface;

    .line 129
    .local v4, "intf":Ljava/net/NetworkInterface;
    invoke-virtual {v4}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "enumIpAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 130
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/InetAddress;

    .line 131
    .local v3, "inetAddress":Ljava/net/InetAddress;
    invoke-virtual {v3}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v5

    if-nez v5, :cond_2

    .line 132
    invoke-virtual {v3}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v5

    if-nez v5, :cond_2

    .line 133
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "IP address:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 134
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_1

    .line 138
    .end local v1    # "enumIpAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v3    # "inetAddress":Ljava/net/InetAddress;
    .end local v4    # "intf":Ljava/net/NetworkInterface;
    :catch_0
    move-exception v2

    .line 139
    .local v2, "ex":Ljava/net/SocketException;
    sget-object v5, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->TAG:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/net/SocketException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static getGaotong()I
    .locals 7

    .prologue
    .line 617
    :try_start_0
    const-string v4, "android.telephony.SmsManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getDefault"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 618
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 619
    const/4 v4, 0x0

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 621
    .local v3, "param":Ljava/lang/Object;
    const-string v4, "android.telephony.SmsManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getPreferredSmsSubscription"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 622
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 623
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 624
    .local v1, "index":Ljava/lang/Object;
    check-cast v1, Ljava/lang/Integer;

    .end local v1    # "index":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 630
    .end local v3    # "param":Ljava/lang/Object;
    :goto_0
    return v4

    .line 627
    :catch_0
    move-exception v0

    .line 628
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 630
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    const/4 v4, -0x1

    goto :goto_0

    .line 626
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method public static getHostIp()Ljava/lang/String;
    .locals 7

    .prologue
    .line 152
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_1

    .line 169
    :goto_0
    const/4 v5, 0x0

    :goto_1
    return-object v5

    .line 153
    :cond_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/NetworkInterface;

    .line 154
    .local v3, "intf":Ljava/net/NetworkInterface;
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v4

    .line 155
    .local v4, "ipAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_2
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 156
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/InetAddress;

    .line 157
    .local v2, "inetAddress":Ljava/net/InetAddress;
    invoke-virtual {v2}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v5

    if-nez v5, :cond_2

    .line 158
    invoke-virtual {v2}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v5

    if-nez v5, :cond_2

    .line 159
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "IP address:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 160
    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    goto :goto_1

    .line 164
    .end local v2    # "inetAddress":Ljava/net/InetAddress;
    .end local v3    # "intf":Ljava/net/NetworkInterface;
    .end local v4    # "ipAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :catch_0
    move-exception v1

    .line 165
    .local v1, "ex":Ljava/net/SocketException;
    invoke-virtual {v1}, Ljava/net/SocketException;->printStackTrace()V

    goto :goto_0

    .line 166
    .end local v1    # "ex":Ljava/net/SocketException;
    :catch_1
    move-exception v1

    .line 167
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getIMEI(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    .line 53
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 52
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 54
    .local v0, "mManager":Landroid/telephony/TelephonyManager;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "IMEI:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 55
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getIMSI(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 67
    .line 68
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 67
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 69
    .local v0, "mManager":Landroid/telephony/TelephonyManager;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "IMSI:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 70
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getIPAddressOnWifi(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 110
    .line 111
    const-string v2, "wifi"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 110
    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 112
    .local v1, "mWifiManager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    .line 113
    .local v0, "mWifiInfo":Landroid/net/wifi/WifiInfo;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "IP address:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getIpAddress()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 114
    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getIpAddress()I

    move-result v2

    invoke-static {v2}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->intToIp(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getIccid2(Landroid/content/Context;)Ljava/lang/String;
    .locals 15
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 460
    const-string v4, ""

    .line 463
    .local v4, "iccid":Ljava/lang/String;
    :try_start_0
    const-string v11, "phone"

    invoke-virtual {p0, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 462
    check-cast v9, Landroid/telephony/TelephonyManager;

    .line 464
    .local v9, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v9}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v4

    .line 465
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-virtual {v9}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v4

    .line 466
    :cond_0
    const/4 v11, 0x1

    new-array v6, v11, [Ljava/lang/Class;

    const/4 v11, 0x0

    .line 467
    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v12, v6, v11

    .line 469
    .local v6, "resources":[Ljava/lang/Class;
    new-instance v7, Ljava/lang/Integer;

    const/4 v11, 0x1

    invoke-direct {v7, v11}, Ljava/lang/Integer;-><init>(I)V

    .line 470
    .local v7, "resourcesId":Ljava/lang/Integer;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-result v11

    if-eqz v11, :cond_1

    .line 472
    :try_start_1
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "getSimSerialNumberGemini"

    invoke-virtual {v11, v12, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 473
    .local v0, "addMethod":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v0, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 474
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v7, v11, v12

    invoke-virtual {v0, v9, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "iccid":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 480
    .end local v0    # "addMethod":Ljava/lang/reflect/Method;
    .restart local v4    # "iccid":Ljava/lang/String;
    :cond_1
    :goto_0
    :try_start_2
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-result v11

    if-eqz v11, :cond_2

    .line 483
    :try_start_3
    const-string v11, "com.android.internal.telephony.PhoneFactory"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 484
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

    .line 485
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

    .line 486
    .local v8, "spreadTmService":Ljava/lang/String;
    invoke-virtual {p0, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/telephony/TelephonyManager;

    .line 487
    .local v10, "tm1":Landroid/telephony/TelephonyManager;
    invoke-virtual {v10}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v4

    .line 493
    .end local v2    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "m":Ljava/lang/reflect/Method;
    .end local v8    # "spreadTmService":Ljava/lang/String;
    .end local v10    # "tm1":Landroid/telephony/TelephonyManager;
    :cond_2
    :goto_1
    :try_start_4
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    move-result v11

    if-eqz v11, :cond_3

    .line 495
    :try_start_5
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "getSimSerialNumber"

    invoke-virtual {v11, v12, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 496
    .local v1, "addMethod2":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v1, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 497
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v7, v11, v12

    invoke-virtual {v1, v9, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "iccid":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .end local v1    # "addMethod2":Ljava/lang/reflect/Method;
    .restart local v4    # "iccid":Ljava/lang/String;
    :cond_3
    :goto_2
    move-object v11, v4

    .line 506
    .end local v6    # "resources":[Ljava/lang/Class;
    .end local v7    # "resourcesId":Ljava/lang/Integer;
    .end local v9    # "tm":Landroid/telephony/TelephonyManager;
    :goto_3
    return-object v11

    .line 476
    .end local v4    # "iccid":Ljava/lang/String;
    .restart local v6    # "resources":[Ljava/lang/Class;
    .restart local v7    # "resourcesId":Ljava/lang/Integer;
    .restart local v9    # "tm":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 477
    .local v3, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    .restart local v4    # "iccid":Ljava/lang/String;
    goto :goto_0

    .line 489
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v3

    .line 490
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    goto :goto_1

    .line 499
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "iccid":Ljava/lang/String;
    :catch_2
    move-exception v3

    .line 500
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    .restart local v4    # "iccid":Ljava/lang/String;
    goto :goto_2

    .line 505
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v6    # "resources":[Ljava/lang/Class;
    .end local v7    # "resourcesId":Ljava/lang/Integer;
    .end local v9    # "tm":Landroid/telephony/TelephonyManager;
    :catch_3
    move-exception v3

    .line 506
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v11, 0x0

    goto :goto_3
.end method

.method public static getImsi(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 649
    .line 650
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 649
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 651
    .local v0, "telManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, ""

    :goto_0
    return-object v1

    .line 652
    :cond_0
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static getImsi2(Landroid/content/Context;)Ljava/lang/String;
    .locals 15
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 516
    const-string v4, ""

    .line 519
    .local v4, "imsi":Ljava/lang/String;
    :try_start_0
    const-string v11, "phone"

    invoke-virtual {p0, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 518
    check-cast v9, Landroid/telephony/TelephonyManager;

    .line 520
    .local v9, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v9}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v4

    .line 521
    if-eqz v4, :cond_0

    const-string v11, ""

    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    :cond_0
    invoke-virtual {v9}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v4

    .line 522
    :cond_1
    const/4 v11, 0x1

    new-array v6, v11, [Ljava/lang/Class;

    const/4 v11, 0x0

    .line 523
    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v12, v6, v11

    .line 525
    .local v6, "resources":[Ljava/lang/Class;
    new-instance v7, Ljava/lang/Integer;

    const/4 v11, 0x1

    invoke-direct {v7, v11}, Ljava/lang/Integer;-><init>(I)V

    .line 526
    .local v7, "resourcesId":Ljava/lang/Integer;
    if-eqz v4, :cond_2

    const-string v11, ""

    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-result v11

    if-eqz v11, :cond_3

    .line 528
    :cond_2
    :try_start_1
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "getSubscriberIdGemini"

    invoke-virtual {v11, v12, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 529
    .local v0, "addMethod":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v0, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 530
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

    .line 536
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

    .line 539
    :cond_4
    :try_start_3
    const-string v11, "com.android.internal.telephony.PhoneFactory"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 540
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

    .line 541
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

    .line 542
    .local v8, "spreadTmService":Ljava/lang/String;
    invoke-virtual {p0, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/telephony/TelephonyManager;

    .line 543
    .local v10, "tm1":Landroid/telephony/TelephonyManager;
    invoke-virtual {v10}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v4

    .line 549
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

    .line 551
    :cond_6
    :try_start_5
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "getSimSerialNumber"

    invoke-virtual {v11, v12, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 552
    .local v1, "addMethod2":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v1, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 553
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

    .line 559
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

    .line 560
    :cond_8
    const-string v4, "000000"
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    :cond_9
    move-object v11, v4

    .line 565
    .end local v6    # "resources":[Ljava/lang/Class;
    .end local v7    # "resourcesId":Ljava/lang/Integer;
    .end local v9    # "tm":Landroid/telephony/TelephonyManager;
    :goto_3
    return-object v11

    .line 532
    .end local v4    # "imsi":Ljava/lang/String;
    .restart local v6    # "resources":[Ljava/lang/Class;
    .restart local v7    # "resourcesId":Ljava/lang/Integer;
    .restart local v9    # "tm":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 533
    .local v3, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    .restart local v4    # "imsi":Ljava/lang/String;
    goto :goto_0

    .line 545
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v3

    .line 546
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    goto :goto_1

    .line 555
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "imsi":Ljava/lang/String;
    :catch_2
    move-exception v3

    .line 556
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    .restart local v4    # "imsi":Ljava/lang/String;
    goto :goto_2

    .line 564
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v6    # "resources":[Ljava/lang/Class;
    .end local v7    # "resourcesId":Ljava/lang/Integer;
    .end local v9    # "tm":Landroid/telephony/TelephonyManager;
    :catch_3
    move-exception v3

    .line 565
    .restart local v3    # "e":Ljava/lang/Exception;
    const-string v11, "000000"

    goto :goto_3
.end method

.method public static getMAC(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 201
    .line 202
    const-string v2, "wifi"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 201
    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 203
    .local v1, "mWifiManager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    .line 204
    .local v0, "mWifiInfo":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getMTK(Landroid/content/Context;)I
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 575
    :try_start_0
    const-string v4, "phone"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 577
    .local v3, "tm":Landroid/telephony/TelephonyManager;
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getSmsDefaultSim"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 578
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 579
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 580
    .local v1, "index":Ljava/lang/Object;
    check-cast v1, Ljava/lang/Integer;

    .end local v1    # "index":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 586
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "tm":Landroid/telephony/TelephonyManager;
    :goto_0
    return v4

    .line 583
    :catch_0
    move-exception v0

    .line 584
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 586
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    const/4 v4, -0x1

    goto :goto_0

    .line 582
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method public static getMainCardICCID(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 342
    const/4 v0, 0x0

    .line 345
    .local v0, "ICCID":Ljava/lang/String;
    :try_start_0
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->isDualMode(Landroid/content/Context;)Z

    move-result v3

    .line 346
    .local v3, "isDualMode":Z
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "isDualMode="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 347
    if-eqz v3, :cond_1

    .line 348
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMainCardIndex(Landroid/content/Context;)I

    move-result v2

    .line 349
    .local v2, "index":I
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "getMainCardIndex index="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 351
    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    .line 352
    invoke-static {v2, p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSimSerialNumber(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 353
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "getSimSerialNumber("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") ICCID="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 368
    .end local v2    # "index":I
    .end local v3    # "isDualMode":Z
    :cond_0
    :goto_0
    return-object v0

    .line 357
    .restart local v3    # "isDualMode":Z
    :cond_1
    const/4 v4, 0x0

    invoke-static {v4, p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSimSerialNumber(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 358
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "getSimSerialNumber(0) ICCID="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 359
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 360
    const/4 v4, 0x1

    invoke-static {v4, p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 361
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "getSimSerialNumber(1) ICCID="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 365
    .end local v3    # "isDualMode":Z
    :catch_0
    move-exception v1

    .line 366
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getMainCardIMSI(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 299
    const/4 v0, 0x0

    .line 302
    .local v0, "IMSI":Ljava/lang/String;
    :try_start_0
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->isDualMode(Landroid/content/Context;)Z

    move-result v3

    .line 303
    .local v3, "isDualMode":Z
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "isDualMode="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 304
    if-eqz v3, :cond_2

    .line 305
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMainCardIndex(Landroid/content/Context;)I

    move-result v2

    .line 306
    .local v2, "index":I
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "getMainCardIndex index="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 308
    const/4 v5, -0x1

    if-eq v2, v5, :cond_0

    .line 309
    invoke-static {v2, p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 310
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "getSubscriberId(index) IMSI="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 326
    .end local v2    # "index":I
    .end local v3    # "isDualMode":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 327
    const-string v5, "phone"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    .line 328
    .local v4, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 329
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "null IMSI="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 332
    .end local v4    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_1
    return-object v0

    .line 315
    .restart local v3    # "isDualMode":Z
    :cond_2
    const/4 v5, 0x0

    :try_start_1
    invoke-static {v5, p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 316
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "getSubscriberId(0) IMSI="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 317
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_0

    .line 318
    :cond_3
    const/4 v5, 0x1

    invoke-static {v5, p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 319
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "getSubscriberId(1) IMSI="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 323
    .end local v3    # "isDualMode":Z
    :catch_0
    move-exception v1

    .line 324
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getMainCardIndex(Landroid/content/Context;)I
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, -0x1

    .line 389
    const/4 v1, 0x0

    .line 391
    .local v1, "index":I
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMTK(Landroid/content/Context;)I

    move-result v1

    .line 392
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "getMTK index="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 393
    if-ne v1, v5, :cond_0

    .line 394
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSPR(Landroid/content/Context;)I

    move-result v1

    .line 395
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "getSPR index="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 397
    if-ne v1, v5, :cond_0

    .line 398
    invoke-static {}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getGaotong()I

    move-result v1

    .line 399
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "getGaotong index="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 402
    :cond_0
    if-eqz v1, :cond_1

    if-ne v1, v4, :cond_2

    .line 415
    .end local v1    # "index":I
    :cond_1
    :goto_0
    return v1

    .line 405
    .restart local v1    # "index":I
    :cond_2
    const-string v6, "phone"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 406
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 407
    .local v0, "IMSI":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "IMSI="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 409
    if-eqz v0, :cond_3

    invoke-static {v3, p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    move v1, v3

    .line 410
    goto :goto_0

    .line 412
    :cond_3
    if-eqz v0, :cond_4

    invoke-static {v4, p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    move v1, v4

    .line 413
    goto :goto_0

    :cond_4
    move v1, v5

    .line 415
    goto :goto_0
.end method

.method public static getMccMncNumber(Landroid/content/Context;)I
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 279
    const/4 v0, -0x1

    .line 280
    .local v0, "mccmncNum":I
    const-string v3, "phone"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 281
    .local v2, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    .line 283
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMainCardIMSI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 284
    .local v1, "operator":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "operator="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 286
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

    .line 290
    .end local v1    # "operator":Ljava/lang/String;
    :cond_0
    :goto_0
    return v0

    .line 288
    .restart local v1    # "operator":Ljava/lang/String;
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static getNetworkClass(I)Ljava/lang/String;
    .locals 1
    .param p0, "networkType"    # I

    .prologue
    .line 237
    packed-switch p0, :pswitch_data_0

    .line 257
    const-string v0, ""

    :goto_0
    return-object v0

    .line 243
    :pswitch_0
    const-string v0, "2g"

    goto :goto_0

    .line 253
    :pswitch_1
    const-string v0, "3g"

    goto :goto_0

    .line 255
    :pswitch_2
    const-string v0, "4g"

    goto :goto_0

    .line 237
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static getNetworkType(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 214
    const-string v3, ""

    .line 216
    .local v3, "type":Ljava/lang/String;
    const-string v4, "connectivity"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 215
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 217
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 218
    .local v1, "info":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 219
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 220
    const-string v3, "wifi"

    .line 225
    :cond_0
    :goto_0
    return-object v3

    .line 221
    :cond_1
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    if-nez v4, :cond_0

    .line 222
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v2

    .line 223
    .local v2, "subType":I
    invoke-static {v2}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getNetworkClass(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static getPhoneNumber(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 87
    .line 88
    :try_start_0
    const-string v3, "phone"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 87
    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 89
    .local v1, "mManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    const-string v2, ""

    .line 91
    .local v2, "telNum":Ljava/lang/String;
    :goto_0
    if-eqz v2, :cond_0

    .line 92
    invoke-static {v2}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->filterUnNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 94
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "PhoneNumber:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->debug(Ljava/lang/String;)V

    .line 100
    .end local v1    # "mManager":Landroid/telephony/TelephonyManager;
    .end local v2    # "telNum":Ljava/lang/String;
    :goto_1
    return-object v2

    .line 90
    .restart local v1    # "mManager":Landroid/telephony/TelephonyManager;
    :cond_1
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 97
    .end local v1    # "mManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 100
    const-string v2, ""

    goto :goto_1
.end method

.method private static getSPR(Landroid/content/Context;)I
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 596
    :try_start_0
    const-string v4, "phone"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 598
    .local v3, "tm":Landroid/telephony/TelephonyManager;
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getDefaultDataPhoneId"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 599
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 600
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 601
    .local v1, "index":Ljava/lang/Object;
    check-cast v1, Ljava/lang/Integer;

    .end local v1    # "index":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 607
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "tm":Landroid/telephony/TelephonyManager;
    :goto_0
    return v4

    .line 604
    :catch_0
    move-exception v0

    .line 605
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 607
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    const/4 v4, -0x1

    goto :goto_0

    .line 603
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method public static getSimSerialNumber(ILandroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "cardIndex"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 445
    if-nez p0, :cond_0

    .line 446
    const-string v2, "phone"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 447
    .local v1, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v0

    .line 452
    .end local v1    # "telephonyManager":Landroid/telephony/TelephonyManager;
    .local v0, "iccid":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 450
    .end local v0    # "iccid":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getIccid2(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "iccid":Ljava/lang/String;
    goto :goto_0
.end method

.method public static getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "cardIndex"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 426
    if-nez p0, :cond_0

    .line 427
    const-string v2, "phone"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 428
    .local v1, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 433
    .end local v1    # "telephonyManager":Landroid/telephony/TelephonyManager;
    .local v0, "imsi":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 431
    .end local v0    # "imsi":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getImsi2(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "imsi":Ljava/lang/String;
    goto :goto_0
.end method

.method public static intToIp(I)Ljava/lang/String;
    .locals 2
    .param p0, "i"    # I

    .prologue
    .line 190
    new-instance v0, Ljava/lang/StringBuilder;

    and-int/lit16 v1, p0, 0xff

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 191
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 190
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static intToIp2(I)Ljava/lang/String;
    .locals 2
    .param p0, "i"    # I

    .prologue
    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 180
    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    and-int/lit16 v1, p0, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 179
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isDualMode(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 377
    invoke-static {v3, p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 378
    .local v0, "imsi1":Ljava/lang/String;
    invoke-static {v2, p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getSubscriberId(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 379
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
    .line 686
    .line 687
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 686
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 688
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
