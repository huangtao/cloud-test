.class public Lcom/boyaa/videodemo/utils/HeadSetUtils;
.super Ljava/lang/Object;
.source "HeadSetUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/utils/HeadSetUtils$HeadSetReceiver;
    }
.end annotation


# static fields
.field private static final HEADSET_STATE_PATH:Ljava/lang/String; = "/sys/class/switch/h2w/state"

.field private static mLock:[B

.field private static mUtils:Lcom/boyaa/videodemo/utils/HeadSetUtils;


# instance fields
.field private headSet:Lcom/boyaa/videodemo/utils/HeadSetUtils$HeadSetReceiver;

.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mLock:[B

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mContext:Landroid/content/Context;

    .line 23
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/boyaa/videodemo/utils/HeadSetUtils;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 26
    sget-object v0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mUtils:Lcom/boyaa/videodemo/utils/HeadSetUtils;

    if-nez v0, :cond_1

    .line 27
    sget-object v1, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mLock:[B

    monitor-enter v1

    .line 28
    :try_start_0
    sget-object v0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mUtils:Lcom/boyaa/videodemo/utils/HeadSetUtils;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/boyaa/videodemo/utils/HeadSetUtils;

    invoke-direct {v0, p0}, Lcom/boyaa/videodemo/utils/HeadSetUtils;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mUtils:Lcom/boyaa/videodemo/utils/HeadSetUtils;

    .line 27
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    :cond_1
    sget-object v0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mUtils:Lcom/boyaa/videodemo/utils/HeadSetUtils;

    return-object v0

    .line 27
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public isHeadsetExists()Z
    .locals 8

    .prologue
    const/16 v6, 0x400

    const/4 v5, 0x0

    .line 66
    new-array v0, v6, [C

    .line 68
    .local v0, "buffer":[C
    const/4 v4, 0x0

    .line 71
    .local v4, "newState":I
    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    const-string v6, "/sys/class/switch/h2w/state"

    invoke-direct {v2, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 72
    .local v2, "file":Ljava/io/FileReader;
    const/4 v6, 0x0

    const/16 v7, 0x400

    invoke-virtual {v2, v0, v6, v7}, Ljava/io/FileReader;->read([CII)I

    move-result v3

    .line 73
    .local v3, "len":I
    new-instance v6, Ljava/lang/String;

    const/4 v7, 0x0

    invoke-direct {v6, v0, v7, v3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    .line 81
    .end local v2    # "file":Ljava/io/FileReader;
    .end local v3    # "len":I
    :goto_0
    if-eqz v4, :cond_0

    const/4 v5, 0x1

    :cond_0
    return v5

    .line 75
    :catch_0
    move-exception v1

    .line 76
    .local v1, "e":Ljava/io/FileNotFoundException;
    const-string v6, "FMTest"

    const-string v7, "This kernel does not have wired headset support"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 78
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v1

    .line 79
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, "FMTest"

    const-string v7, ""

    invoke-static {v6, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public register()V
    .locals 3

    .prologue
    .line 51
    new-instance v1, Lcom/boyaa/videodemo/utils/HeadSetUtils$HeadSetReceiver;

    invoke-direct {v1, p0}, Lcom/boyaa/videodemo/utils/HeadSetUtils$HeadSetReceiver;-><init>(Lcom/boyaa/videodemo/utils/HeadSetUtils;)V

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->headSet:Lcom/boyaa/videodemo/utils/HeadSetUtils$HeadSetReceiver;

    .line 52
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 53
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 54
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->headSet:Lcom/boyaa/videodemo/utils/HeadSetUtils$HeadSetReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 55
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 41
    sput-object v1, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mUtils:Lcom/boyaa/videodemo/utils/HeadSetUtils;

    .line 43
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 44
    iput-object v1, p0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mContext:Landroid/content/Context;

    .line 46
    :cond_0
    return-void
.end method

.method public unregister()V
    .locals 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/boyaa/videodemo/utils/HeadSetUtils;->headSet:Lcom/boyaa/videodemo/utils/HeadSetUtils$HeadSetReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 60
    return-void
.end method
