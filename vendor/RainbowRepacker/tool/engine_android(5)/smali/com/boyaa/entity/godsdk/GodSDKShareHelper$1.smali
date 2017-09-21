.class Lcom/boyaa/entity/godsdk/GodSDKShareHelper$1;
.super Ljava/lang/Object;
.source "GodSDKShareHelper.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/ShareListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->initListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/GodSDKShareHelper;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper$1;->this$0:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "action"    # I

    .prologue
    .line 90
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper$1;->this$0:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    const/4 v1, 0x0

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->onGetShareResult(ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    invoke-static {v0, v1, p2, p1}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->access$0(Lcom/boyaa/entity/godsdk/GodSDKShareHelper;ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    .line 91
    return-void
.end method

.method public onComplete(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "action"    # I

    .prologue
    .line 78
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper$1;->this$0:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    const/4 v1, 0x1

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->onGetShareResult(ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    invoke-static {v0, v1, p2, p1}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->access$0(Lcom/boyaa/entity/godsdk/GodSDKShareHelper;ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    .line 80
    return-void
.end method

.method public onError(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "action"    # I

    .prologue
    .line 67
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper$1;->this$0:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    const/4 v1, 0x0

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->onGetShareResult(ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    invoke-static {v0, v1, p2, p1}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->access$0(Lcom/boyaa/entity/godsdk/GodSDKShareHelper;ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    .line 68
    return-void
.end method
