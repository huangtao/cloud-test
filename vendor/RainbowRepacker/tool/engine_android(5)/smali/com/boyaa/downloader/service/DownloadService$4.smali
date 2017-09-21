.class Lcom/boyaa/downloader/service/DownloadService$4;
.super Ljava/lang/Object;
.source "DownloadService.java"

# interfaces
.implements Lcom/boyaa/downloader/network/DownloadProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/downloader/service/DownloadService;->download(Ljava/lang/String;Ljava/io/File;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/downloader/service/DownloadService;


# direct methods
.method constructor <init>(Lcom/boyaa/downloader/service/DownloadService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService$4;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    .line 297
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadSize(I)V
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 301
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$4;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # invokes: Lcom/boyaa/downloader/service/DownloadService;->updateNotification(I)V
    invoke-static {v0, p1}, Lcom/boyaa/downloader/service/DownloadService;->access$10(Lcom/boyaa/downloader/service/DownloadService;I)V

    .line 302
    return-void
.end method
