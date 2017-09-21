.class Lcom/boyaa/downloader/service/DownloadService$6;
.super Ljava/lang/Object;
.source "DownloadService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/downloader/service/DownloadService;->onDownloadFinished(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/downloader/service/DownloadService;

.field private final synthetic val$json:Lcom/boyaa/util/JsonUtil;


# direct methods
.method constructor <init>(Lcom/boyaa/downloader/service/DownloadService;Lcom/boyaa/util/JsonUtil;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService$6;->this$0:Lcom/boyaa/downloader/service/DownloadService;

    iput-object p2, p0, Lcom/boyaa/downloader/service/DownloadService$6;->val$json:Lcom/boyaa/util/JsonUtil;

    .line 348
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 352
    const-string v0, "version_status"

    const-string v1, "status"

    const/4 v2, 0x3

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 353
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const-string v1, "updateAPK"

    iget-object v2, p0, Lcom/boyaa/downloader/service/DownloadService$6;->val$json:Lcom/boyaa/util/JsonUtil;

    invoke-virtual {v2}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    return-void
.end method
