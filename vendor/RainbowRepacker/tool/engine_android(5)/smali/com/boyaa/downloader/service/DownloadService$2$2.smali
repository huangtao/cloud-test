.class Lcom/boyaa/downloader/service/DownloadService$2$2;
.super Ljava/lang/Object;
.source "DownloadService.java"

# interfaces
.implements Lcom/boyaa/downloader/network/DownloadFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/downloader/service/DownloadService$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/downloader/service/DownloadService$2;


# direct methods
.method constructor <init>(Lcom/boyaa/downloader/service/DownloadService$2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService$2$2;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadFinshed(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$2$2;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v0

    # invokes: Lcom/boyaa/downloader/service/DownloadService;->onFinishedUpdateNotification(Ljava/lang/String;)V
    invoke-static {v0, p1}, Lcom/boyaa/downloader/service/DownloadService;->access$8(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;)V

    .line 223
    iget-object v0, p0, Lcom/boyaa/downloader/service/DownloadService$2$2;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v0}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v0

    # invokes: Lcom/boyaa/downloader/service/DownloadService;->onDownloadFinished(Ljava/lang/String;)V
    invoke-static {v0, p1}, Lcom/boyaa/downloader/service/DownloadService;->access$9(Lcom/boyaa/downloader/service/DownloadService;Ljava/lang/String;)V

    .line 224
    return-void
.end method
