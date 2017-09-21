.class Lcom/boyaa/downloader/service/DownloadService$5;
.super Ljava/lang/Object;
.source "DownloadService.java"

# interfaces
.implements Lcom/boyaa/downloader/network/DownloadFinishListener;


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
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService$5;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    .line 304
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadFinshed(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 309
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$5;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    # invokes: Lcom/boyaa/downloader/service/DownloadService;->onDownloadFinished(Ljava/lang/String;)V
    invoke-static {v0, p1}, Lcom/boyaa/downloader/service/DownloadService;->access$9(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;)V

    .line 310
    return-void
.end method
