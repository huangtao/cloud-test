.class Lcom/boyaa/entity/statistics/UploadLogFile$1;
.super Ljava/lang/Object;
.source "UploadLogFile.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/statistics/UploadLogFile;->callLua()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/statistics/UploadLogFile;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/statistics/UploadLogFile;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/statistics/UploadLogFile$1;->this$0:Lcom/boyaa/entity/statistics/UploadLogFile;

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 119
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 120
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "result"

    iget-object v2, p0, Lcom/boyaa/entity/statistics/UploadLogFile$1;->this$0:Lcom/boyaa/entity/statistics/UploadLogFile;

    # getter for: Lcom/boyaa/entity/statistics/UploadLogFile;->mResult:I
    invoke-static {v2}, Lcom/boyaa/entity/statistics/UploadLogFile;->access$0(Lcom/boyaa/entity/statistics/UploadLogFile;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    const-string v1, "module"

    iget-object v2, p0, Lcom/boyaa/entity/statistics/UploadLogFile$1;->this$0:Lcom/boyaa/entity/statistics/UploadLogFile;

    # getter for: Lcom/boyaa/entity/statistics/UploadLogFile;->mModule:Ljava/lang/String;
    invoke-static {v2}, Lcom/boyaa/entity/statistics/UploadLogFile;->access$1(Lcom/boyaa/entity/statistics/UploadLogFile;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    const-string v1, "filePath"

    iget-object v2, p0, Lcom/boyaa/entity/statistics/UploadLogFile$1;->this$0:Lcom/boyaa/entity/statistics/UploadLogFile;

    # getter for: Lcom/boyaa/entity/statistics/UploadLogFile;->mFilePath:Ljava/lang/String;
    invoke-static {v2}, Lcom/boyaa/entity/statistics/UploadLogFile;->access$2(Lcom/boyaa/entity/statistics/UploadLogFile;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v1

    const-string v2, "uploadLogFileCallBack"

    new-instance v3, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v3, v0}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v3}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    return-void
.end method
