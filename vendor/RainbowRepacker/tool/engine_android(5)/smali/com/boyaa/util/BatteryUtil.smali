.class public Lcom/boyaa/util/BatteryUtil;
.super Ljava/lang/Object;
.source "BatteryUtil.java"


# static fields
.field private static batteryLevelReceiver:Landroid/content/BroadcastReceiver;

.field private static level:I

.field private static strDicName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/util/BatteryUtil;->batteryLevelReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(I)V
    .locals 0

    .prologue
    .line 16
    sput p0, Lcom/boyaa/util/BatteryUtil;->level:I

    return-void
.end method

.method static synthetic access$1()I
    .locals 1

    .prologue
    .line 16
    sget v0, Lcom/boyaa/util/BatteryUtil;->level:I

    return v0
.end method

.method static synthetic access$2()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lcom/boyaa/util/BatteryUtil;->strDicName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3()V
    .locals 0

    .prologue
    .line 71
    invoke-static {}, Lcom/boyaa/util/BatteryUtil;->unregister()V

    return-void
.end method

.method public static getBatteryLevel(Ljava/lang/String;)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 21
    sput-object p0, Lcom/boyaa/util/BatteryUtil;->strDicName:Ljava/lang/String;

    .line 22
    invoke-static {}, Lcom/boyaa/util/BatteryUtil;->register()V

    .line 23
    return-void
.end method

.method private static register()V
    .locals 3

    .prologue
    .line 27
    invoke-static {}, Lcom/boyaa/util/BatteryUtil;->unregister()V

    .line 29
    new-instance v1, Lcom/boyaa/util/BatteryUtil$1;

    invoke-direct {v1}, Lcom/boyaa/util/BatteryUtil$1;-><init>()V

    sput-object v1, Lcom/boyaa/util/BatteryUtil;->batteryLevelReceiver:Landroid/content/BroadcastReceiver;

    .line 67
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 68
    .local v0, "batteryLevelFilter":Landroid/content/IntentFilter;
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    sget-object v2, Lcom/boyaa/util/BatteryUtil;->batteryLevelReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 69
    return-void
.end method

.method private static unregister()V
    .locals 2

    .prologue
    .line 73
    sget-object v0, Lcom/boyaa/util/BatteryUtil;->batteryLevelReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 75
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    sget-object v1, Lcom/boyaa/util/BatteryUtil;->batteryLevelReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 76
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/util/BatteryUtil;->batteryLevelReceiver:Landroid/content/BroadcastReceiver;

    .line 78
    :cond_0
    return-void
.end method
