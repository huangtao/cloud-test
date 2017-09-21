.class public Lcom/boyaa/engine/device/NetworkInfoImpl;
.super Ljava/lang/Object;
.source "NetworkInfoImpl.java"


# static fields
.field private static final NETWORK_TYPE_ETHERNET:I = 0x2

.field private static final NETWORK_TYPE_MOBILE:I = 0x0

.field private static final NETWORK_TYPE_UNK:I = 0x3

.field private static final NETWORK_TYPE_WIFI:I = 0x1

.field private static connManager:Landroid/net/ConnectivityManager;

.field private static isNetworkReg:Z

.field public static networkReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/engine/device/NetworkInfoImpl;->isNetworkReg:Z

    .line 43
    new-instance v0, Lcom/boyaa/engine/device/NetworkInfoImpl$1;

    invoke-direct {v0}, Lcom/boyaa/engine/device/NetworkInfoImpl$1;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/NetworkInfoImpl;->networkReceiver:Landroid/content/BroadcastReceiver;

    .line 54
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static enableConnectivityNetworkEvent(Z)V
    .locals 3
    .param p0, "enable"    # Z

    .prologue
    .line 57
    if-eqz p0, :cond_1

    .line 58
    sget-boolean v1, Lcom/boyaa/engine/device/NetworkInfoImpl;->isNetworkReg:Z

    if-nez v1, :cond_0

    .line 59
    const/4 v1, 0x1

    sput-boolean v1, Lcom/boyaa/engine/device/NetworkInfoImpl;->isNetworkReg:Z

    .line 60
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 61
    .local v0, "filter":Landroid/content/IntentFilter;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Lcom/boyaa/engine/device/NetworkInfoImpl;->networkReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 69
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_0
    :goto_0
    return-void

    .line 64
    :cond_1
    sget-boolean v1, Lcom/boyaa/engine/device/NetworkInfoImpl;->isNetworkReg:Z

    if-eqz v1, :cond_0

    .line 65
    const/4 v1, 0x0

    sput-boolean v1, Lcom/boyaa/engine/device/NetworkInfoImpl;->isNetworkReg:Z

    .line 66
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Lcom/boyaa/engine/device/NetworkInfoImpl;->networkReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    goto :goto_0
.end method

.method private static declared-synchronized getConnectivityManager()Landroid/net/ConnectivityManager;
    .locals 3

    .prologue
    .line 37
    const-class v1, Lcom/boyaa/engine/device/NetworkInfoImpl;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/engine/device/NetworkInfoImpl;->connManager:Landroid/net/ConnectivityManager;

    if-nez v0, :cond_0

    .line 38
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    sput-object v0, Lcom/boyaa/engine/device/NetworkInfoImpl;->connManager:Landroid/net/ConnectivityManager;

    .line 40
    :cond_0
    sget-object v0, Lcom/boyaa/engine/device/NetworkInfoImpl;->connManager:Landroid/net/ConnectivityManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 37
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static getMobileNetworkTypeName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 100
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v1

    .line 101
    .local v1, "manager":Landroid/telephony/TelephonyManager;
    const/4 v2, 0x0

    .line 104
    .local v2, "networkType":I
    :try_start_0
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkType()I
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 109
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 129
    const-string v3, "unknown"

    :goto_1
    return-object v3

    .line 105
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Ljava/lang/SecurityException;
    invoke-virtual {v0}, Ljava/lang/SecurityException;->printStackTrace()V

    goto :goto_0

    .line 115
    .end local v0    # "e":Ljava/lang/SecurityException;
    :pswitch_0
    const-string v3, "2g"

    goto :goto_1

    .line 125
    :pswitch_1
    const-string v3, "3g"

    goto :goto_1

    .line 127
    :pswitch_2
    const-string v3, "4g"

    goto :goto_1

    .line 109
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

.method public static getNetworkType()I
    .locals 3

    .prologue
    .line 77
    const/4 v1, 0x3

    .line 78
    .local v1, "type":I
    invoke-static {}, Lcom/boyaa/engine/device/NetworkInfoImpl;->getConnectivityManager()Landroid/net/ConnectivityManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 79
    .local v0, "info":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 80
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 95
    :cond_0
    :goto_0
    return v1

    .line 83
    :sswitch_0
    const/4 v1, 0x0

    .line 84
    goto :goto_0

    .line 86
    :sswitch_1
    const/4 v1, 0x1

    .line 87
    goto :goto_0

    .line 89
    :sswitch_2
    const/4 v1, 0x2

    .line 90
    goto :goto_0

    .line 80
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x4 -> :sswitch_0
        0x9 -> :sswitch_2
    .end sparse-switch
.end method

.method public static getNetworkTypeName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 134
    invoke-static {}, Lcom/boyaa/engine/device/NetworkInfoImpl;->getConnectivityManager()Landroid/net/ConnectivityManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 135
    .local v0, "info":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 136
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 141
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v1

    .line 144
    :goto_0
    return-object v1

    .line 139
    :sswitch_0
    invoke-static {}, Lcom/boyaa/engine/device/NetworkInfoImpl;->getMobileNetworkTypeName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 144
    :cond_0
    const-string v1, "unknown"

    goto :goto_0

    .line 136
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x4 -> :sswitch_0
    .end sparse-switch
.end method

.method public static init()V
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/engine/device/NetworkInfoImpl;->connManager:Landroid/net/ConnectivityManager;

    .line 34
    return-void
.end method

.method public static isNetworkConnected()Z
    .locals 2

    .prologue
    .line 72
    invoke-static {}, Lcom/boyaa/engine/device/NetworkInfoImpl;->getConnectivityManager()Landroid/net/ConnectivityManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 73
    .local v0, "info":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static native nativeEvent(Z)V
.end method

.method public static onNetworkEvent(Z)V
    .locals 2
    .param p0, "valid"    # Z

    .prologue
    .line 16
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/device/NetworkInfoImpl$2;

    invoke-direct {v1, p0}, Lcom/boyaa/engine/device/NetworkInfoImpl$2;-><init>(Z)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 22
    return-void
.end method
