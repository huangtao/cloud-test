.class public Lcom/boyaa/engine/device/PowerInfoImpl;
.super Ljava/lang/Object;
.source "PowerInfoImpl.java"


# static fields
.field private static final BATTERY_LOW:I = 0x1

.field private static final POWER_CONNECTED:I

.field private static isLowPowerReg:Z

.field private static isPowerConnectedReg:Z

.field private static lowPowerReceiver:Landroid/content/BroadcastReceiver;

.field private static powerConnectedReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 25
    sput-boolean v0, Lcom/boyaa/engine/device/PowerInfoImpl;->isPowerConnectedReg:Z

    .line 26
    sput-boolean v0, Lcom/boyaa/engine/device/PowerInfoImpl;->isLowPowerReg:Z

    .line 32
    new-instance v0, Lcom/boyaa/engine/device/PowerInfoImpl$1;

    invoke-direct {v0}, Lcom/boyaa/engine/device/PowerInfoImpl$1;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/PowerInfoImpl;->powerConnectedReceiver:Landroid/content/BroadcastReceiver;

    .line 44
    new-instance v0, Lcom/boyaa/engine/device/PowerInfoImpl$2;

    invoke-direct {v0}, Lcom/boyaa/engine/device/PowerInfoImpl$2;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/PowerInfoImpl;->lowPowerReceiver:Landroid/content/BroadcastReceiver;

    .line 56
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(IZ)V
    .locals 0

    .prologue
    .line 13
    invoke-static {p0, p1}, Lcom/boyaa/engine/device/PowerInfoImpl;->onPowerEvent(IZ)V

    return-void
.end method

.method public static enableLowPowerEvent(Z)V
    .locals 3
    .param p0, "enable"    # Z

    .prologue
    .line 76
    if-eqz p0, :cond_1

    .line 77
    sget-boolean v1, Lcom/boyaa/engine/device/PowerInfoImpl;->isLowPowerReg:Z

    if-nez v1, :cond_0

    .line 78
    const/4 v1, 0x1

    sput-boolean v1, Lcom/boyaa/engine/device/PowerInfoImpl;->isLowPowerReg:Z

    .line 79
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 80
    .local v0, "intent":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.BATTERY_LOW"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 81
    const-string v1, "android.intent.action.BATTERY_OKAY"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 82
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Lcom/boyaa/engine/device/PowerInfoImpl;->lowPowerReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 90
    .end local v0    # "intent":Landroid/content/IntentFilter;
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    sget-boolean v1, Lcom/boyaa/engine/device/PowerInfoImpl;->isLowPowerReg:Z

    if-eqz v1, :cond_0

    .line 86
    const/4 v1, 0x0

    sput-boolean v1, Lcom/boyaa/engine/device/PowerInfoImpl;->isLowPowerReg:Z

    .line 87
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Lcom/boyaa/engine/device/PowerInfoImpl;->lowPowerReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    goto :goto_0
.end method

.method public static enablePowerConnectionEvent(Z)V
    .locals 3
    .param p0, "enable"    # Z

    .prologue
    .line 59
    if-eqz p0, :cond_1

    .line 60
    sget-boolean v1, Lcom/boyaa/engine/device/PowerInfoImpl;->isPowerConnectedReg:Z

    if-nez v1, :cond_0

    .line 61
    const/4 v1, 0x1

    sput-boolean v1, Lcom/boyaa/engine/device/PowerInfoImpl;->isPowerConnectedReg:Z

    .line 62
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 63
    .local v0, "intent":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.ACTION_POWER_CONNECTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 64
    const-string v1, "android.intent.action.ACTION_POWER_DISCONNECTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 65
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Lcom/boyaa/engine/device/PowerInfoImpl;->powerConnectedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 73
    .end local v0    # "intent":Landroid/content/IntentFilter;
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    sget-boolean v1, Lcom/boyaa/engine/device/PowerInfoImpl;->isPowerConnectedReg:Z

    if-eqz v1, :cond_0

    .line 69
    const/4 v1, 0x0

    sput-boolean v1, Lcom/boyaa/engine/device/PowerInfoImpl;->isPowerConnectedReg:Z

    .line 70
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Lcom/boyaa/engine/device/PowerInfoImpl;->powerConnectedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    goto :goto_0
.end method

.method public static getBatteryLevel()F
    .locals 7

    .prologue
    const/4 v6, -0x1

    .line 93
    new-instance v1, Landroid/content/IntentFilter;

    const-string v4, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 94
    .local v1, "intent":Landroid/content/IntentFilter;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    .line 95
    .local v0, "batteryStatus":Landroid/content/Intent;
    const-string v4, "level"

    invoke-virtual {v0, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 96
    .local v2, "level":I
    const-string v4, "scale"

    invoke-virtual {v0, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 97
    .local v3, "scale":I
    int-to-float v4, v2

    int-to-float v5, v3

    div-float/2addr v4, v5

    return v4
.end method

.method public static init()V
    .locals 0

    .prologue
    .line 31
    return-void
.end method

.method public static isCharging()Z
    .locals 5

    .prologue
    .line 101
    new-instance v1, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 102
    .local v1, "intent":Landroid/content/IntentFilter;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    .line 103
    .local v0, "batteryStatus":Landroid/content/Intent;
    const-string v3, "status"

    const/4 v4, -0x1

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 104
    .local v2, "status":I
    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    const/4 v3, 0x5

    if-eq v2, v3, :cond_0

    const/4 v3, 0x0

    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public static isPlug()Z
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 108
    new-instance v2, Landroid/content/IntentFilter;

    const-string v4, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v2, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 109
    .local v2, "intent":Landroid/content/IntentFilter;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    .line 110
    .local v0, "batteryStatus":Landroid/content/Intent;
    const-string v4, "plugged"

    const/4 v5, -0x1

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 111
    .local v1, "chargePlug":I
    const/4 v4, 0x2

    if-eq v1, v4, :cond_0

    .line 112
    if-eq v1, v3, :cond_0

    .line 113
    const/4 v4, 0x4

    if-eq v1, v4, :cond_0

    .line 111
    const/4 v3, 0x0

    :cond_0
    return v3
.end method

.method static native nativeEvent(IZ)V
.end method

.method private static onPowerEvent(IZ)V
    .locals 2
    .param p0, "type"    # I
    .param p1, "value"    # Z

    .prologue
    .line 14
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/device/PowerInfoImpl$3;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/engine/device/PowerInfoImpl$3;-><init>(IZ)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 20
    return-void
.end method
