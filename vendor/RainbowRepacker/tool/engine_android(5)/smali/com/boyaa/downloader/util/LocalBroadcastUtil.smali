.class public Lcom/boyaa/downloader/util/LocalBroadcastUtil;
.super Ljava/lang/Object;
.source "LocalBroadcastUtil.java"


# static fields
.field public static final LOCAL_DOWNLOAD_BROADCAST_ACTION_UPDATE:Ljava/lang/String; = "com.boyaa.download.UPDATE"

.field private static final TAG:Ljava/lang/String;

.field private static mManager:Landroid/support/v4/content/LocalBroadcastManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-class v0, Lcom/boyaa/downloader/util/LocalBroadcastUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->TAG:Ljava/lang/String;

    .line 20
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    .line 23
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static registerDownloadUpdateReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;

    .prologue
    .line 44
    sget-object v1, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    if-nez v1, :cond_0

    .line 45
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    sput-object v1, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    .line 47
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 48
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "com.boyaa.download.UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 49
    sget-object v1, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    invoke-virtual {v1, p1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 50
    return-void
.end method

.method public static registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p2, "intentFilter"    # Landroid/content/IntentFilter;

    .prologue
    .line 32
    sget-object v0, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    if-nez v0, :cond_0

    .line 33
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    sput-object v0, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    .line 35
    :cond_0
    sget-object v0, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 36
    return-void
.end method

.method public static sendBroadcast(Landroid/content/Intent;)V
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 67
    sget-object v0, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    if-eqz v0, :cond_0

    .line 68
    sget-object v0, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    invoke-virtual {v0, p0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 70
    :cond_0
    return-void
.end method

.method public static sendDownloadUpdateBroadcast(I)V
    .locals 2
    .param p0, "prog"    # I

    .prologue
    .line 77
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.boyaa.download.UPDATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 78
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "download_progress"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 79
    invoke-static {v0}, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->sendBroadcast(Landroid/content/Intent;)V

    .line 80
    return-void
.end method

.method public static unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    .locals 1
    .param p0, "receiver"    # Landroid/content/BroadcastReceiver;

    .prologue
    .line 57
    sget-object v0, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    if-eqz v0, :cond_0

    .line 58
    sget-object v0, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->mManager:Landroid/support/v4/content/LocalBroadcastManager;

    invoke-virtual {v0, p0}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 60
    :cond_0
    return-void
.end method
