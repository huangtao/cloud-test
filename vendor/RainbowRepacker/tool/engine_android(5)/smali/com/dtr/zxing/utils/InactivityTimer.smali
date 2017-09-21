.class public Lcom/dtr/zxing/utils/InactivityTimer;
.super Ljava/lang/Object;
.source "InactivityTimer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dtr/zxing/utils/InactivityTimer$InactivityAsyncTask;,
        Lcom/dtr/zxing/utils/InactivityTimer$PowerStatusReceiver;
    }
.end annotation


# static fields
.field private static final INACTIVITY_DELAY_MS:J = 0x493e0L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private activity:Landroid/app/Activity;

.field private inactivityTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private powerStatusReceiver:Landroid/content/BroadcastReceiver;

.field private registered:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lcom/dtr/zxing/utils/InactivityTimer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dtr/zxing/utils/InactivityTimer;->TAG:Ljava/lang/String;

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/dtr/zxing/utils/InactivityTimer;->activity:Landroid/app/Activity;

    .line 31
    new-instance v0, Lcom/dtr/zxing/utils/InactivityTimer$PowerStatusReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/dtr/zxing/utils/InactivityTimer$PowerStatusReceiver;-><init>(Lcom/dtr/zxing/utils/InactivityTimer;Lcom/dtr/zxing/utils/InactivityTimer$PowerStatusReceiver;)V

    iput-object v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->powerStatusReceiver:Landroid/content/BroadcastReceiver;

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->registered:Z

    .line 33
    invoke-virtual {p0}, Lcom/dtr/zxing/utils/InactivityTimer;->onActivity()V

    .line 34
    return-void
.end method

.method static synthetic access$0(Lcom/dtr/zxing/utils/InactivityTimer;)V
    .locals 0

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/dtr/zxing/utils/InactivityTimer;->cancel()V

    return-void
.end method

.method static synthetic access$1(Lcom/dtr/zxing/utils/InactivityTimer;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method private declared-synchronized cancel()V
    .locals 2

    .prologue
    .line 69
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->inactivityTask:Landroid/os/AsyncTask;

    .line 70
    .local v0, "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<***>;"
    if-eqz v0, :cond_0

    .line 71
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 72
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/dtr/zxing/utils/InactivityTimer;->inactivityTask:Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    :cond_0
    monitor-exit p0

    return-void

    .line 69
    .end local v0    # "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<***>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method public declared-synchronized onActivity()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 39
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/dtr/zxing/utils/InactivityTimer;->cancel()V

    .line 40
    new-instance v0, Lcom/dtr/zxing/utils/InactivityTimer$InactivityAsyncTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/dtr/zxing/utils/InactivityTimer$InactivityAsyncTask;-><init>(Lcom/dtr/zxing/utils/InactivityTimer;Lcom/dtr/zxing/utils/InactivityTimer$InactivityAsyncTask;)V

    iput-object v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->inactivityTask:Landroid/os/AsyncTask;

    .line 41
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 42
    iget-object v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->inactivityTask:Landroid/os/AsyncTask;

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :goto_0
    monitor-exit p0

    return-void

    .line 44
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->inactivityTask:Landroid/os/AsyncTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 39
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onPause()V
    .locals 2

    .prologue
    .line 50
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/dtr/zxing/utils/InactivityTimer;->cancel()V

    .line 51
    iget-boolean v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->registered:Z

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/dtr/zxing/utils/InactivityTimer;->powerStatusReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->registered:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    :cond_0
    monitor-exit p0

    return-void

    .line 50
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onResume()V
    .locals 4

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->registered:Z

    if-nez v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/dtr/zxing/utils/InactivityTimer;->powerStatusReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dtr/zxing/utils/InactivityTimer;->registered:Z

    .line 64
    :cond_0
    invoke-virtual {p0}, Lcom/dtr/zxing/utils/InactivityTimer;->onActivity()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    monitor-exit p0

    return-void

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public shutdown()V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/dtr/zxing/utils/InactivityTimer;->cancel()V

    .line 79
    return-void
.end method
