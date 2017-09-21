.class Lcom/boyaa/downloader/service/DownloadService$2;
.super Ljava/lang/Object;
.source "DownloadService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/downloader/service/DownloadService;->updateLocalVersion(Ljava/lang/String;Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/downloader/service/DownloadService;

.field private final synthetic val$downloadPath:Ljava/lang/String;

.field private final synthetic val$savedir:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    iput-object p2, p0, Lcom/boyaa/downloader/service/DownloadService$2;->val$downloadPath:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/downloader/service/DownloadService$2;->val$savedir:Ljava/io/File;

    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 186
    :try_start_0
    iget-object v7, p0, Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    new-instance v0, Lcom/boyaa/downloader/network/FileDownloader;

    iget-object v1, p0, Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    iget-object v2, p0, Lcom/boyaa/downloader/service/DownloadService$2;->val$downloadPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2;->val$savedir:Ljava/io/File;

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/boyaa/downloader/network/FileDownloader;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloaderCreatedListener;)V

    invoke-static {v7, v0}, Lcom/boyaa/downloader/service/DownloadService;->access$3(Lcom/boyaa/downloader/service/DownloadService;Lcom/boyaa/downloader/network/FileDownloader;)V

    .line 187
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$4(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;

    move-result-object v0

    new-instance v1, Lcom/boyaa/downloader/service/DownloadService$2$1;

    invoke-direct {v1, p0}, Lcom/boyaa/downloader/service/DownloadService$2$1;-><init>(Lcom/boyaa/downloader/service/DownloadService$2;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/downloader/network/FileDownloader;->setDownloadProgressListener(Lcom/boyaa/downloader/network/DownloadProgressListener;)V

    .line 218
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$4(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;

    move-result-object v0

    new-instance v1, Lcom/boyaa/downloader/service/DownloadService$2$2;

    invoke-direct {v1, p0}, Lcom/boyaa/downloader/service/DownloadService$2$2;-><init>(Lcom/boyaa/downloader/service/DownloadService$2;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/downloader/network/FileDownloader;->setDownloadFinishListener(Lcom/boyaa/downloader/network/DownloadFinishListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 227
    :try_start_1
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$4(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/FileDownloader;->syncDownload()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 255
    :goto_0
    return-void

    .line 228
    :catch_0
    move-exception v6

    .line 230
    .local v6, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 231
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mManager:Landroid/app/NotificationManager;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$7(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/NotificationManager;

    move-result-object v0

    const v1, 0x7f030006

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 233
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/boyaa/downloader/service/DownloadService;->access$6(Lcom/boyaa/downloader/service/DownloadService;Landroid/app/Notification;)V

    .line 235
    :cond_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/downloader/service/DownloadService$2$3;

    invoke-direct {v1, p0}, Lcom/boyaa/downloader/service/DownloadService$2$3;-><init>(Lcom/boyaa/downloader/service/DownloadService$2;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 244
    .end local v6    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v6

    .line 245
    .restart local v6    # "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 246
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/downloader/service/DownloadService$2$4;

    invoke-direct {v1, p0}, Lcom/boyaa/downloader/service/DownloadService$2$4;-><init>(Lcom/boyaa/downloader/service/DownloadService$2;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
