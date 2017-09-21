.class Lcom/boyaa/godsdk/core/GodSDKIAP$6;
.super Lcom/boyaa/godsdk/core/utils/HttpTask;
.source "GodSDKIAP.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKIAP;->createBareCodeOrderAndPay(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

.field private final synthetic val$activity:Landroid/app/Activity;

.field private final synthetic val$params:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    iput-object p3, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->val$activity:Landroid/app/Activity;

    iput-object p4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->val$params:Ljava/lang/String;

    .line 307
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/utils/HttpTask;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onPostExecute(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "response"    # Landroid/os/Bundle;

    .prologue
    const/16 v6, 0x4e84

    const/4 v5, -0x2

    .line 309
    if-nez p1, :cond_0

    .line 310
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;
    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDKIAP;->access$1(Lcom/boyaa/godsdk/core/GodSDKIAP;)Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v2

    const-string v3, "create order failed,maybe network is disconnected"

    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 311
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    .line 312
    const-string v3, "\u521b\u5efa\u8ba2\u5355\u5931\u8d25"

    .line 311
    invoke-virtual {v2, v6, v5, v3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->responseCallbackPay(IILjava/lang/String;)V

    .line 330
    :goto_0
    return-void

    .line 315
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/String;

    .line 316
    const-string v2, "http_body"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v2

    .line 317
    const-string v3, "UTF-8"

    .line 315
    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 318
    .local v1, "result":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v2

    .line 319
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "barecode \u8ba2\u5355\u4fe1\u606f\uff1a"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 320
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->val$activity:Landroid/app/Activity;

    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->val$params:Ljava/lang/String;

    # invokes: Lcom/boyaa/godsdk/core/GodSDKIAP;->dealOrderInfo(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v2, v3, v4, v1}, Lcom/boyaa/godsdk/core/GodSDKIAP;->access$3(Lcom/boyaa/godsdk/core/GodSDKIAP;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 322
    .end local v1    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 323
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 324
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;
    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDKIAP;->access$1(Lcom/boyaa/godsdk/core/GodSDKIAP;)Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "parse order response error:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 325
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 324
    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 326
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    .line 327
    const-string v3, "\u89e3\u6790\u8ba2\u5355\u53c2\u6570\u5f02\u5e38"

    .line 326
    invoke-virtual {v2, v6, v5, v3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->responseCallbackPay(IILjava/lang/String;)V

    goto :goto_0
.end method
