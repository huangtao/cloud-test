.class Lcom/boyaa/downloader/service/DownloadService$7;
.super Ljava/lang/Object;
.source "DownloadService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/downloader/service/DownloadService;->download(Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloadProgressListener;Lcom/boyaa/downloader/network/DownloadFinishListener;Lcom/boyaa/downloader/network/DownloaderCreatedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/downloader/service/DownloadService;

.field private final synthetic val$createdListener:Lcom/boyaa/downloader/network/DownloaderCreatedListener;

.field private final synthetic val$downloadPath:Ljava/lang/String;

.field private final synthetic val$finishListener:Lcom/boyaa/downloader/network/DownloadFinishListener;

.field private final synthetic val$progressListener:Lcom/boyaa/downloader/network/DownloadProgressListener;

.field private final synthetic val$savedir:Ljava/io/File;

.field private final synthetic val$threadNum:I


# direct methods
.method constructor <init>(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloaderCreatedListener;Lcom/boyaa/downloader/network/DownloadProgressListener;Lcom/boyaa/downloader/network/DownloadFinishListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService$7;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    iput-object p2, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$downloadPath:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$savedir:Ljava/io/File;

    iput p4, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$threadNum:I

    iput-object p5, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$createdListener:Lcom/boyaa/downloader/network/DownloaderCreatedListener;

    iput-object p6, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$progressListener:Lcom/boyaa/downloader/network/DownloadProgressListener;

    iput-object p7, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$finishListener:Lcom/boyaa/downloader/network/DownloadFinishListener;

    .line 426
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 431
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$7;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    const-string v1, "usrInfo"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/downloader/service/DownloadService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v8

    .line 432
    .local v8, "preferences":Landroid/content/SharedPreferences;
    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 434
    .local v7, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v0, "downloadApkPath"

    invoke-interface {v7, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 435
    const-string v0, "downStatus"

    invoke-interface {v7, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 436
    const-string v0, "downloadApkPackageName"

    invoke-interface {v7, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 437
    const-string v0, "downloadApkVersionName"

    invoke-interface {v7, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 438
    const-string v0, "downloadApkVersionCode"

    invoke-interface {v7, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 439
    const-string v0, "downloading"

    invoke-interface {v7, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 440
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 441
    iget-object v9, p0, Lcom/boyaa/downloader/service/DownloadService$7;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    new-instance v0, Lcom/boyaa/downloader/network/FileDownloader;

    iget-object v1, p0, Lcom/boyaa/downloader/service/DownloadService$7;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    iget-object v2, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$downloadPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$savedir:Ljava/io/File;

    iget v4, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$threadNum:I

    iget-object v5, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$createdListener:Lcom/boyaa/downloader/network/DownloaderCreatedListener;

    invoke-direct/range {v0 .. v5}, Lcom/boyaa/downloader/network/FileDownloader;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloaderCreatedListener;)V

    invoke-static {v9, v0}, Lcom/boyaa/downloader/service/DownloadService;->access$11(Lcom/boyaa/downloader/service/DownloadService;Lcom/boyaa/downloader/network/FileDownloader;)V

    .line 442
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$7;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$2(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$progressListener:Lcom/boyaa/downloader/network/DownloadProgressListener;

    invoke-virtual {v0, v1}, Lcom/boyaa/downloader/network/FileDownloader;->setDownloadProgressListener(Lcom/boyaa/downloader/network/DownloadProgressListener;)V

    .line 443
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$7;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$2(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/downloader/service/DownloadService$7;->val$finishListener:Lcom/boyaa/downloader/network/DownloadFinishListener;

    invoke-virtual {v0, v1}, Lcom/boyaa/downloader/network/FileDownloader;->setDownloadFinishListener(Lcom/boyaa/downloader/network/DownloadFinishListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 445
    :try_start_1
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$7;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$2(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/FileDownloader;->syncDownload()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 474
    .end local v7    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v8    # "preferences":Landroid/content/SharedPreferences;
    :goto_0
    return-void

    .line 446
    .restart local v7    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v8    # "preferences":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v6

    .line 448
    .local v6, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 451
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$7;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    const-string v1, "usrInfo"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/downloader/service/DownloadService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "downloading"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 452
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/downloader/service/DownloadService$7$1;

    invoke-direct {v1, p0}, Lcom/boyaa/downloader/service/DownloadService$7$1;-><init>(Lcom/boyaa/downloader/service/DownloadService$7;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 461
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v7    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v8    # "preferences":Landroid/content/SharedPreferences;
    :catch_1
    move-exception v6

    .line 462
    .restart local v6    # "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 464
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$7;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    const-string v1, "usrInfo"

    invoke-virtual {v0, v1, v10}, Lcom/boyaa/downloader/service/DownloadService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "downloading"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 465
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/downloader/service/DownloadService$7$2;

    invoke-direct {v1, p0}, Lcom/boyaa/downloader/service/DownloadService$7$2;-><init>(Lcom/boyaa/downloader/service/DownloadService$7;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
