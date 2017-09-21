.class Lcom/boyaa/godsdk/core/GodSDKIAP$5;
.super Lcom/boyaa/godsdk/core/utils/HttpTask;
.source "GodSDKIAP.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKIAP;->createOrderAndPay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

.field private final synthetic val$activity:Landroid/app/Activity;

.field private final synthetic val$parameterMap:Ljava/util/HashMap;

.field private final synthetic val$pmode:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Landroid/content/Context;Ljava/util/HashMap;Ljava/lang/String;Landroid/app/Activity;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    iput-object p3, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->val$parameterMap:Ljava/util/HashMap;

    iput-object p4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->val$pmode:Ljava/lang/String;

    iput-object p5, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->val$activity:Landroid/app/Activity;

    .line 227
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/utils/HttpTask;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onPostExecute(Landroid/os/Bundle;)V
    .locals 14
    .param p1, "response"    # Landroid/os/Bundle;

    .prologue
    .line 229
    if-nez p1, :cond_0

    .line 230
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;
    invoke-static {v10}, Lcom/boyaa/godsdk/core/GodSDKIAP;->access$1(Lcom/boyaa/godsdk/core/GodSDKIAP;)Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v10

    const-string v11, "create order failed,maybe network is disconnected"

    invoke-virtual {v10, v11}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 231
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    const/16 v11, 0x4e84

    .line 232
    const/4 v12, -0x2

    const-string v13, "\u521b\u5efa\u8ba2\u5355\u5931\u8d25"

    .line 231
    invoke-virtual {v10, v11, v12, v13}, Lcom/boyaa/godsdk/core/GodSDKIAP;->responseCallbackPay(IILjava/lang/String;)V

    .line 277
    :goto_0
    return-void

    .line 235
    :cond_0
    :try_start_0
    new-instance v7, Ljava/lang/String;

    .line 236
    const-string v10, "http_body"

    invoke-virtual {p1, v10}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v10

    .line 237
    const-string v11, "UTF-8"

    .line 235
    invoke-direct {v7, v10, v11}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 238
    .local v7, "result":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "\u8ba2\u5355\u4fe1\u606f\uff1a"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 239
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 240
    .local v3, "json":Lorg/json/JSONObject;
    const-string v10, "RET"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 241
    .local v8, "ret":Ljava/lang/String;
    const-string v10, "MSG"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 242
    .local v9, "retmsg":Ljava/lang/String;
    const-string v10, "0"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 247
    const-string v10, "ORDER"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 248
    .local v4, "order":Ljava/lang/String;
    const-string v10, "PAMOUNT"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 250
    .local v6, "pamount":Ljava/lang/String;
    const-string v10, "EXT"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 251
    .local v2, "ext":Ljava/lang/String;
    const-string v10, "PMODE"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 257
    .local v0, "OrderPmode":Ljava/lang/String;
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->val$parameterMap:Ljava/util/HashMap;

    const-string v11, "order"

    invoke-virtual {v10, v11, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->val$parameterMap:Ljava/util/HashMap;

    const-string v11, "ext"

    invoke-virtual {v10, v11, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->val$parameterMap:Ljava/util/HashMap;

    const-string v11, "pmode"

    iget-object v12, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->val$pmode:Ljava/lang/String;

    invoke-virtual {v10, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    new-instance v10, Lorg/json/JSONObject;

    iget-object v11, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->val$parameterMap:Ljava/util/HashMap;

    invoke-direct {v10, v11}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 263
    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    .line 264
    .local v5, "orderParams":Ljava/lang/String;
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    iget-object v11, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->val$activity:Landroid/app/Activity;

    # invokes: Lcom/boyaa/godsdk/core/GodSDKIAP;->pay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v10, v11, v5, v0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->access$2(Lcom/boyaa/godsdk/core/GodSDKIAP;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 270
    .end local v0    # "OrderPmode":Ljava/lang/String;
    .end local v2    # "ext":Ljava/lang/String;
    .end local v3    # "json":Lorg/json/JSONObject;
    .end local v4    # "order":Ljava/lang/String;
    .end local v5    # "orderParams":Ljava/lang/String;
    .end local v6    # "pamount":Ljava/lang/String;
    .end local v7    # "result":Ljava/lang/String;
    .end local v8    # "ret":Ljava/lang/String;
    .end local v9    # "retmsg":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 271
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 272
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;
    invoke-static {v10}, Lcom/boyaa/godsdk/core/GodSDKIAP;->access$1(Lcom/boyaa/godsdk/core/GodSDKIAP;)Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "parse order response error:"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 273
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    const/16 v11, 0x4e84

    .line 274
    const/4 v12, -0x2

    const-string v13, "\u89e3\u6790\u8ba2\u5355\u53c2\u6570\u5f02\u5e38"

    .line 273
    invoke-virtual {v10, v11, v12, v13}, Lcom/boyaa/godsdk/core/GodSDKIAP;->responseCallbackPay(IILjava/lang/String;)V

    goto/16 :goto_0

    .line 266
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "json":Lorg/json/JSONObject;
    .restart local v7    # "result":Ljava/lang/String;
    .restart local v8    # "ret":Ljava/lang/String;
    .restart local v9    # "retmsg":Ljava/lang/String;
    :cond_1
    :try_start_1
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;
    invoke-static {v10}, Lcom/boyaa/godsdk/core/GodSDKIAP;->access$1(Lcom/boyaa/godsdk/core/GodSDKIAP;)Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "create order failed:"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 267
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    const/16 v11, 0x4e84

    .line 268
    const/4 v12, -0x2

    .line 267
    invoke-virtual {v10, v11, v12, v9}, Lcom/boyaa/godsdk/core/GodSDKIAP;->responseCallbackPay(IILjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method
