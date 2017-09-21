.class public Lcom/boyaa/downloader/service/DownloadService;
.super Landroid/app/Service;
.source "DownloadService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;
    }
.end annotation


# static fields
.field public static final KEY_DOWNLOAD_PATH:Ljava/lang/String; = "download_path"

.field public static final KEY_PROGRESS:Ljava/lang/String; = "download_progress"

.field public static final KEY_SAVE_PATH:Ljava/lang/String; = "save_path"

.field public static final KEY_START_TYPE:Ljava/lang/String; = "start_type"

.field public static final KEY_THREAD_NUM:Ljava/lang/String; = "thread_num"

.field private static final OFFLINE_VERSION_DOWNLOAD_FINISHED_NOTIFY_ID:I = 0x1

.field private static final TAG:Ljava/lang/String;

.field public static final TYPE_DOWNLOAD_ONLINE_VERSION:I = 0x1

.field public static final TYPE_UPDATE_OFFLINE_VERSION:I = 0x2


# instance fields
.field private mBinder:Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;

.field private mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

.field private mManager:Landroid/app/NotificationManager;

.field private mUpdateNotifcation:Landroid/app/Notification;

.field private mUpdater:Lcom/boyaa/downloader/network/FileDownloader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-class v0, Lcom/boyaa/downloader/service/DownloadService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/downloader/service/DownloadService;->TAG:Ljava/lang/String;

    .line 52
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloadProgressListener;Lcom/boyaa/downloader/network/DownloadFinishListener;Lcom/boyaa/downloader/network/DownloaderCreatedListener;)V
    .locals 0

    .prologue
    .line 419
    invoke-direct/range {p0 .. p6}, Lcom/boyaa/downloader/service/DownloadService;->download(Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloadProgressListener;Lcom/boyaa/downloader/network/DownloadFinishListener;Lcom/boyaa/downloader/network/DownloaderCreatedListener;)V

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/downloader/service/DownloadService;)V
    .locals 0

    .prologue
    .line 493
    invoke-direct {p0}, Lcom/boyaa/downloader/service/DownloadService;->stopDownloader()V

    return-void
.end method

.method static synthetic access$10(Lcom/boyaa/downloader/service/DownloadService;I)V
    .locals 0

    .prologue
    .line 366
    invoke-direct {p0, p1}, Lcom/boyaa/downloader/service/DownloadService;->updateNotification(I)V

    return-void
.end method

.method static synthetic access$11(Lcom/boyaa/downloader/service/DownloadService;Lcom/boyaa/downloader/network/FileDownloader;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

    return-object v0
.end method

.method static synthetic access$3(Lcom/boyaa/downloader/service/DownloadService;Lcom/boyaa/downloader/network/FileDownloader;)V
    .locals 0

    .prologue
    .line 60
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;

    return-void
.end method

.method static synthetic access$4(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;

    return-object v0
.end method

.method static synthetic access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;

    return-object v0
.end method

.method static synthetic access$6(Lcom/boyaa/downloader/service/DownloadService;Landroid/app/Notification;)V
    .locals 0

    .prologue
    .line 65
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;

    return-void
.end method

.method static synthetic access$7(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/NotificationManager;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mManager:Landroid/app/NotificationManager;

    return-object v0
.end method

.method static synthetic access$8(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 274
    invoke-direct {p0, p1}, Lcom/boyaa/downloader/service/DownloadService;->onFinishedUpdateNotification(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$9(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 317
    invoke-direct {p0, p1}, Lcom/boyaa/downloader/service/DownloadService;->onDownloadFinished(Ljava/lang/String;)V

    return-void
.end method

.method private broadcastProgress(I)V
    .locals 0
    .param p1, "prog"    # I

    .prologue
    .line 407
    invoke-static {p1}, Lcom/boyaa/downloader/util/LocalBroadcastUtil;->sendDownloadUpdateBroadcast(I)V

    .line 408
    return-void
.end method

.method private cancelNotifies()V
    .locals 2

    .prologue
    .line 510
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;

    if-eqz v0, :cond_0

    .line 511
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mManager:Landroid/app/NotificationManager;

    const v1, 0x7f030006

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 512
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;

    .line 514
    :cond_0
    return-void
.end method

.method private download(Ljava/lang/String;Ljava/io/File;I)V
    .locals 7
    .param p1, "downloadPath"    # Ljava/lang/String;
    .param p2, "savedir"    # Ljava/io/File;
    .param p3, "threadNum"    # I

    .prologue
    .line 297
    new-instance v4, Lcom/boyaa/downloader/service/DownloadService$4;

    invoke-direct {v4, p0}, Lcom/boyaa/downloader/service/DownloadService$4;-><init>(Lcom/boyaa/downloader/service/DownloadService;)V

    .line 304
    new-instance v5, Lcom/boyaa/downloader/service/DownloadService$5;

    invoke-direct {v5, p0}, Lcom/boyaa/downloader/service/DownloadService$5;-><init>(Lcom/boyaa/downloader/service/DownloadService;)V

    .line 311
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    .line 297
    invoke-direct/range {v0 .. v6}, Lcom/boyaa/downloader/service/DownloadService;->download(Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloadProgressListener;Lcom/boyaa/downloader/network/DownloadFinishListener;Lcom/boyaa/downloader/network/DownloaderCreatedListener;)V

    .line 312
    return-void
.end method

.method private download(Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloadProgressListener;Lcom/boyaa/downloader/network/DownloadFinishListener;Lcom/boyaa/downloader/network/DownloaderCreatedListener;)V
    .locals 10
    .param p1, "downloadPath"    # Ljava/lang/String;
    .param p2, "savedir"    # Ljava/io/File;
    .param p3, "threadNum"    # I
    .param p4, "progressListener"    # Lcom/boyaa/downloader/network/DownloadProgressListener;
    .param p5, "finishListener"    # Lcom/boyaa/downloader/network/DownloadFinishListener;
    .param p6, "createdListener"    # Lcom/boyaa/downloader/network/DownloaderCreatedListener;

    .prologue
    .line 421
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/FileDownloader;->isDownloading()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 488
    :goto_0
    return-void

    .line 426
    :cond_0
    :try_start_0
    new-instance v9, Ljava/lang/Thread;

    new-instance v0, Lcom/boyaa/downloader/service/DownloadService$7;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object/from16 v5, p6

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/boyaa/downloader/service/DownloadService$7;-><init>(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloaderCreatedListener;Lcom/boyaa/downloader/network/DownloadProgressListener;Lcom/boyaa/downloader/network/DownloadFinishListener;)V

    invoke-direct {v9, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 475
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 476
    :catch_0
    move-exception v8

    .line 478
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    .line 479
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/downloader/service/DownloadService$8;

    invoke-direct {v1, p0}, Lcom/boyaa/downloader/service/DownloadService$8;-><init>(Lcom/boyaa/downloader/service/DownloadService;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private onDownloadFinished(Ljava/lang/String;)V
    .locals 9
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 322
    :try_start_0
    const-string v6, "usrInfo"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Lcom/boyaa/downloader/service/DownloadService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 323
    .local v5, "preferences":Landroid/content/SharedPreferences;
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 324
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v6, "downloadApkPath"

    invoke-interface {v1, v6, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 326
    const-string v6, "downStatus"

    const/4 v7, 0x0

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 328
    const-string v6, "downloading"

    const/4 v7, 0x0

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 331
    invoke-virtual {p0}, Lcom/boyaa/downloader/service/DownloadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6, p1}, Lcom/boyaa/downloader/util/AppCheckHelper;->getUninstalledApkInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 333
    .local v2, "info":Landroid/content/pm/PackageInfo;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 334
    .local v4, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "apk_path"

    invoke-interface {v4, v6, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    if-eqz v2, :cond_0

    .line 338
    const-string v6, "package_version_code"

    new-instance v7, Ljava/lang/StringBuilder;

    iget v8, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    const-string v6, "package_version_name"

    iget-object v7, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    const-string v6, "package_name"

    iget-object v7, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    const-string v6, "downloadApkPackageName"

    iget-object v7, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 342
    const-string v6, "downloadApkVersionName"

    iget-object v7, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 343
    const-string v6, "downloadApkVersionCode"

    iget v7, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 345
    :cond_0
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 347
    new-instance v3, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v3, v4}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 348
    .local v3, "json":Lcom/boyaa/util/JsonUtil;
    sget-object v6, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v7, Lcom/boyaa/downloader/service/DownloadService$6;

    invoke-direct {v7, p0, v3}, Lcom/boyaa/downloader/service/DownloadService$6;-><init>(Lcom/boyaa/downloader/service/DownloadService;Lcom/boyaa/util/JsonUtil;)V

    invoke-virtual {v6, v7}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 361
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "info":Landroid/content/pm/PackageInfo;
    .end local v3    # "json":Lcom/boyaa/util/JsonUtil;
    .end local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "preferences":Landroid/content/SharedPreferences;
    :goto_0
    return-void

    .line 357
    :catch_0
    move-exception v0

    .line 358
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private onFinishedUpdateNotification(Ljava/lang/String;)V
    .locals 6
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 275
    iget-object v2, p0, Lcom/boyaa/downloader/service/DownloadService;->mManager:Landroid/app/NotificationManager;

    const v3, 0x7f030006

    invoke-virtual {v2, v3}, Landroid/app/NotificationManager;->cancel(I)V

    .line 276
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;

    .line 277
    new-instance v0, Landroid/app/Notification;

    invoke-direct {v0}, Landroid/app/Notification;-><init>()V

    .line 278
    .local v0, "notification":Landroid/app/Notification;
    const v2, 0x7f02000f

    iput v2, v0, Landroid/app/Notification;->icon:I

    .line 279
    const-string v2, "2131165187\u4e0b\u8f7d\u5b8c\u6bd5"

    iput-object v2, v0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 280
    new-instance v2, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Lcom/boyaa/downloader/service/DownloadService;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f030008

    invoke-direct {v2, v3, v4}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    iput-object v2, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 282
    invoke-static {p0, p1}, Lcom/boyaa/downloader/util/ApkInstallHelper;->getInstallApkIntentbypassQQ(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 281
    invoke-static {p0, v5, v2, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 283
    .local v1, "pIntent":Landroid/app/PendingIntent;
    iput-object v1, v0, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 284
    iget v2, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v2, v2, 0x10

    iput v2, v0, Landroid/app/Notification;->flags:I

    .line 286
    iget-object v2, p0, Lcom/boyaa/downloader/service/DownloadService;->mManager:Landroid/app/NotificationManager;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 287
    return-void
.end method

.method private saveInXML(ILjava/lang/String;)V
    .locals 5
    .param p1, "size"    # I
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 384
    const-string v2, "usrInfo"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/boyaa/downloader/service/DownloadService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 385
    .local v1, "preferences":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 387
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "downProgress"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 390
    const-string v2, "downStatus"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 392
    const-string v2, "downloading"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 394
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 396
    const-string v2, "downUrl"

    invoke-interface {v0, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 398
    :cond_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 400
    return-void
.end method

.method private stopDownloader()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 494
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

    if-eqz v0, :cond_0

    .line 495
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/FileDownloader;->stopDownload()V

    .line 496
    iput-object v1, p0, Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

    .line 499
    :cond_0
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;

    if-eqz v0, :cond_1

    .line 500
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/FileDownloader;->stopDownload()V

    .line 501
    iput-object v1, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;

    .line 503
    :cond_1
    const-string v0, "usrInfo"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/downloader/service/DownloadService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "downloading"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 504
    return-void
.end method

.method private updateLocalVersion(Ljava/lang/String;Ljava/io/File;)V
    .locals 3
    .param p1, "downloadPath"    # Ljava/lang/String;
    .param p2, "savedir"    # Ljava/io/File;

    .prologue
    .line 172
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;

    invoke-virtual {v1}, Lcom/boyaa/downloader/network/FileDownloader;->isDownloading()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 269
    :goto_0
    return-void

    .line 182
    :cond_0
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/boyaa/downloader/service/DownloadService$2;

    invoke-direct {v2, p0, p1, p2}, Lcom/boyaa/downloader/service/DownloadService$2;-><init>(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 256
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 257
    :catch_0
    move-exception v0

    .line 259
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 260
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v2, Lcom/boyaa/downloader/service/DownloadService$3;

    invoke-direct {v2, p0}, Lcom/boyaa/downloader/service/DownloadService$3;-><init>(Lcom/boyaa/downloader/service/DownloadService;)V

    invoke-virtual {v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private updateNotification(I)V
    .locals 5
    .param p1, "size"    # I

    .prologue
    .line 367
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

    if-eqz v3, :cond_0

    .line 368
    int-to-float v3, p1

    iget-object v4, p0, Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

    invoke-virtual {v4}, Lcom/boyaa/downloader/network/FileDownloader;->getFileSize()I

    move-result v4

    int-to-float v4, v4

    div-float v1, v3, v4

    .line 369
    .local v1, "temp":F
    const/high16 v3, 0x42c80000    # 100.0f

    mul-float/2addr v3, v1

    float-to-int v0, v3

    .line 371
    .local v0, "prog":I
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;

    invoke-virtual {v3}, Lcom/boyaa/downloader/network/FileDownloader;->getDownloadUrl()Ljava/lang/String;

    move-result-object v2

    .line 372
    .local v2, "url":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/boyaa/downloader/service/DownloadService;->broadcastProgress(I)V

    .line 374
    invoke-direct {p0, v0, v2}, Lcom/boyaa/downloader/service/DownloadService;->saveInXML(ILjava/lang/String;)V

    .line 376
    .end local v0    # "prog":I
    .end local v1    # "temp":F
    .end local v2    # "url":Ljava/lang/String;
    :cond_0
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mBinder:Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;

    if-nez v0, :cond_0

    .line 90
    new-instance v0, Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;

    invoke-direct {v0, p0}, Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;-><init>(Lcom/boyaa/downloader/service/DownloadService;)V

    iput-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mBinder:Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mBinder:Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 74
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/boyaa/downloader/service/DownloadService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/boyaa/downloader/service/DownloadService;->mManager:Landroid/app/NotificationManager;

    .line 83
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 84
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 158
    invoke-direct {p0}, Lcom/boyaa/downloader/service/DownloadService;->stopDownloader()V

    .line 159
    invoke-direct {p0}, Lcom/boyaa/downloader/service/DownloadService;->cancelNotifies()V

    .line 160
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 161
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I

    .prologue
    const/4 v5, 0x1

    .line 111
    invoke-static {}, Lcom/boyaa/app/common/SDTools;->isExternalStorageWriteable()Z

    move-result v4

    if-nez v4, :cond_1

    .line 112
    sget-object v4, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v5, "SD\u5361\u4e0d\u5b58\u5728\u6216\u7a7a\u95f4\u4e0d\u8db3\uff0c\u4e0d\u80fd\u4e0b\u8f7d\uff01"

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 113
    sget-object v4, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v5, Lcom/boyaa/downloader/service/DownloadService$1;

    invoke-direct {v5, p0}, Lcom/boyaa/downloader/service/DownloadService$1;-><init>(Lcom/boyaa/downloader/service/DownloadService;)V

    invoke-virtual {v4, v5}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 152
    :cond_0
    :goto_0
    return-void

    .line 124
    :cond_1
    if-eqz p1, :cond_2

    .line 125
    const-string v4, "start_type"

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 126
    .local v3, "type":I
    const-string v4, "download_path"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "downloadPath":Ljava/lang/String;
    const-string v4, "save_path"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 129
    .local v1, "savePath":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 134
    packed-switch v3, :pswitch_data_0

    .line 151
    .end local v0    # "downloadPath":Ljava/lang/String;
    .end local v1    # "savePath":Ljava/lang/String;
    .end local v3    # "type":I
    :cond_2
    :goto_1
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    goto :goto_0

    .line 138
    .restart local v0    # "downloadPath":Ljava/lang/String;
    .restart local v1    # "savePath":Ljava/lang/String;
    .restart local v3    # "type":I
    :pswitch_0
    const-string v4, "thread_num"

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 139
    .local v2, "threadNum":I
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, v4, v2}, Lcom/boyaa/downloader/service/DownloadService;->download(Ljava/lang/String;Ljava/io/File;I)V

    goto :goto_1

    .line 145
    .end local v2    # "threadNum":I
    :pswitch_1
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, v4}, Lcom/boyaa/downloader/service/DownloadService;->updateLocalVersion(Ljava/lang/String;Ljava/io/File;)V

    goto :goto_1

    .line 134
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 104
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 98
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method
