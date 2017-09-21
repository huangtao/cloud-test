.class public Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;
.super Landroid/os/Binder;
.source "DownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/downloader/service/DownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DownloadServiceBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/downloader/service/DownloadService;


# direct methods
.method public constructor <init>(Lcom/boyaa/downloader/service/DownloadService;)V
    .locals 0

    .prologue
    .line 516
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public getFileSize()I
    .locals 1

    .prologue
    .line 527
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$2(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 528
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mDownloader:Lcom/boyaa/downloader/network/FileDownloader;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$2(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/FileDownloader;->getFileSize()I

    move-result v0

    .line 530
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public startDownload(Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloadProgressListener;Lcom/boyaa/downloader/network/DownloadFinishListener;Lcom/boyaa/downloader/network/DownloaderCreatedListener;)V
    .locals 7
    .param p1, "downloadPath"    # Ljava/lang/String;
    .param p2, "savedir"    # Ljava/io/File;
    .param p3, "threadNum"    # I
    .param p4, "progressListener"    # Lcom/boyaa/downloader/network/DownloadProgressListener;
    .param p5, "finishListener"    # Lcom/boyaa/downloader/network/DownloadFinishListener;
    .param p6, "createdListener"    # Lcom/boyaa/downloader/network/DownloaderCreatedListener;

    .prologue
    .line 519
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    # invokes: Lcom/boyaa/downloader/service/DownloadService;->download(Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloadProgressListener;Lcom/boyaa/downloader/network/DownloadFinishListener;Lcom/boyaa/downloader/network/DownloaderCreatedListener;)V
    invoke-static/range {v0 .. v6}, Lcom/boyaa/downloader/service/DownloadService;->access$0(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloadProgressListener;Lcom/boyaa/downloader/network/DownloadFinishListener;Lcom/boyaa/downloader/network/DownloaderCreatedListener;)V

    .line 520
    return-void
.end method

.method public stopDownload()V
    .locals 1

    .prologue
    .line 523
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$DownloadServiceBinder;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # invokes: Lcom/boyaa/downloader/service/DownloadService;->stopDownloader()V
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService;->access$1(Lcom/boyaa/downloader/service/DownloadService;)V

    .line 524
    return-void
.end method
