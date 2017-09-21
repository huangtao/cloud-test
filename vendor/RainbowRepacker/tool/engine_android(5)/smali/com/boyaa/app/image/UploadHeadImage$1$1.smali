.class Lcom/boyaa/app/image/UploadHeadImage$1$1;
.super Ljava/lang/Object;
.source "UploadHeadImage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/image/UploadHeadImage$1;->onAfterUIRun()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/app/image/UploadHeadImage$1;

.field private final synthetic val$imageName:Ljava/lang/String;

.field private final synthetic val$strDicName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/app/image/UploadHeadImage$1;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/image/UploadHeadImage$1$1;->this$1:Lcom/boyaa/app/image/UploadHeadImage$1;

    iput-object p2, p0, Lcom/boyaa/app/image/UploadHeadImage$1$1;->val$imageName:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/app/image/UploadHeadImage$1$1;->val$strDicName:Ljava/lang/String;

    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 256
    iget-object v3, p0, Lcom/boyaa/app/image/UploadHeadImage$1$1;->this$1:Lcom/boyaa/app/image/UploadHeadImage$1;

    iget-object v3, v3, Lcom/boyaa/app/image/UploadHeadImage$1;->result:Lcom/boyaa/app/php/PHPResult;

    iget v3, v3, Lcom/boyaa/app/php/PHPResult;->code:I

    if-nez v3, :cond_0

    .line 257
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 258
    .local v1, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "Name"

    iget-object v4, p0, Lcom/boyaa/app/image/UploadHeadImage$1$1;->val$imageName:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    const-string v3, "Info"

    iget-object v4, p0, Lcom/boyaa/app/image/UploadHeadImage$1$1;->this$1:Lcom/boyaa/app/image/UploadHeadImage$1;

    iget-object v4, v4, Lcom/boyaa/app/image/UploadHeadImage$1;->result:Lcom/boyaa/app/php/PHPResult;

    iget-object v4, v4, Lcom/boyaa/app/php/PHPResult;->json:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    new-instance v0, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v0, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 261
    .local v0, "jsonUtil":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v0}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v2

    .line 262
    .local v2, "result":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v3

    iget-object v4, p0, Lcom/boyaa/app/image/UploadHeadImage$1$1;->val$strDicName:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    .end local v0    # "jsonUtil":Lcom/boyaa/util/JsonUtil;
    .end local v1    # "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "result":Ljava/lang/String;
    :goto_0
    return-void

    .line 264
    :cond_0
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v3

    iget-object v4, p0, Lcom/boyaa/app/image/UploadHeadImage$1$1;->val$strDicName:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
