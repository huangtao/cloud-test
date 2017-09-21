.class Lcom/boyaa/godsdk/core/GodSDKLocation$5;
.super Ljava/lang/Object;
.source "GodSDKLocation.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKLocation;->requestStopLocation(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKLocation;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKLocation;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKLocation$5;->this$0:Lcom/boyaa/godsdk/core/GodSDKLocation;

    .line 256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 260
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 261
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 262
    const v1, 0x15ff5

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 263
    const-string v1, "stopLocate\u5f02\u5e38"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 264
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKLocation$5;->this$0:Lcom/boyaa/godsdk/core/GodSDKLocation;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKLocation;->access$0(Lcom/boyaa/godsdk/core/GodSDKLocation;)Lcom/boyaa/godsdk/callback/LocationListener;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-interface {v1, v0, v2, v3}, Lcom/boyaa/godsdk/callback/LocationListener;->onFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V

    .line 265
    return-void
.end method
