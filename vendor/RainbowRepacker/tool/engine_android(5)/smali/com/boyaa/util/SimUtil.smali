.class public Lcom/boyaa/util/SimUtil;
.super Ljava/lang/Object;
.source "SimUtil.java"


# static fields
.field public static LOG_TAG:Ljava/lang/String; = null

.field public static final SIM_TYPE_CHINA_MOBILE:I = 0x1

.field public static final SIM_TYPE_CHINA_TELECOM:I = 0x3

.field public static final SIM_TYPE_CHINA_UNICOM:I = 0x2

.field public static final SIM_TYPE_NONE:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-string v0, "SimUtil"

    sput-object v0, Lcom/boyaa/util/SimUtil;->LOG_TAG:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 6

    .prologue
    .line 94
    const/4 v0, 0x0

    .line 95
    .local v0, "imei":Ljava/lang/String;
    sget-object v4, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v4}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v4

    .line 96
    const-string v5, "phone"

    .line 95
    invoke-virtual {v4, v5}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 97
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    if-eqz v2, :cond_0

    .line 98
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 100
    :cond_0
    if-nez v0, :cond_1

    .line 101
    sget-object v4, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v4}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v4

    .line 102
    const-string v5, "wifi"

    .line 101
    invoke-virtual {v4, v5}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 103
    .local v1, "mgr":Landroid/net/wifi/WifiManager;
    if-eqz v1, :cond_1

    .line 104
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v3

    .line 105
    .local v3, "wifiinfo":Landroid/net/wifi/WifiInfo;
    if-eqz v3, :cond_1

    .line 106
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v0

    .line 110
    .end local v1    # "mgr":Landroid/net/wifi/WifiManager;
    .end local v3    # "wifiinfo":Landroid/net/wifi/WifiInfo;
    :cond_1
    if-nez v0, :cond_2

    .line 111
    const-string v0, ""

    .line 113
    :cond_2
    return-object v0
.end method

.method public static getIccid()Ljava/lang/String;
    .locals 2

    .prologue
    .line 178
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v0

    .line 179
    .local v0, "iccid":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string v0, ""

    .end local v0    # "iccid":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static getImei()Ljava/lang/String;
    .locals 2

    .prologue
    .line 188
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 189
    .local v0, "imei":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string v0, ""

    .end local v0    # "imei":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static getImsi()Ljava/lang/String;
    .locals 2

    .prologue
    .line 183
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 184
    .local v0, "imsi":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string v0, ""

    .end local v0    # "imsi":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static getLocalIpAddress()Ljava/lang/String;
    .locals 7

    .prologue
    .line 160
    const-string v5, ""

    .line 162
    .local v5, "ip":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-nez v6, :cond_1

    .line 174
    .end local v0    # "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :goto_0
    return-object v5

    .line 163
    .restart local v0    # "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/NetworkInterface;

    .line 164
    .local v4, "intf":Ljava/net/NetworkInterface;
    invoke-virtual {v4}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "enumIpAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 165
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/InetAddress;

    .line 166
    .local v3, "inetAddress":Ljava/net/InetAddress;
    invoke-virtual {v3}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v6

    if-nez v6, :cond_2

    .line 167
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_1

    .line 171
    .end local v0    # "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    .end local v1    # "enumIpAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v3    # "inetAddress":Ljava/net/InetAddress;
    .end local v4    # "intf":Ljava/net/NetworkInterface;
    :catch_0
    move-exception v2

    .line 172
    .local v2, "ex":Ljava/net/SocketException;
    invoke-virtual {v2}, Ljava/net/SocketException;->printStackTrace()V

    goto :goto_0
.end method

.method public static getLocalMacAddress()Ljava/lang/String;
    .locals 5

    .prologue
    .line 145
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v4, "wifi"

    invoke-virtual {v3, v4}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    .line 146
    .local v2, "wifi":Landroid/net/wifi/WifiManager;
    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    .line 147
    .local v0, "info":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v1

    .line 148
    .local v1, "mac":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 149
    const-string v1, ""

    .line 151
    :cond_0
    return-object v1
.end method

.method public static getPhoneNumbers()Ljava/lang/String;
    .locals 5

    .prologue
    .line 119
    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v2

    .line 120
    const-string v3, "phone"

    .line 119
    invoke-virtual {v2, v3}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 121
    .local v1, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "line1Number":Ljava/lang/String;
    sget-object v2, Lcom/boyaa/util/SimUtil;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "getLine1Number:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    if-nez v0, :cond_0

    const-string v0, ""

    .end local v0    # "line1Number":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static getSimOperator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSimType()I
    .locals 4

    .prologue
    .line 39
    const/4 v0, -0x1

    .line 41
    .local v0, "type":I
    invoke-static {}, Lcom/boyaa/util/SimUtil;->isChinaMobile()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 42
    const/4 v0, 0x1

    .line 49
    :cond_0
    :goto_0
    sget-object v1, Lcom/boyaa/util/SimUtil;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getSimType:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    return v0

    .line 43
    :cond_1
    invoke-static {}, Lcom/boyaa/util/SimUtil;->isChinaUnicom()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 44
    const/4 v0, 0x2

    .line 45
    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/boyaa/util/SimUtil;->isChinaTelecom()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 46
    const/4 v0, 0x3

    goto :goto_0
.end method

.method public static getTelephonyManager()Landroid/telephony/TelephonyManager;
    .locals 3

    .prologue
    .line 84
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    .line 85
    const-string v2, "phone"

    .line 84
    invoke-virtual {v1, v2}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 86
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    return-object v0
.end method

.method public static isCanUseSim()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 129
    :try_start_0
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v3

    .line 130
    const-string v4, "phone"

    .line 129
    invoke-virtual {v3, v4}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 132
    .local v1, "mgr":Landroid/telephony/TelephonyManager;
    const/4 v3, 0x5

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimState()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-ne v3, v4, :cond_0

    const/4 v2, 0x1

    .line 136
    :cond_0
    :goto_0
    return v2

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static isChinaMobile()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 55
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "imsi":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 58
    :cond_0
    :goto_0
    return v1

    :cond_1
    const-string v2, "46000"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "46002"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "46007"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isChinaTelecom()Z
    .locals 2

    .prologue
    .line 71
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "imsi":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 73
    const/4 v1, 0x0

    .line 74
    :goto_0
    return v1

    :cond_0
    const-string v1, "46003"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public static isChinaUnicom()Z
    .locals 2

    .prologue
    .line 63
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, "imsi":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 65
    const/4 v1, 0x0

    .line 66
    :goto_0
    return v1

    :cond_0
    const-string v1, "46001"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method
