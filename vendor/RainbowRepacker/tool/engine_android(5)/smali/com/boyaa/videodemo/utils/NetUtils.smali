.class public Lcom/boyaa/videodemo/utils/NetUtils;
.super Ljava/lang/Object;
.source "NetUtils.java"


# static fields
.field public static APN:Ljava/lang/String; = null

.field private static final CMNET:I = 0x3

.field private static final CMWAP:I = 0x2

.field public static PROXY:Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "NetUtils"

.field private static final WIFI:I = 0x1

.field public static isNeedProxy:Z

.field public static proxyStr:Ljava/lang/String;


# instance fields
.field context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "content://telephony/carriers/preferapn"

    sput-object v0, Lcom/boyaa/videodemo/utils/NetUtils;->APN:Ljava/lang/String;

    .line 20
    const-string v0, "proxy"

    sput-object v0, Lcom/boyaa/videodemo/utils/NetUtils;->PROXY:Ljava/lang/String;

    .line 21
    const-string v0, "10.0.0.172"

    sput-object v0, Lcom/boyaa/videodemo/utils/NetUtils;->proxyStr:Ljava/lang/String;

    .line 22
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/videodemo/utils/NetUtils;->isNeedProxy:Z

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    .line 29
    return-void
.end method

.method public static GetNetworkType(Landroid/content/Context;)I
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 188
    const/4 v2, 0x2

    .line 189
    .local v2, "iNetType":I
    const-string v5, "connectivity"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 190
    .local v1, "connMgr":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    .line 192
    .local v3, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 194
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 196
    const/4 v2, 0x6

    .line 248
    :cond_0
    :goto_0
    const-string v5, "BoyaaReceiver"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Network Type : "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    return v2

    .line 198
    :cond_1
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v5

    if-nez v5, :cond_0

    .line 200
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "_strSubTypeName":Ljava/lang/String;
    const-string v5, "BoyaaReceiver"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Network getSubtypeName : "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v4

    .line 206
    .local v4, "networkType":I
    packed-switch v4, :pswitch_data_0

    .line 230
    const-string v5, "TD-SCDMA"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "WCDMA"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "CDMA2000"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 232
    :cond_2
    const/4 v2, 0x3

    .line 242
    :cond_3
    :goto_1
    const-string v5, "BoyaaReceiver"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Network getSubtype : "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 212
    :pswitch_0
    const/4 v2, 0x2

    .line 213
    goto :goto_1

    .line 223
    :pswitch_1
    const/4 v2, 0x3

    .line 224
    goto :goto_1

    .line 226
    :pswitch_2
    const/4 v2, 0x4

    .line 227
    goto :goto_1

    .line 246
    .end local v0    # "_strSubTypeName":Ljava/lang/String;
    .end local v4    # "networkType":I
    :cond_4
    const/4 v2, -0x1

    goto :goto_0

    .line 206
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

.method public static getNetworkType(Landroid/content/Context;)I
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 160
    const/4 v2, -0x1

    .line 161
    .local v2, "netType":I
    const-string v5, "connectivity"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 162
    .local v0, "connMgr":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v4

    .line 164
    .local v4, "networkInfo":Landroid/net/NetworkInfo;
    if-nez v4, :cond_0

    move v3, v2

    .line 180
    .end local v2    # "netType":I
    .local v3, "netType":I
    :goto_0
    return v3

    .line 167
    .end local v3    # "netType":I
    .restart local v2    # "netType":I
    :cond_0
    invoke-virtual {v4}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    .line 168
    .local v1, "nType":I
    if-nez v1, :cond_3

    .line 169
    const-string v5, "NetUtils"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "networkInfo.getExtraInfo() is "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    invoke-virtual {v4}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    const-string v6, "cmnet"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 171
    const/4 v2, 0x3

    :cond_1
    :goto_1
    move v3, v2

    .line 180
    .end local v2    # "netType":I
    .restart local v3    # "netType":I
    goto :goto_0

    .line 174
    .end local v3    # "netType":I
    .restart local v2    # "netType":I
    :cond_2
    const/4 v2, 0x2

    .line 176
    goto :goto_1

    .line 177
    :cond_3
    const/4 v5, 0x1

    if-ne v1, v5, :cond_1

    .line 178
    const/4 v2, 0x1

    goto :goto_1
.end method


# virtual methods
.method public isGprsWork()Z
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 90
    iget-object v5, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    if-nez v5, :cond_1

    move v1, v4

    .line 109
    :cond_0
    :goto_0
    return v1

    .line 94
    :cond_1
    const/4 v1, 0x0

    .line 96
    .local v1, "iswork":Z
    iget-object v5, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    .line 97
    const-string v6, "connectivity"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 96
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 101
    .local v0, "connManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v4}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 102
    .local v2, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_0

    .line 103
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    .line 105
    .local v3, "state":Landroid/net/NetworkInfo$State;
    sget-object v4, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v4, v3, :cond_0

    .line 106
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public isNeedProxy()Z
    .locals 12

    .prologue
    const/4 v0, 0x0

    .line 117
    const/4 v8, 0x0

    .line 118
    .local v8, "isNeedProxy":Z
    iget-object v2, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    if-nez v2, :cond_1

    .line 151
    :cond_0
    :goto_0
    return v0

    .line 122
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    .line 123
    const-string v3, "wifi"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    .line 122
    check-cast v11, Landroid/net/wifi/WifiManager;

    .line 126
    .local v11, "wifiManager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v11}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v2

    if-nez v2, :cond_3

    .line 128
    iget-object v2, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/boyaa/videodemo/utils/PhoneInfoUtils;->getImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    .line 129
    .local v7, "imsi":Ljava/lang/String;
    if-eqz v7, :cond_0

    const-string v2, ""

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "46001"

    invoke-virtual {v7, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 133
    sget-object v0, Lcom/boyaa/videodemo/utils/NetUtils;->APN:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 134
    .local v1, "uri":Landroid/net/Uri;
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x0

    .line 135
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 134
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 136
    .local v9, "mCursor":Landroid/database/Cursor;
    if-eqz v9, :cond_3

    .line 137
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    .line 139
    sget-object v0, Lcom/boyaa/videodemo/utils/NetUtils;->PROXY:Ljava/lang/String;

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 138
    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 141
    .local v10, "proxyStr":Ljava/lang/String;
    if-eqz v10, :cond_2

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 142
    const/4 v8, 0x1

    .line 143
    sput-object v10, Lcom/boyaa/videodemo/utils/NetUtils;->proxyStr:Ljava/lang/String;

    .line 145
    :cond_2
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "uri":Landroid/net/Uri;
    .end local v7    # "imsi":Ljava/lang/String;
    .end local v9    # "mCursor":Landroid/database/Cursor;
    .end local v10    # "proxyStr":Ljava/lang/String;
    .end local v11    # "wifiManager":Landroid/net/wifi/WifiManager;
    :cond_3
    :goto_1
    move v0, v8

    .line 151
    goto :goto_0

    .line 148
    :catch_0
    move-exception v6

    .line 149
    .local v6, "e":Ljava/lang/Exception;
    const-string v0, "NetUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "T\uff1a017:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public isNetWork()Z
    .locals 6

    .prologue
    .line 35
    iget-object v4, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    if-nez v4, :cond_1

    .line 36
    const/4 v1, 0x0

    .line 53
    :cond_0
    :goto_0
    return v1

    .line 39
    :cond_1
    const/4 v1, 0x0

    .line 41
    .local v1, "iswork":Z
    iget-object v4, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    .line 42
    const-string v5, "connectivity"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 41
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 45
    .local v0, "connManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 46
    .local v2, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_0

    .line 47
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    .line 49
    .local v3, "state":Landroid/net/NetworkInfo$State;
    sget-object v4, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v4, v3, :cond_0

    .line 50
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public isWifiWork()Z
    .locals 6

    .prologue
    .line 62
    iget-object v4, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    if-nez v4, :cond_1

    .line 63
    const/4 v1, 0x0

    .line 81
    :cond_0
    :goto_0
    return v1

    .line 66
    :cond_1
    const/4 v1, 0x0

    .line 68
    .local v1, "iswork":Z
    iget-object v4, p0, Lcom/boyaa/videodemo/utils/NetUtils;->context:Landroid/content/Context;

    .line 69
    const-string v5, "connectivity"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 68
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 73
    .local v0, "connManager":Landroid/net/ConnectivityManager;
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 74
    .local v2, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_0

    .line 75
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    .line 77
    .local v3, "state":Landroid/net/NetworkInfo$State;
    sget-object v4, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v4, v3, :cond_0

    .line 78
    const/4 v1, 0x1

    goto :goto_0
.end method
