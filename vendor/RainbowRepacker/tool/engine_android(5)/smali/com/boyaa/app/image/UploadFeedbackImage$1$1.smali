.class Lcom/boyaa/app/image/UploadFeedbackImage$1$1;
.super Ljava/lang/Object;
.source "UploadFeedbackImage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/image/UploadFeedbackImage$1;->onAfterUIRun()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/app/image/UploadFeedbackImage$1;


# direct methods
.method constructor <init>(Lcom/boyaa/app/image/UploadFeedbackImage$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1$1;->this$1:Lcom/boyaa/app/image/UploadFeedbackImage$1;

    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 233
    iget-object v7, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1$1;->this$1:Lcom/boyaa/app/image/UploadFeedbackImage$1;

    iget-object v7, v7, Lcom/boyaa/app/image/UploadFeedbackImage$1;->result:Lcom/boyaa/app/php/PHPResult;

    iget v7, v7, Lcom/boyaa/app/php/PHPResult;->code:I

    if-nez v7, :cond_0

    .line 234
    const/4 v1, 0x0

    .line 236
    .local v1, "isSave":I
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    iget-object v7, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1$1;->this$1:Lcom/boyaa/app/image/UploadFeedbackImage$1;

    iget-object v7, v7, Lcom/boyaa/app/image/UploadFeedbackImage$1;->result:Lcom/boyaa/app/php/PHPResult;

    iget-object v7, v7, Lcom/boyaa/app/php/PHPResult;->json:Ljava/lang/String;

    invoke-direct {v2, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 237
    .local v2, "jsonObject":Lorg/json/JSONObject;
    const-string v7, "ret"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 238
    .local v6, "ret":Lorg/json/JSONObject;
    const-string v7, "isSave"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 244
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .end local v6    # "ret":Lorg/json/JSONObject;
    :goto_0
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    .line 245
    .local v4, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "isSave"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    new-instance v3, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v3, v4}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 247
    .local v3, "jsonUtil":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v3}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v5

    .line 248
    .local v5, "result":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v7

    iget-object v8, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1$1;->this$1:Lcom/boyaa/app/image/UploadFeedbackImage$1;

    # getter for: Lcom/boyaa/app/image/UploadFeedbackImage$1;->this$0:Lcom/boyaa/app/image/UploadFeedbackImage;
    invoke-static {v8}, Lcom/boyaa/app/image/UploadFeedbackImage$1;->access$0(Lcom/boyaa/app/image/UploadFeedbackImage$1;)Lcom/boyaa/app/image/UploadFeedbackImage;

    move-result-object v8

    # getter for: Lcom/boyaa/app/image/UploadFeedbackImage;->strDicName:Ljava/lang/String;
    invoke-static {v8}, Lcom/boyaa/app/image/UploadFeedbackImage;->access$0(Lcom/boyaa/app/image/UploadFeedbackImage;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v5}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    .end local v1    # "isSave":I
    .end local v3    # "jsonUtil":Lcom/boyaa/util/JsonUtil;
    .end local v4    # "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "result":Ljava/lang/String;
    :goto_1
    return-void

    .line 239
    .restart local v1    # "isSave":I
    :catch_0
    move-exception v0

    .line 241
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 250
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "isSave":I
    :cond_0
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v7

    iget-object v8, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1$1;->this$1:Lcom/boyaa/app/image/UploadFeedbackImage$1;

    # getter for: Lcom/boyaa/app/image/UploadFeedbackImage$1;->this$0:Lcom/boyaa/app/image/UploadFeedbackImage;
    invoke-static {v8}, Lcom/boyaa/app/image/UploadFeedbackImage$1;->access$0(Lcom/boyaa/app/image/UploadFeedbackImage$1;)Lcom/boyaa/app/image/UploadFeedbackImage;

    move-result-object v8

    # getter for: Lcom/boyaa/app/image/UploadFeedbackImage;->strDicName:Ljava/lang/String;
    invoke-static {v8}, Lcom/boyaa/app/image/UploadFeedbackImage;->access$0(Lcom/boyaa/app/image/UploadFeedbackImage;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
